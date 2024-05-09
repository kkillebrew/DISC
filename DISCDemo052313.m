%%
% Use PPD variables for different screens
% Resolution 2560x1440
% 57 cm viewing distance
% 42.61 PPD 27in (68.6cm) monitors

PPD = 42.6;
backColor = 128;   % color of background
squareColor = 64;    % color of square
barColor = 0;          % color of bar
varROG = 6;      % rate of growth of square (PPD/varROG)
varOSS = 6;         % original square size ratio (in PPD)
varFSS = varOSS*6;         % ratio size of final square to original square (in PPD)
originalSquareSize = varOSS*PPD;
finalSquareSize = varFSS*varOSS*PPD;
rateOfGrowth = PPD/varROG;
iterations = (varFSS-varOSS)*varROG;

% While using the 16:9 monitors use these translation ratios (in
% precentages)
xRes = 16;
yRes = 9;

escape = KbName('escape');

[w,rect]=Screen('OpenWindow', 0,[backColor backColor backColor]);
x0 = rect(3)/2;% screen center
y0 = rect(4)/2;

xSquare = (x0/2) - originalSquareSize/2;   % Upper left x coord of square
ySquare = (y0/2) - originalSquareSize/2;   % Upper left y coord of square

rectTexture = Screen('MakeTexture',w,0);
[keyisdown, secs, keycode] = KbCheck;
while (~(keycode(escape)))
    for i=1:iterations
        destRectSquare = [xSquare, ySquare, xSquare + originalSquareSize, ySquare + originalSquareSize];        %   Tells you where the rectangle is/should be.
        Screen('FillRect', w, [squareColor, squareColor, squareColor], destRectSquare);
        Screen('Flip',w); %Flip
        
        originalSquareSize = originalSquareSize + rateOfGrowth;
        
        distance = sqrt((((x0-2*originalSquareSize)/2)^2)+(((y0-2*originalSquareSize)/2)^2));
        xTrans = (distance)/iterations;
        yTrans = (distance)/iterations;
        
        ySquare = ySquare + yTrans;
        xSquare = xSquare + xTrans;
        
    end
    
    for i=1:iterations
        
        destRectSquare = [xSquare, ySquare, xSquare + originalSquareSize, ySquare + originalSquareSize];        %   Tells you where the rectangle is/should be.
        Screen('FillRect', w, [squareColor, squareColor, squareColor], destRectSquare);
        Screen('Flip',w); %Flip
        
        originalSquareSize = originalSquareSize - rateOfGrowth;
        
        distance = sqrt((((x0-2*originalSquareSize)/2)^2)+(((y0-2*originalSquareSize)/2)^2));
        xTrans = (distance)/iterations;
        yTrans = (distance)/iterations;
        
        ySquare = ySquare - yTrans;
        xSquare = xSquare - xTrans;
    end
    
    [keyisdown, secs, keycode] = KbCheck;
end
Screen('CloseAll');


