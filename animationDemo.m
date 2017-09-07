% A simple demo showing a button press on the response box

PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 1);
screenNum = max(Screen('Screens')); % set screen
Screen('Preference', 'VisualDebugLevel', 3);
[w, rect] = Screen('OpenWindow', screenNum, [100 100 100]);

Screen('BlendFunction', w, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


[~, dir.hostname]=system('hostname');

dir.wd = strrep(mfilename('fullpath'), mfilename('file'), '') ;


switch strcat(dir.hostname)
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

waitDuration = 0.5;
moveSpeed = 7;
keyPressed = 3;
w = respBoxFingerAnimation(w, rect, 2, [centerH, bottomV], 1, keyPressed, keys, dir, 'longFinger', waitDuration, moveSpeed);
w = respBoxFingerAnimation(w, rect, 2, [centerH, bottomV], 1, 1, keys, dir, 'longFinger', waitDuration, moveSpeed);

sca;