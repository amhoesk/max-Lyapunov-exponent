function matColor = material_design_colors()

    hex2rgb = @(hex) [hex2dec(hex(1:2))/255 , hex2dec(hex(3:4))/255 , hex2dec(hex(5:6))/255];

    % /* Red */
    matColor.red.default = 'f44336';
    matColor.red.d50 = 'ffebee';
    matColor.red.d100 = 'ffcdd2';
    matColor.red.d200 = 'ef9a9a';
    matColor.red.d300 = 'e57373';
    matColor.red.d400 = 'ef5350';
    matColor.red.d500 = 'f44336';
    matColor.red.d600 = 'e53935';
    matColor.red.d700 = 'd32f2f';
    matColor.red.d800 = 'c62828';
    matColor.red.d900 = 'b71c1c';
    matColor.red.a100 = 'ff8a80';
    matColor.red.a200 = 'ff5252';
    matColor.red.a400 = 'ff1744';
    matColor.red.a700 = 'd50000';

    % /* Pink */
    matColor.pink.default = 'e91e63';
    matColor.pink.d50 = 'fce4ec';
    matColor.pink.d100 = 'f8bbd0';
    matColor.pink.d200 = 'f48fb1';
    matColor.pink.d300 = 'f06292';
    matColor.pink.d400 = 'ec407a';
    matColor.pink.d500 = 'e91e63';
    matColor.pink.d600 = 'd81b60';
    matColor.pink.d700 = 'c2185b';
    matColor.pink.d800 = 'ad1457';
    matColor.pink.d900 = '880e4f';
    matColor.pink.a100 = 'ff80ab';
    matColor.pink.a200 = 'ff4081';
    matColor.pink.a400 = 'f50057';
    matColor.pink.a700 = 'c51162';

    % /* Purple */
    matColor.purple.default = '9c27b0';
    matColor.purple.d50 = 'f3e5f5';
    matColor.purple.d100 = 'e1bee7';
    matColor.purple.d200 = 'ce93d8';
    matColor.purple.d300 = 'ba68c8';
    matColor.purple.d400 = 'ab47bc';
    matColor.purple.d500 = '9c27b0';
    matColor.purple.d600 = '8e24aa';
    matColor.purple.d700 = '7b1fa2';
    matColor.purple.d800 = '6a1b9a';
    matColor.purple.d900 = '4a148c';
    matColor.purple.a100 = 'ea80fc';
    matColor.purple.a200 = 'e040fb';
    matColor.purple.a400 = 'd500f9';
    matColor.purple.a700 = 'aa00ff';

    % /* Deep Purple */
    matColor.deepPurple.default = '673ab7';
    matColor.deepPurple.d50 = 'ede7f6';
    matColor.deepPurple.d100 = 'd1c4e9';
    matColor.deepPurple.d200 = 'b39ddb';
    matColor.deepPurple.d300 = '9575cd';
    matColor.deepPurple.d400 = '7e57c2';
    matColor.deepPurple.d500 = '673ab7';
    matColor.deepPurple.d600 = '5e35b1';
    matColor.deepPurple.d700 = '512da8';
    matColor.deepPurple.d800 = '4527a0';
    matColor.deepPurple.d900 = '311b92';
    matColor.deepPurple.a100 = 'b388ff';
    matColor.deepPurple.a200 = '7c4dff';
    matColor.deepPurple.a400 = '651fff';
    matColor.deepPurple.a700 = '6200ea';

    % /* Indigo */
    matColor.indigo.default = '3f51b5';
    matColor.indigo.d50 = 'e8eaf6';
    matColor.indigo.d100 = 'c5cae9';
    matColor.indigo.d200 = '9fa8da';
    matColor.indigo.d300 = '7986cb';
    matColor.indigo.d400 = '5c6bc0';
    matColor.indigo.d500 = '3f51b5';
    matColor.indigo.d600 = '3949ab';
    matColor.indigo.d700 = '303f9f';
    matColor.indigo.d800 = '283593';
    matColor.indigo.d900 = '1a237e';
    matColor.indigo.a100 = '8c9eff';
    matColor.indigo.a200 = '536dfe';
    matColor.indigo.a400 = '3d5afe';
    matColor.indigo.a700 = '304ffe';

    % /* Blue */
    matColor.blue.default = '2196f3';
    matColor.blue.d50 = 'e3f2fd';
    matColor.blue.d100 = 'bbdefb';
    matColor.blue.d200 = '90caf9';
    matColor.blue.d300 = '64b5f6';
    matColor.blue.d400 = '42a5f5';
    matColor.blue.d500 = '2196f3';
    matColor.blue.d600 = '1e88e5';
    matColor.blue.d700 = '1976d2';
    matColor.blue.d800 = '1565c0';
    matColor.blue.d900 = '0d47a1';
    matColor.blue.a100 = '82b1ff';
    matColor.blue.a200 = '448aff';
    matColor.blue.a400 = '2979ff';
    matColor.blue.a700 = '2962ff';

    % /* Light Blue */
    matColor.lightBlue.default = '03a9f4';
    matColor.lightBlue.d50 = 'e1f5fe';
    matColor.lightBlue.d100 = 'b3e5fc';
    matColor.lightBlue.d200 = '81d4fa';
    matColor.lightBlue.d300 = '4fc3f7';
    matColor.lightBlue.d400 = '29b6f6';
    matColor.lightBlue.d500 = '03a9f4';
    matColor.lightBlue.d600 = '039be5';
    matColor.lightBlue.d700 = '0288d1';
    matColor.lightBlue.d800 = '0277bd';
    matColor.lightBlue.d900 = '01579b';
    matColor.lightBlue.a100 = '80d8ff';
    matColor.lightBlue.a200 = '40c4ff';
    matColor.lightBlue.a400 = '00b0ff';
    matColor.lightBlue.a700 = '0091ea';

    % /* Cyan */
    matColor.cyan.default = '00bcd4';
    matColor.cyan.d50 = 'e0f7fa';
    matColor.cyan.d100 = 'b2ebf2';
    matColor.cyan.d200 = '80deea';
    matColor.cyan.d300 = '4dd0e1';
    matColor.cyan.d400 = '26c6da';
    matColor.cyan.d500 = '00bcd4';
    matColor.cyan.d600 = '00acc1';
    matColor.cyan.d700 = '0097a7';
    matColor.cyan.d800 = '00838f';
    matColor.cyan.d900 = '006064';
    matColor.cyan.a100 = '84ffff';
    matColor.cyan.a200 = '18ffff';
    matColor.cyan.a400 = '00e5ff';
    matColor.cyan.a700 = '00b8d4';

    % /* Teal */
    matColor.teal.default = '009688';
    matColor.teal.d50 = 'e0f2f1';
    matColor.teal.d100 = 'b2dfdb';
    matColor.teal.d200 = '80cbc4';
    matColor.teal.d300 = '4db6ac';
    matColor.teal.d400 = '26a69a';
    matColor.teal.d500 = '009688';
    matColor.teal.d600 = '00897b';
    matColor.teal.d700 = '00796b';
    matColor.teal.d800 = '00695c';
    matColor.teal.d900 = '004d40';
    matColor.teal.a100 = 'a7ffeb';
    matColor.teal.a200 = '64ffda';
    matColor.teal.a400 = '1de9b6';
    matColor.teal.a700 = '00bfa5';

    % /* Green */
    matColor.green.default = '4caf50';
    matColor.green.d50 = 'e8f5e9';
    matColor.green.d100 = 'c8e6c9';
    matColor.green.d200 = 'a5d6a7';
    matColor.green.d300 = '81c784';
    matColor.green.d400 = '66bb6a';
    matColor.green.d500 = '4caf50';
    matColor.green.d600 = '43a047';
    matColor.green.d700 = '388e3c';
    matColor.green.d800 = '2e7d32';
    matColor.green.d900 = '1b5e20';
    matColor.green.a100 = 'b9f6ca';
    matColor.green.a200 = '69f0ae';
    matColor.green.a400 = '00e676';
    matColor.green.a700 = '00c853';

    % /* Light Green */
    matColor.lightGreen.default = '8bc34a';
    matColor.lightGreen.d50 = 'f1f8e9';
    matColor.lightGreen.d100 = 'dcedc8';
    matColor.lightGreen.d200 = 'c5e1a5';
    matColor.lightGreen.d300 = 'aed581';
    matColor.lightGreen.d400 = '9ccc65';
    matColor.lightGreen.d500 = '8bc34a';
    matColor.lightGreen.d600 = '7cb342';
    matColor.lightGreen.d700 = '689f38';
    matColor.lightGreen.d800 = '558b2f';
    matColor.lightGreen.d900 = '33691e';
    matColor.lightGreen.a100 = 'ccff90';
    matColor.lightGreen.a200 = 'b2ff59';
    matColor.lightGreen.a400 = '76ff03';
    matColor.lightGreen.a700 = '64dd17';

    % /* Lime */
    matColor.lime.default = 'cddc39';
    matColor.lime.d50 = 'f9fbe7';
    matColor.lime.d100 = 'f0f4c3';
    matColor.lime.d200 = 'e6ee9c';
    matColor.lime.d300 = 'dce775';
    matColor.lime.d400 = 'd4e157';
    matColor.lime.d500 = 'cddc39';
    matColor.lime.d600 = 'c0ca33';
    matColor.lime.d700 = 'afb42b';
    matColor.lime.d800 = '9e9d24';
    matColor.lime.d900 = '827717';
    matColor.lime.a100 = 'f4ff81';
    matColor.lime.a200 = 'eeff41';
    matColor.lime.a400 = 'c6ff00';
    matColor.lime.a700 = 'aeea00';

    % /* Yellow */
    matColor.yellow.default = 'ffeb3b';
    matColor.yellow.d50 = 'fffde7';
    matColor.yellow.d100 = 'fff9c4';
    matColor.yellow.d200 = 'fff59d';
    matColor.yellow.d300 = 'fff176';
    matColor.yellow.d400 = 'ffee58';
    matColor.yellow.d500 = 'ffeb3b';
    matColor.yellow.d600 = 'fdd835';
    matColor.yellow.d700 = 'fbc02d';
    matColor.yellow.d800 = 'f9a825';
    matColor.yellow.d900 = 'f57f17';
    matColor.yellow.a100 = 'ffff8d';
    matColor.yellow.a200 = 'ffff00';
    matColor.yellow.a400 = 'ffea00';
    matColor.yellow.a700 = 'ffd600';

    % /* Amber */
    matColor.amber.default = 'ffc107';
    matColor.amber.d50 = 'fff8e1';
    matColor.amber.d100 = 'ffecb3';
    matColor.amber.d200 = 'ffe082';
    matColor.amber.d300 = 'ffd54f';
    matColor.amber.d400 = 'ffca28';
    matColor.amber.d500 = 'ffc107';
    matColor.amber.d600 = 'ffb300';
    matColor.amber.d700 = 'ffa000';
    matColor.amber.d800 = 'ff8f00';
    matColor.amber.d900 = 'ff6f00';
    matColor.amber.a100 = 'ffe57f';
    matColor.amber.a200 = 'ffd740';
    matColor.amber.a400 = 'ffc400';
    matColor.amber.a700 = 'ffab00';

    % /* Orange */
    matColor.orange.default = 'ff9800';
    matColor.orange.d50 = 'fff3e0';
    matColor.orange.d100 = 'ffe0b2';
    matColor.orange.d200 = 'ffcc80';
    matColor.orange.d300 = 'ffb74d';
    matColor.orange.d400 = 'ffa726';
    matColor.orange.d500 = 'ff9800';
    matColor.orange.d600 = 'fb8c00';
    matColor.orange.d700 = 'f57c00';
    matColor.orange.d800 = 'ef6c00';
    matColor.orange.d900 = 'e65100';
    matColor.orange.a100 = 'ffd180';
    matColor.orange.a200 = 'ffab40';
    matColor.orange.a400 = 'ff9100';
    matColor.orange.a700 = 'ff6d00';

    % /* Deep Orange */
    matColor.deepOrange.default = 'ff5722';
    matColor.deepOrange.d50 = 'fbe9e7';
    matColor.deepOrange.d100 = 'ffccbc';
    matColor.deepOrange.d200 = 'ffab91';
    matColor.deepOrange.d300 = 'ff8a65';
    matColor.deepOrange.d400 = 'ff7043';
    matColor.deepOrange.d500 = 'ff5722';
    matColor.deepOrange.d600 = 'f4511e';
    matColor.deepOrange.d700 = 'e64a19';
    matColor.deepOrange.d800 = 'd84315';
    matColor.deepOrange.d900 = 'bf360c';
    matColor.deepOrange.a100 = 'ff9e80';
    matColor.deepOrange.a200 = 'ff6e40';
    matColor.deepOrange.a400 = 'ff3d00';
    matColor.deepOrange.a700 = 'dd2c00';

    % /* Brown */
    matColor.brown.default = '795548';
    matColor.brown.d50 = 'efebe9';
    matColor.brown.d100 = 'd7ccc8';
    matColor.brown.d200 = 'bcaaa4';
    matColor.brown.d300 = 'a1887f';
    matColor.brown.d400 = '8d6e63';
    matColor.brown.d500 = '795548';
    matColor.brown.d600 = '6d4c41';
    matColor.brown.d700 = '5d4037';
    matColor.brown.d800 = '4e342e';
    matColor.brown.d900 = '3e2723';

    % /* Grey */
    matColor.grey.default = '9e9e9e';
    matColor.grey.d50 = 'fafafa';
    matColor.grey.d100 = 'f5f5f5';
    matColor.grey.d200 = 'eeeeee';
    matColor.grey.d300 = 'e0e0e0';
    matColor.grey.d400 = 'bdbdbd';
    matColor.grey.d500 = '9e9e9e';
    matColor.grey.d600 = '757575';
    matColor.grey.d700 = '616161';
    matColor.grey.d800 = '424242';
    matColor.grey.d900 = '212121';

    % /* Blue Grey */
    matColor.blueGrey.default = '607d8b';
    matColor.blueGrey.d50 = 'eceff1';
    matColor.blueGrey.d100 = 'cfd8dc';
    matColor.blueGrey.d200 = 'b0bec5';
    matColor.blueGrey.d300 = '90a4ae';
    matColor.blueGrey.d400 = '78909c';
    matColor.blueGrey.d500 = '607d8b';
    matColor.blueGrey.d600 = '546e7a';
    matColor.blueGrey.d700 = '455a64';
    matColor.blueGrey.d800 = '37474f';
    matColor.blueGrey.d900 = '263238';

    % /* White / Black */
    matColor.white.default = 'ffffff';
    matColor.black.default = '000000';

    for cellLvl1 = transpose(fields(matColor))
        strLvl1 = cell2mat(cellLvl1);

        for cellLvl2 = transpose(fields(matColor.(strLvl1)))
            strLvl2 = cell2mat(cellLvl2);

            matColor.(strLvl1).(strLvl2) = hex2rgb(matColor.(strLvl1).(strLvl2));
        end
    end

    matColor.map = ...
       [matColor.blue.d900;
        matColor.blue.d800;
        matColor.blue.d700;
        matColor.blue.d600;
        matColor.blue.d500;
        matColor.blue.d400;
        matColor.blue.d300;
        matColor.blue.d200;
        matColor.blue.d100;
        matColor.blue.d50;
        matColor.white.default;
        matColor.red.d50;
        matColor.red.d100;
        matColor.red.d200;
        matColor.red.d300;
        matColor.red.d400;
        matColor.red.d500;
        matColor.red.d600;
        matColor.red.d700;
        matColor.red.d800;
        matColor.red.d900];
    
    i = 1;
    for color = ["blue", "red", "green", "grey", "orange", "cyan", "lime", "pink", "brown"]
        matColor.colorOrder(i, :) = matColor.(color).default;
        matColor.lineColor{i} = matColor.(color).d100;
        matColor.faceColors{i} = matColor.(color).d100;
        matColor.pointColors{i} = matColor.(color).d400;
        matColor.edgeColors{i} = matColor.(color).d700;
        matColor.textColors{i} = matColor.(color).d900;

        i = i + 1;
    end

    matColor.lineStyle = {'-', '--', '.-', ':', '-', '--', '-.', ':', '-', '--'};
    matColor.marker = {'o', 'd', 's', 'p', '^', 'h', 'o', 'd' 's', 'p'};
end