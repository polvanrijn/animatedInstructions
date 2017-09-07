function w = respBoxFingerAnimation(w, rect, scale, padding, model, keyPressed, keys, dir, fingerType, waitDuration, moveSpeed)
% waitDuration = time in secs to display the pressed button
% moveSpeed = how quick the finger moves

if ~strcmp(fingerType, 'longFinger')
    error('Currently only the fingerType longFinger is supported')
end

[hCenter, vCenter] = getCenterOfPressedButton(model, scale, padding, keyPressed);

if ~isempty(keyPressed) && keyPressed ~= 0
    % explanation: total width of figure is 24 multiplied by the total scale, the lower point of the figure will therefore be the top + the scaled with * the height/width ratio
end

[w, size, ~] = drawResponseBox(w, rect, 2, padding, 1, 0, keys, dir);
Screen(w, 'Flip');

imageArray = Screen('GetImage', w, size);
imwrite(imageArray, 'respboxOff.jpg');

[w, size, ~] = drawResponseBox(w, rect, 2, padding, 1, keyPressed, keys, dir);
Screen(w, 'Flip');

imageArray = Screen('GetImage', w, size);
imwrite(imageArray, 'respboxOn.jpg');

i = rect(4);
while i > vCenter
    i = i - moveSpeed;
    w = createTexture(w, 'respboxOff.jpg', size, 0);
    w = createTexture(w, [dir.img, 'longFinger.png'], [hCenter-12*scale, i, hCenter+12*scale, (i+24*scale*9.6)], 1);
    Screen('Flip', w);
end
    w = createTexture(w, 'respboxOn.jpg', size, 0);
    w = createTexture(w, [dir.img, 'longFinger.png'], [hCenter-12*scale, i, hCenter+12*scale, (i+24*scale*9.6)], 1);
    Screen('Flip', w);

    WaitSecs(waitDuration);


while i < rect(4)
    i = i + moveSpeed;
    w = createTexture(w, 'respboxOn.jpg', size, 0);
    w = createTexture(w, [dir.img, 'longFinger.png'], [hCenter-12*scale, i, hCenter+12*scale, (i+24*scale*9.6)], 1);
    Screen('Flip', w);
end
