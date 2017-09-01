function w = respBoxFingerAnimation(w, rect, scale, padding, model, keyPressed, buttonImageArray, dir, fingerType, waitDuration, moveSpeed)
% waitDuration = time in secs to display the pressed button
% moveSpeed = how quick the finger moves

if ~strcmp(fingerType, 'longFinger')
    error('Currently only the fingerType longFinger is supported')
end

[hCenter, vCenter] = getCenterOfPressedButton(model, scale, padding, keyPressed);

if ~isempty(keyPressed) && keyPressed ~= 0
    % explanation: total width of figure is 24 multiplied by the total scale, the lower point of the figure will therefore be the top + the scaled with * the height/width ratio
end

% responsebox with clicking finger animation
% respBoxFingerAnimation(fingerType, waitDuration, moveSpeed)
%     - calculate center of pressedKey
%     - finger move into screen (for i = rect(4), yTop)
for i = vCenter:rect(4)
    w = createTexture(w, [dir.img, 'longFinger.png'], [hCenter-12*scale, i, hCenter+12*scale, (i+24*scale*9.6)], 1);
    Screen('Flip', w);
end

w = createTexture(w, [dir.img, 'longFinger.png'], [hCenter-12*scale, vCenter, hCenter+12*scale, (vCenter+24*scale*9.6)], 1);
Screen('Flip', w);

%     - activate key (e.g. WaitSecs(1))
%     - pull back finger (for i = yTop, rect(4))