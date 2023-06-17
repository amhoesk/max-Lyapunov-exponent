classdef Lyapunov_Exponent < handle
    %% REFERENCES
    % 1- Beaudette, Shawn M., et al. "On the use of a Euclidean norm function for the estimation of local 
    % dynamic stability from 3D kinematics using time-delayed Lyapunov analyses." Medical engineering & physics 38.10 (2016): 1139-1145.
    % 2- Rosenstein, Michael T., James J. Collins, and Carlo J. De Luca. "A practical method for 
    % calculating largest Lyapunov exponents from small data sets." Physica D: Nonlinear Phenomena 65.1-2 (1993): 117-134.
       
    %% EXAMPLE
%     dt = 0.01;
%     signal = Lyapunov_Exponent.sample_lorenz(40 , dt);
%     signal = Lyapunov_Exponent.normalize_Beaudette_2016(signal);
% 
%     signal.Name = "Lorenz system";
% 
%     objLyapunovExp = Lyapunov_Exponent(signal);
%     objLyapunovExp.embedingDimension = 3;
%     objLyapunovExp.reconstructionDelay = 11*dt;
%     objLyapunovExp.meanPeriod = 20*dt;
%     objLyapunovExp.maxTime = 300*dt;
%     objLyapunovExp.rangeShortLyE = [0, 2];
%     objLyapunovExp.prepare_for_lyapunov;
%     objLyapunovExp.calc_divergence([]);
%     objLyapunovExp.calc_lyapunov_exponent;
% 
%     objLyapunovExp.prepare_for_lyapunov;
%     objLyapunovExp.calc_lyapunov_exponent();
% 
%     figure; hdlaxsTD = axes;
%     objLyapunovExp.plot_reconstructed_trajectory(hdlaxsTD);
% 
%     figure; hdlaxsND = axes;
%     objLyapunovExp.plot_nearest_distance(hdlaxsND);
% 
%     figure; hdlaxsLE = axes;
%     objLyapunovExp.plot_divergence_curve(hdlaxsLE);
%     objLyapunovExp.shortLyExp


    %% CODE
    properties
        signal
        tdSignal % time delayed signal
        
        % inputs
        maxTime % the maximum time steps for which divergence is calculated
        reconstructionDelay
        embedingDimension
        
        % meanPeriod is the mean period of time series. We estimated the mean period as the reciprocal of the mean
        % frequency of the power spectrum although we expect any comparable estimate, 
        % e.g., using the median frequency of the magnitude spectrum, to yield equivalent results.
        meanPeriod
        
        
        rangeShortLyE % short Term Lyapunov Exponent Range
        rangeLongLyE % long Term Lyapunov Exponent Range
        
        % outputs
        pairDistance
        nearestDistance
        idxNearestDistance
        divergence
        
        shortLyExp % short Term Lyapunov Exponent
        longLyExp % longTermLyapunovExponent
    end
    
    properties (Dependent)
        dt
        vecTimeStep
        maxTimeStep
        meanPeriodStep
        reconstructionDelayStep
    end
    
    methods
        function obj = Lyapunov_Exponent(signal)
            obj.signal = signal;
        end
        
        function calc_lyapunov_exponent(obj)
            if ~isempty(obj.rangeShortLyE)
                obj.shortLyExp = calc_lyapunov_exponent_for_time_range(obj , obj.rangeShortLyE);
            end
            
            if ~isempty(obj.rangeLongLyE)
                obj.longLyExp = calc_lyapunov_exponent_for_time_range(obj , obj.rangeLongLyE);
            end
        end
        
        function out = calc_lyapunov_exponent_for_time_range(obj , rng)
            dt = obj.tdSignal.TimeInfo.Increment;
            t = obj.vecTimeStep * dt;
            
            [idxStart , idxEnd] = deal(find(t <= rng(1) , 1 , 'last') , find(t <= rng(2) , 1 , 'last'));
            
            out = polyfit(t(idxStart:idxEnd) , obj.divergence(idxStart:idxEnd) , 1);
        end
        
        function calc_divergence(obj, vecTime)
            if isempty(vecTime)
                vecJ = 1:(obj.tdSignal.Length - obj.maxTimeStep);
            else
                [~, vecJ] = arrayfun(@(t) min(abs(obj.tdSignal.Time - t)), vecTime);
            end

            obj.calc_divergence_at(reshape(vecJ, 1, []));
        end

        function calc_divergence_at(obj, vecJ)
            if isempty(obj.idxNearestDistance); obj.prepare_for_lyapunov; end
            
            y = obj.tdSignal.Data;
            fun_dist = @(i , j) vecnorm(y(i , :) - y(j , :) , 2 , 2);

            M = size(y , 1);

            vecJBar = reshape(obj.idxNearestDistance(vecJ), 1, []);
            
            diverge = zeros(size(obj.vecTimeStep));
            count = 1;
            for i = obj.vecTimeStep
                idxJ = vecJ + i;
                idxJBar = vecJBar + i;

                idxValid = idxJBar <= M & idxJ <= M;

                d = fun_dist(idxJ(idxValid) , idxJBar(idxValid));

                diverge(count) = mean(log(d));
                count = count + 1;
            end

            obj.divergence = diverge;
        end
        
        function prepare_for_lyapunov(obj)
            if any(isempty([obj.meanPeriod, obj.maxTime, obj.reconstructionDelay, obj.embedingDimension]))
                error('Object properties have not been assigned properly');
            end
                
            obj.time_delay_signal;
            obj.calc_nearest_distance;
        end

        function time_delay_signal(obj)
            data = obj.signal.Data;
            
            J = obj.reconstructionDelayStep;
            m = obj.embedingDimension;
            M = size(data , 1) - (m - 1) * J;

            y = [];
            for n = 0:m-1
                idxStart = 1 + n * J;
                idxEnd = idxStart + M - 1;
                y = [y , data(idxStart:idxEnd , :)];
            end
            
            obj.tdSignal = timeseries(y).setuniformtime('Interval' , obj.signal.TimeInfo.Increment);
        end
        
        function calc_nearest_distance(obj)
            y = obj.tdSignal.Data;
            M = size(y , 1);

            % The pairwise distance between observations i and j is in D((i-1)*(m-i/2)+j-i) for i≤j where m is the number of observations
            obj.pairDistance = pdist(y);
            
            vecJ = 1:M; % vecJ = 1:(M - obj.maxTimeStep);
            
            [idxND , ND] = deal(vecJ , vecJ);
            
            deltaProgress = 100 / vecJ(end);
            numChar = fprintf("Please wait... (%.1f%%)" , 0);
            for j = vecJ
                [idxND(j) , ND(j)] = obj.find_neighbor(M , j , obj.meanPeriodStep);
                
                valProgress = j / vecJ(end);
                if mod(valProgress * 100 , 1) < deltaProgress - eps
                    fprintf(repmat('\b' , 1 , numChar));
                    numChar = fprintf("Please wait... (%.0f%%)" , valProgress * 100);
                end
            end
            fprintf(repmat('\b' , 1 , numChar));
            
            [obj.idxNearestDistance , obj.nearestDistance] = deal(idxND , ND);
        end

        function [idxNeighbor , valMin] = find_neighbor(obj, M , j , meanPeriodStep)
            vec = 1:M;
            idxRow = min(vec , j);
            idxCol = max(vec , j);

            % The pairwise distance between observations i and j is in D((i-1)*(m-i/2)+j-i) for i≤j where m is the number of observations
            idxD = (idxRow - 1) .* (M - idxRow / 2) + idxCol - idxRow;

            idxValid = [1:(j - meanPeriodStep), (j + meanPeriodStep):M];

            d = obj.pairDistance(idxD(idxValid));

            [valMin , idxMin] = min(d);
            idxNeighbor = idxValid(idxMin);
        end
    end
    
    methods % plot data
        function plot_signal(obj, hdlaxs)
            plot(hdlaxs , obj.signal.Time , obj.signal.Data);
            ylabel(hdlaxs , obj.signal.Name);
            axis(hdlaxs , 'tight');
        end
        
        function hdlplot = plot_reconstructed_trajectory(obj , hdlaxs)
            if size(obj.tdSignal.Data , 2) == 2
                [x, y] = deal(obj.tdSignal.Data(:,1), obj.tdSignal.Data(:,2));
                hdlplot = plot(hdlaxs , x, y, '-k', 'LineWidth', 1);
            elseif size(obj.tdSignal.Data , 2) > 2
                [x,y,z] = deal(obj.tdSignal.Data(:,1), obj.tdSignal.Data(:,2), obj.tdSignal.Data(:,3));
                hdlplot = plot3(hdlaxs , x, y, z, '-k', 'LineWidth', 1);
                zlabel(hdlaxs , 'X(t + 2Td)');
                view(hdlaxs , [45  30]);
            end
            xlabel(hdlaxs , 'X(t)'); ylabel(hdlaxs , 'X(t + Td)');
            title(hdlaxs , "Reconstructed trajectory");
            axis(hdlaxs , 'tight');
        end
        
        function hdlplot = plot_nearest_distance(obj , hdlaxs)
            hdlplot = plot(hdlaxs , obj.nearestDistance);
            xlabel(hdlaxs , 'Data point number'); ylabel(hdlaxs , 'Euclidean distance');
            
            hdlaxs.YLim(1) = 0;
        end
        
        function hdlplot = plot_divergence_curve(obj , hdlaxs)
            hdlplot(1) = plot(hdlaxs , obj.vecTimeStep * obj.tdSignal.TimeInfo.Increment , obj.divergence);
            xlabel(hdlaxs , 'Time (s)'); ylabel(hdlaxs , '<ln(divergence)>');
            axis(hdlaxs, 'tight');
            
            if ~isempty(obj.shortLyExp)
                [x , y] = deal(obj.rangeShortLyE , polyval(obj.shortLyExp , obj.rangeShortLyE));
                hdlplot(2) = plot(hdlaxs , x , y , 'color', 'r');
                text(hdlaxs , mean(x) , mean(y), "\lambda_{max}^{short} = " + num2str(obj.shortLyExp(1), 2));
            end
            
            if ~isempty(obj.longLyExp)
                [x , y] = deal(obj.rangeLongLyE , polyval(obj.longLyExp , obj.rangeLongLyE));
                hdlplot(3) = plot(hdlaxs , x , y , 'color', 'r');
                text(hdlaxs , mean(x) , mean(y), "\lambda_{max}^{long} = " + num2str(obj.longLyExp(1), 2), 'VerticalAlignment', 'top');
            end
        end
    end
    
    methods % dependent properties
        function out = get.dt(obj)
            out = obj.signal.TimeInfo.Increment;
        end

        function out = get.vecTimeStep(obj)
            out = 0:obj.maxTimeStep;
        end

        function out = get.maxTimeStep(obj)
            out = obj.maxTime / obj.dt;
        end

        function out = get.meanPeriodStep(obj)
            out = obj.meanPeriod / obj.dt;
        end

        function out = get.reconstructionDelayStep(obj)
            out = obj.reconstructionDelay / obj.dt;
        end
    end
    
    methods (Static)
        function signal = sample_lorenz(tEnd , dt)
            if isempty(tEnd); tEnd = 55; end
            if isempty(dt); dt = 0.01; end
            
            tspan = 0:dt:tEnd;
            initVal = [1 ; 1 ; 1];
            [sigma , rho , beta] = deal(16 , 45.92 , 4);
            [~ , s] = ode45(@(t , s) diff_eq_lorenz(t , s , sigma , rho , beta) , tspan , initVal);

            % removing the first 5 sec transient part of the signal
            idx = 1:floor(5/dt);
            s(idx , :) = []; tspan(idx) = [];
            
            signal = timeseries(s , tspan , 'Name', 'Lorenz system').setuniformtime('Interval',dt);
            
            function ds = diff_eq_lorenz(t , s , sigma , rho , beta)
                ds = s;
                x = s(1); y = s(2); z = s(3);
                ds(1) = sigma * (y - x);
                ds(2) = x * (rho - z) - y;
                ds(3) = x * y - beta * z;
            end
        end
        
        function signal = sample_rossler(tEnd , dt)
            if isempty(tEnd); tEnd = 250; end
            if isempty(dt); dt = 0.1; end
            
            tspan = 0:dt:tEnd;
            initVal = [10 ; 10 ; 10];
            [a , b , c] = deal(0.15 , 0.2 , 10);
            [~ , s] = ode45(@(t , s) diff_eq_rossler(t , s , a , b , c) , tspan , initVal);

            % removing the first 50 sec transient part of the signal
            idx = 1:floor(50/dt);
            s(idx , :) = []; tspan(idx) = [];
            
            signal = timeseries(s , tspan , 'Name', 'Rossler system').setuniformtime('Interval',dt);
            
            function ds = diff_eq_rossler(t , s , a , b , c)
                ds = s;
                x = s(1); y = s(2); z = s(3);
                ds(1) = -y - z;
                ds(2) = x + a * y;
                ds(3) = b + z * (x - c);
            end
        end
        
        function signal = normalize_Beaudette_2016(signal)
            % de-mean
            signal.Data = signal.Data - mean(signal.Data);

            % add bias
%             signal.Data = signal.Data + (0.5) * (max(signal.Data) - min(signal.Data));
            signal.Data = signal.Data - min(signal.Data);
            
            % calculate N
            N = @(data) sqrt(sum(data.^2 , 2));
            signal.Data = N(signal.Data);
        end
    end
end

