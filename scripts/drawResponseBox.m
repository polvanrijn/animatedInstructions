function w = drawResponseBox(w, rect, scale, padding, model, keyPressed, buttonImageArray)
size = [0 0 507 331];
if model == 1
    % button 1-4 big buttons, left to right, up to down
    coordinates = [
        [132, 71, 211, 128]
        [296, 70, 374, 127]
        [132, 217, 211, 274]
        [296, 217, 374, 274]
        [26, 79, 79, 119]
        [26, 144, 79, 183]
        [427, 79, 480, 119]
        [427, 144, 480, 183]
        ];
    numButtons = 8;
else
    error('currently only model 1 is supported!!')
end

% increase whole image
size = size*scale;
coordinates = coordinates * scale;


% apply padding
size = addPadding(size, padding);

for i = 1:length(coordinates)
    coordinates(i, :) = addPadding(coordinates(i, :), padding);
end


% draw
w = createTexture(w, 'box.png', size, 1);

for button = 1:numButtons
    coordinate = [coordinates(button, 1), coordinates(button, 2), coordinates(button, 3), coordinates(button, 4)];
    if button <= 4
        % big button
        border = [14, 11, 16, 13];
        if keyPressed == button
            d = -1*20*scale;
            newCoordinate = editCoordinates(coordinate, [d, d, d, d]);
            w = createTexture(w, 'bigButtonOn.png', newCoordinate, 1);
            
        else
            w = createTexture(w, 'bigButton.png', coordinate, 1);
        end
    else
        % small button
        border = [10, 8, 13, 11];
        if keyPressed == button
            d = -1*14*scale;
            newCoordinate = editCoordinates(coordinate, [d, d, d, d]);
            w = createTexture(w, 'smallButtonOn.png', newCoordinate, 1);
        else
            w = createTexture(w, 'smallButton.png', coordinate, 1);
        end
    end
    
    border = border * scale;
    
    % draw custom button if specified
    if ~strcmp(buttonImageArray{button}, '')
        % edit cordinates
        coordinate = editCoordinates(coordinate, border);
        w = createTexture(w, buttonImageArray{button}, coordinate);
    end
end

