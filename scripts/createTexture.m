function w = createTexture(w, image, size, removeBackground)

if nargin < 4
    removeBackground = 0;
end

[box, ~, alpha] = imread(image);
if removeBackground == 1
    box(:, :, 4) = alpha;
end
texture1 = Screen('MakeTexture', w, box);
Screen('DrawTexture', w, texture1, [], size);