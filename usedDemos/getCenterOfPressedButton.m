function [hCenter, vCenter] = getCenterOfPressedButton(model, scale, padding, keyPressed)

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
coordinates = coordinates * scale;

for i = 1:length(coordinates)
    coordinates(i, :) = addPadding(coordinates(i, :), padding);
end


for button = 1:numButtons
    coordinate = [coordinates(button, 1), coordinates(button, 2), coordinates(button, 3), coordinates(button, 4)];
    if button <= 4
        % big button
        if keyPressed == button
            d = -1*20*scale;
            newCoordinate = editCoordinates(coordinate, [d, d, d, d]);            
        end
    else
        % small button
        if keyPressed == button
            d = -1*14*scale;
            newCoordinate = editCoordinates(coordinate, [d, d, d, d]);
        end
    end
    if keyPressed == button
        hCenter = getCenter(newCoordinate, 'h');
        vCenter = getCenter(newCoordinate, 'v');
    end
end