% slightly modified boilerplate -- non-fullscreen by default,
% and set the background color (no need for all the FillRects)
PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 1);
screenNum = max(Screen('Screens')); % set screen
Screen('Preference', 'VisualDebugLevel', 3);
[w, rect] = Screen('OpenWindow', screenNum, [100 100 100]);

Screen('BlendFunction', w, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% fade in instruction:
% Sobald Sie bereit sind f?r die Aufnahme, dr?cken Sie die Taste mit dem (microphone icon here)-Symbol.

% display screen
% 300???246
% w = createTexture(w, 'smallButton.png', [300 300 450 420]);

% % from http://pngimg.com/upload/cat_PNG100.png
% [box, ~, alpha] = imread('box.png');
% size(box)
% %% 2557 x 1993 x 3 (rgb)
% box(:, :, 4) = alpha;
%
% texture1 = Screen('MakeTexture', w, box);
% Screen('DrawTexture', w, texture1, [], [0 0 1000 700]);

[~, p.dir.hostname]=system('hostname');

switch strcat(p.dir.hostname)
    case 'nro-mac-d-022' % Pol iMac
        input_device_number = 5;
end


keyIsDown = 0;
marginBottom = 50;
centerH = (rect(3)/2) - 507;
centerV = (rect(4)/2) - 331;
bottomV = rect(4) - 2*331 - marginBottom;

% while keyIsDown == 0
%     % get response key push
%     if ismac == 1
%         [keyIsDown,p.t2, p.keyCode] = KbCheck(input_device_number);
%     else
%         [keyIsDown, p.t2, p.keyCode] = KbCheck;
%     end
keys = {'ja.png', 'nein.png', 'rec.png', 'mute.png', '', '', '', 'next.png'};
for i = 1:5
    text = 'Sobald Sie bereit sind fuer die Aufnahme, druecken Sie die Taste mit dem Mikrophon-Symbol.';
    w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 3, keys);
    w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
    Screen('Flip', w);
    WaitSecs(0.5);
    w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
    w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys);
    Screen('Flip', w);
    WaitSecs(0.5);
end

for i = 1:5
    text = 'Sobald Sie den Satz fertig eingesprochen haben, druecken Sie die Taste mit dem durchgestrichenen Mikrophon-Symbol';
    w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 4, keys);
    w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
    Screen('Flip', w);
    WaitSecs(0.5);
    w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
    w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys);
    Screen('Flip', w);
    WaitSecs(0.5);
end

text = 'Wenn Sie mit Ihrer Einsprechung unzufrieden sind, koennen Sie den Satz erneut einsprechen. Druecken Sie hierzu erneut auf die Taste mit dem Mikrofon, sprechen Sie den Satz noch einmal ein und druecken Sie danach wieder auf das durchgestrichene Mikrofon. ';
w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys);
Screen('Flip', w);
WaitSecs(5);

for i = 1:5
    text = 'Es wird jeweils die letzte Einsprechung des Satzes verwendet. Ueber die Taste mit dem Pfeil-Symbol gelangen Sie zum naechsten Satz.';
    w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 8, keys);
    w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
    Screen('Flip', w);
    WaitSecs(0.5);
    w = drawJustifiedTextBasic(text, 30, 0, [255, 255, 255], 2, rect, 0.8, w);
    w = drawResponseBox(w, rect, 2, [centerH, bottomV], 1, 0, keys);
    Screen('Flip', w);
    WaitSecs(0.5);
end


%
% [img, ~, alpha] = imread('chicken.png');
% size(img)
% img(:, :, 4) = alpha;
%
% texture2 = Screen('MakeTexture', w, img);
%
% Screen('DrawTexture', w, texture2, [], smallIm);
% Screen('Flip', w);
%
% WaitSecs(5)

sca;