% slightly modified boilerplate -- non-fullscreen by default,
% and set the background color (no need for all the FillRects)
PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 1);
screenNum = max(Screen('Screens')); % set screen
Screen('Preference', 'VisualDebugLevel', 3);
[w, rect] = Screen('OpenWindow', screenNum, [100 100 100]);

Screen('BlendFunction', w, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


[~, p.dir.hostname]=system('hostname');

dir.wd = strrep(mfilename('fullpath'), mfilename('file'), '') ;


switch strcat(p.dir.hostname)
    case 'nro-mac-d-022' % Pol iMac
        input_device_number = 5;
        dir.img = [dir.wd,'/img/'];
        dir.scripts = [dir.wd,'/scripts/'];
        addpath(dir.scripts);
end


keyIsDown = 0;
marginBottom = 50;
centerH = (rect(3)/2) - 507;
centerV = (rect(4)/2) - 331;
bottomV = rect(4) - 2*331 - marginBottom;

b1 = [dir.img, 'ja.png'];
b2 = [dir.img, 'nein.png'];
b3 = [dir.img, 'rec.png'];
b4 = [dir.img, 'mute.png'];
b8 = [dir.img, 'next.png'];

keys = {b1, b2, b3, b4, '', '', '', b8};
% for i = 1:5
%     text = 'Sobald Sie bereit sind fuer die Aufnahme, druecken Sie die Taste mit dem Mikrophon-Symbol.';
%     w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 3, keys, dir);
%     w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
%     Screen('Flip', w);
%     WaitSecs(0.5);
%     w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
%     w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys, dir);
%     Screen('Flip', w);
%     WaitSecs(0.5);
% end

w = respBoxFingerAnimation(w, rect, 2, [centerH, bottomV], 1, 1, keys, dir, 'longFinger', 1, 1);

% animations:
% responsebox with clicking finger animation
% respBoxFingerAnimation(fingerType, waitDuration, moveSpeed)
%     - calculate center of pressedKey
%     - finger move into screen (for i = rect(4), yTop)
%     - activate key (e.g. WaitSecs(1))
%     - pull back finger (for i = yTop, rect(4))

% for i = 1:5
%     text = 'Sobald Sie den Satz fertig eingesprochen haben, druecken Sie die Taste mit dem durchgestrichenen Mikrophon-Symbol';
%     w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 4, keys, dir);
%     w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
%     Screen('Flip', w);
%     WaitSecs(0.5);
%     w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
%     w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys, dir);
%     Screen('Flip', w);
%     WaitSecs(0.5);
% end
% 
% text = 'Wenn Sie mit Ihrer Einsprechung unzufrieden sind, koennen Sie den Satz erneut einsprechen. Druecken Sie hierzu erneut auf die Taste mit dem Mikrofon, sprechen Sie den Satz noch einmal ein und druecken Sie danach wieder auf das durchgestrichene Mikrofon. ';
% w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
% w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys, dir);
% Screen('Flip', w);
% WaitSecs(5);
% 
% for i = 1:5
%     text = 'Es wird jeweils die letzte Einsprechung des Satzes verwendet. Ueber die Taste mit dem Pfeil-Symbol gelangen Sie zum naechsten Satz.';
%     w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 8, keys, dir);
%     w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
%     Screen('Flip', w);
%     WaitSecs(0.5);
%     w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
%     w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys, dir);
%     Screen('Flip', w);
%     WaitSecs(0.5);
% end

sca;