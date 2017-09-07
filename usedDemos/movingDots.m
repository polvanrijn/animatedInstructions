function imageArray = movingDots
% Produces a dynamic display and outputs an animated .gif record of the trial
imageArray={};

% try
Screen('Preference', 'SkipSyncTests', 1);
    [wPtr, rect] = Screen('OpenWindow', 1);
    
    HideCursor;
    Screen('FillRect', wPtr, 0);
    Screen(wPtr, 'Flip');

    %Animation parameters
    centre = rect(3)/2;
    dotDiameter = 50;
    yTop = 304; 
    amplitude = 300; 
    frequency = 1; 
    
    white = WhiteIndex(wPtr);

    % Draws the display to be turned into an image file
    start = GetSecs;
    while GetSecs < start + 2
        time = GetSecs-start;
        oval = centre + (amplitude * cos(frequency * time *(2*pi))); 
        
        ovalSpecs = [oval yTop oval+dotDiameter yTop+dotDiameter]';

        % You can try calling GetImage at this point prior to the call to
        % 'Flip'  and specifying the backbuffer

        Screen('FillOval', wPtr, white, ovalSpecs);
        Screen(wPtr, 'Flip');

        % Records the frame from front buffer and appends to the imageArray
        % matrix
        % Assumes a screen resolution of 1024x768; alter the rect coordinates
        % to change this
        imageArray = [imageArray; {Screen('GetImage', wPtr, [200 264 874 544])}];
    end

    ShowCursor;
    Screen('CloseAll');

    %Creates the .gif
    delayTime = 1/60; %Screen refresh rate of 60Hz
    for i = 1:length(imageArray)
        % Gifs can't take RBG matrices: they have to be specified with the
        % pixels as indices into a colormap
        % See the help for imwrite for more details
        [y, newmap] = cmunique(imageArray{i});

        %Creates a .gif animation - makes first frame, then appends the rest
        if i==1
            imwrite(y, newmap, 'Zero Phase.gif');
        else
            imwrite(y, newmap, 'Zero Phase.gif', 'DelayTime', delayTime, 'WriteMode', 'append');
        end
    end
% catch
    ShowCursor;
    Screen('CloseAll');
% end