%toggle position of rounded rectangle with 1-3
%adjust rounded rectangle size with arrow keys
%press escape to end

clear
datafile = input('Please Hit Enter','s');
ListenChar(2);
HideCursor;
[w,rect]=Screen('OpenWindow',0,[255 255 255]);
xc=rect(3)/2;
yc=rect(4)/2;

escape=KbName('escape');
one=KbName('1!');
two=KbName('2@');
three=KbName('3#');
four=KbName('4$');
five=KbName('5%');
six=KbName('6^');
seven=KbName('7&');
eight=KbName('8*');
nine=KbName('9(');
up=KbName('uparrow');
down=KbName('downarrow');
left=KbName('leftarrow');
right=KbName('rightarrow');
skey=KbName('s');
gkey=KbName('g');
bkey=KbName('b');
tkey=KbName('t');

%img=imread('man.jpg');
%t=Screen('MakeTexture',w,img);

textoffset=rect(3)-300;
scalelong=5;
scaleshort=.5;
thetex=1;

speed=7;

choice=1;
modx=0;
mody=0;
r=20;

stationary=0;
growing=2;
growthfactor=0;
big=1;
[keyisdown, secs, keycode] = KbCheck;
while ~keycode(escape)
    [keyisdown, secs, keycode] = KbCheck;
    for i=0:speed:xc/2
        [keyisdown, secs, keycode] = KbCheck;
        
        if keycode(escape)
            break
        elseif keycode(one)
            choice=1;
        elseif keycode(two)
            choice=2;
        elseif keycode(three)
            choice=3;
            
        elseif keycode(up)
            mody=mody+1;
        elseif keycode(down)
            mody=mody-1;
            if mody<=-r
                mody=-(r-1);
            end
        elseif keycode(right)
            modx=modx+1;
        elseif keycode(left)
            modx=modx-1;
            if modx<=-r
                modx=-(r-1);
            end
        end
        
        growthfactor=(3*i/4);
        
        Screen('FillRect',w,[128 128 128],[xc/2-(yc/3)+i-growthfactor,yc/2-(yc/3)+(i*yc/xc)-growthfactor,xc/2+(yc/3)+i+growthfactor,yc/2+(yc/3)+(i*yc/xc)+growthfactor]);
        Screen('FillOval',w,[0 0 0],[xc/2-4+i,yc/2-4+(i*yc/xc),xc/2+4+i,yc/2++4+(i*yc/xc)]);
        
        switch choice
            case 1
                thecenx=xc/2+(yc/3.5)+i+growthfactor;
                theceny=yc/2+(i*yc/xc);
            case 2
                thecenx=xc/2+i;
                theceny=yc/2+(yc/3.5)+(i*yc/xc)+growthfactor;
            case 3
                thecenx=xc/2+i;
                theceny=yc/2+(i*yc/xc);
        end
        
        
        xs1=thecenx-r-modx;
        xs2=thecenx+r+modx;
        ys1=theceny-(r*2)-mody;
        ys2=theceny+(r*2)+mody;
        
        xl1=thecenx-(r*2)-modx;
        xl2=thecenx+(r*2)+modx;
        yl1=theceny-r-mody;
        yl2=theceny+r+mody;
        
        xr=((xl2-xl1)-(xs2-xs1))/2;
        yr=((ys2-ys1)-(yl2-yl1))/2;
        
        Screen('FillRect',w,[0 0 0],[xs1,ys1,xs2,ys2]);
        Screen('FillRect',w,[0 0 0],[xl1,yl1,xl2,yl2]);
        
        Screen('FillOval',w,[0 0 0],[xs1-xr,yl1-yr,xs1+xr,yl1+yr]);
        Screen('FillOval',w,[0 0 0],[xs2-xr,yl1-yr,xs2+xr,yl1+yr]);
        Screen('FillOval',w,[0 0 0],[xs1-xr,yl2-yr,xs1+xr,yl2+yr]);
        Screen('FillOval',w,[0 0 0],[xs2-xr,yl2-yr,xs2+xr,yl2+yr]);
        Screen('Flip',w);
    end
    
    for i=xc/2:-speed:0
        [keyisdown, secs, keycode] = KbCheck;
        
        if keycode(escape)
            break
        elseif keycode(one)
            choice=1;
        elseif keycode(two)
            choice=2;
        elseif keycode(three)
            choice=3;
        elseif keycode(up)
            mody=mody+1;
        elseif keycode(down)
            mody=mody-1;
            if mody<=-r
                mody=-(r-1);
            end
        elseif keycode(right)
            modx=modx+1;
        elseif keycode(left)
            modx=modx-1;
            if modx<=-r
                modx=-(r-1);
            end
        end
        
        growthfactor=(3*i/4);
        Screen('FillRect',w,[128 128 128],[xc/2-(yc/3)+i-growthfactor,yc/2-(yc/3)+(i*yc/xc)-growthfactor,xc/2+(yc/3)+i+growthfactor,yc/2+(yc/3)+(i*yc/xc)+growthfactor]);
        Screen('FillOval',w,[0 0 0],[xc/2-4+i,yc/2-4+(i*yc/xc),xc/2+4+i,yc/2++4+(i*yc/xc)]);
        
        switch choice
            case 1
                thecenx=xc/2+(yc/3.5)+i+growthfactor;
                theceny=yc/2+(i*yc/xc);
            case 2
                thecenx=xc/2+i;
                theceny=yc/2+(yc/3.5)+(i*yc/xc)+growthfactor;
            case 3
                thecenx=xc/2+i;
                theceny=yc/2+(i*yc/xc);
        end
        
        
        xs1=thecenx-r-modx;
        xs2=thecenx+r+modx;
        ys1=theceny-(r*2)-mody;
        ys2=theceny+(r*2)+mody;
        
        xl1=thecenx-(r*2)-modx;
        xl2=thecenx+(r*2)+modx;
        yl1=theceny-r-mody;
        yl2=theceny+r+mody;
        
        xr=((xl2-xl1)-(xs2-xs1))/2;
        yr=((ys2-ys1)-(yl2-yl1))/2;
        
        Screen('FillRect',w,[0 0 0],[xs1,ys1,xs2,ys2]);
        Screen('FillRect',w,[0 0 0],[xl1,yl1,xl2,yl2]);
        
        Screen('FillOval',w,[0 0 0],[xs1-xr,yl1-yr,xs1+xr,yl1+yr]);
        Screen('FillOval',w,[0 0 0],[xs2-xr,yl1-yr,xs2+xr,yl1+yr]);
        Screen('FillOval',w,[0 0 0],[xs1-xr,yl2-yr,xs1+xr,yl2+yr]);
        Screen('FillOval',w,[0 0 0],[xs2-xr,yl2-yr,xs2+xr,yl2+yr]);
        Screen('Flip',w);
    end
end
ListenChar(0);
ShowCursor;
Screen('CloseAll');