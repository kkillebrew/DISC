%%

orientationSwitch = [1 2 3];              % 1=horizontal, 2=vertical, 3=center
speedSwitch = [1 2 3 4 5];            % 1=slowest 7=fastest
growthRateSwitch = [1 2 3 4 5 6 7 8 9];    % 1=shortest 5=standard 9=longest
barSizeSwitch = [1 2 3 4 5];
square



switch orientationSwitch
    case 1
        % Bar distance variables for horizontal condition
        barHeight = PPD;     % height of bar
        barLength = originalSquareSize;    % length of bar
        xBar = xSquare;
        yBar = ySquare + originalSquareSize - barHeight;
        xFBar = x0 - (barLength/2);
        yFBar = (y0+finalSquareSize/2) - barHeight;
        xBarDistance = xFBar - xBar;
        yBarDistance = yFBar - yBar;
        xBarTrans = (xBarDistance/iterations);
        yBarTrans = (yBarDistance/iterations);
        xBar = xSquare;   % reseting xBar and yBar values for execution
        yBar = ySquare;
    case 2
        % Bar distance variables for vertical condition
        xGrowth = yGrowth;
        yGrowth = xGrowth;
        barHeight = originalSquareSize;     % height of bar
        barLength = PPD + 5;    % length of bar
        xBar = ((x0/2) - (originalSquareSize)/2) + (originalSquareSize) - barHeight;
        yBar = ((y0/2) - (originalSquareSize)/2);
        xFBar = (x0+finalSquareSize/2) - barHeight;
        yFBar = y0 - (barHeight/2);
        xBarDistance = xFBar - xBar;
        yBarDistance = yFBar - yBar;
        xBarTrans = (xBarDistance/iterations);
        yBarTrans = (yBarDistance/iterations);
        xBar = ((x0/2) - (originalSquareSize)/2) + (originalSquareSize) - barLength;   % reseting xBar and yBar values for execution
        yBar = ((y0/2) - (originalSquareSize)/2) + 5;
    case 3
        % Bar distance variables for central condition
        barHeight = PPD;     % height of bar
        barLength = originalSquareSize;    % length of bar
        xBar = xSquare;
        yBar = ySquare + originalSquareSize/2 - barHeight;
        xFBar = x0 - (barLength/2);
        yFBar = y0 - barHeight;
        xBarDistance = xFBar - xBar;
        yBarDistance = yFBar - yBar;
        xBarTrans = (xBarDistance/iterations);
        yBarTrans = (yBarDistance/iterations);
        xBar = xSquare;   % reseting xBar and yBar values for execution
        yBar = ySquare + barHeight/2 + 5 - originalSquareSize/2; 
end

switch barSizeSwitch
    case 1
        xBar = (xSquare/5);
    case 2
        xBar = (xSquare/5)*2;
    case 3
        xBar = (xSquare/5)*3;
    case 4
        xBar = (xSquare/5)*4;
    case 5
        xBar = xSquare;
end