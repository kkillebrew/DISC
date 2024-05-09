%%
% Use PPD variables for different screens
% Resolution 2560x1440
% 57 cm viewing distance
% 42.61 PPD 27in (68.6cm) monitors

ListenChar(2);

PPD = 42.6;
backColor = 128;   % color of background
squareColor = 64;    % color of square
barColor = 0;          % color of bar
varROG = 5;      % rate of growth of square (PPD/varROG)
varOSS = 6;         % original square size ratio (in PPD)
varFSS = varOSS*5.5;         % ratio size of final square to original square (in PPD)
originalSquareSize = varOSS*PPD;
finalSquareSize = varFSS*PPD;
rateOfGrowth = PPD/varROG;
iterations = (varFSS-varOSS)*varROG;    % common denominator in order to keep square growth and movement consistant

% Bar growth variable defaults
xGrowth = 0;
yGrowth = 0;

escape = KbName('escape');
left = KbName('leftarrow');
right = KbName('rightarrow');
down = KbName('downarrow');
up = KbName('uparrow');
vertical = KbName('v');
horizontal = KbName('h');
center = KbName('c');
default = KbName('d');

[w,rect]=Screen('OpenWindow', 0,[backColor backColor backColor]);
x0 = rect(3)/2;% screen center
y0 = rect(4)/2;

% Square variables Regular Condition
xSquare = (x0/2) - originalSquareSize/2;   % Upper left x coord of square
ySquare = (y0/2) - originalSquareSize/2;   % Upper left y coord of square
xFSquare =(x0) - finalSquareSize/2;         %Upper left x coord of final square
yFSquare =(y0) - finalSquareSize/2;         %Upper left y coord of final square
xDistance = xFSquare - xSquare;
yDistance = yFSquare - ySquare;
xTrans = (xDistance)/iterations;
yTrans = (yDistance)/iterations;

% Bar distance variables for default condition Regular Condition
barHeight = PPD;     % height of bar
barLength = originalSquareSize/2;    % length of bar
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

% Fixation distance variables Regular Condition
xFix = x0/2;
yFix = y0/2;
xFixDistance = x0 - xFix;
yFixDistance = y0 - yFix;
xFixTrans = xFixDistance/iterations;
yFixTrans = yFixDistance/iterations;

% Square vairables Bottom Condition


% rectTexture = Screen('MakeTexture',w,0);
[keyisdown, secs, keycode] = KbCheck;
while (~(keycode(escape)))
    
    for i=1:iterations
        destRectSquare = [xSquare, ySquare, xSquare + originalSquareSize, ySquare + originalSquareSize];        %   Tells you where the rectangle is/should be.
        Screen('FillRect',w,[squareColor squareColor squareColor],destRectSquare);
        
        destRectBar = [(xBar+5-xGrowth), ((yBar+(varOSS*PPD))-(barHeight+5)-yGrowth), (xBar-5+barLength+xGrowth), ((yBar+(varOSS*PPD))-5+yGrowth)];        %   Tells you where the rectangle is/should be.
        Screen('FillRect',w,[barColor barColor barColor],destRectBar);
        
        Screen('FillOval',w, [0 256 0], [xFix-4, yFix-4, xFix+4, yFix+4]);      % fixation
        Screen('Flip',w); %Flip
        
        originalSquareSize = originalSquareSize + rateOfGrowth;
        
        ySquare = ySquare + yTrans;
        xSquare = xSquare + xTrans;
        
        xBar = xBar + xBarTrans;
        yBar = yBar + yBarTrans;
        
        xFix = xFix + xFixTrans;
        yFix = yFix + yFixTrans;
        
        % Escape
        [keyisdown, secs, keycode] = KbCheck;
        if keycode(escape)
            break;
        end
        
        % Variables to grow and shrink the bar
        if keycode(up) && ((xBar-5+barLength+xGrowth)-(xBar+5-xGrowth)) <= finalSquareSize - 10
            xGrowth=xGrowth+2;
        end
        if keycode(down) && ((xBar-5+barLength+xGrowth)-(xBar+5-xGrowth)) > 10
            xGrowth=xGrowth-2;
        end
        if keycode(right) && (((yBar+(varOSS*PPD))-5+yGrowth)-((yBar+(varOSS*PPD))-(barHeight+5)-yGrowth)) <= finalSquareSize - 10
            yGrowth=yGrowth+2;
        end
        if keycode(left) && (((yBar+(varOSS*PPD))-5+yGrowth)-((yBar+(varOSS*PPD))-(barHeight+5)-yGrowth)) > 10
            yGrowth=yGrowth-2;
        end
    end
    
    for i=1:iterations
        
        destRectSquare = [xSquare, ySquare, xSquare + originalSquareSize, ySquare + originalSquareSize];        %   Tells you where the rectangle is/should be.
        Screen('FillRect',w,[squareColor squareColor squareColor],destRectSquare);
        
        destRectBar = [(xBar+5-xGrowth), ((yBar+(varOSS*PPD))-(barHeight+5)-yGrowth), (xBar-5+barLength+xGrowth), ((yBar+(varOSS*PPD))-5+yGrowth)];        %   Tells you where the rectangle is/should be.
        Screen('FillRect',w,[barColor barColor barColor],destRectBar);
        
        Screen('FillOval',w, [0 256 0], [xFix-4, yFix-4, xFix+4, yFix+4]);      % fixation
        Screen('Flip',w); %Flip
        
        originalSquareSize = originalSquareSize - rateOfGrowth;
        
        ySquare = ySquare - yTrans;
        xSquare = xSquare - xTrans;
        
        xBar = xBar - xBarTrans;
        yBar = yBar - yBarTrans;
        
        xFix = xFix - xFixTrans;
        yFix = yFix - yFixTrans;
        
        % Changing conditions
        [keyisdown, secs, keycode] = KbCheck;
        if keycode(escape)
            break;
        end
        
        % Variables to grow and shrink the bar
        if keycode(up) && ((xBar-5+barLength+xGrowth)-(xBar+5-xGrowth)) <= finalSquareSize - 10
            xGrowth=xGrowth+2;
        end
        if keycode(down) && ((xBar-5+barLength+xGrowth)-(xBar+5-xGrowth)) > 10
            xGrowth=xGrowth-2;
        end
        if keycode(right) && (((yBar+(varOSS*PPD))-5+yGrowth)-((yBar+(varOSS*PPD))-(barHeight+5)-yGrowth)) <= finalSquareSize - 10
            yGrowth=yGrowth+2;
        end
        if keycode(left) && (((yBar+(varOSS*PPD))-5+yGrowth)-((yBar+(varOSS*PPD))-(barHeight+5)-yGrowth)) > 10
            yGrowth=yGrowth-2;
        end
    end
    
    
    %  Vertical Condition
    if keycode(vertical)
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
    end
    
    % Horizontal Condition
    if keycode(horizontal)
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
    end
    
    % Center Condition
    if keycode(center)
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
    
    if keycode(default)
        % Bar distance variables for horizontal condition
        xGrowth = 0;
        yGrowth = 0;
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
    end
        
    
    [keyisdown, secs, keycode] = KbCheck;
end
ListenChar(0);
Screen('CloseAll');


