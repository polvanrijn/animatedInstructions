function w = drawJustifiedTextBasic(string, size, style, color, line_height, rect, display_width, w)
% DRAWJUSTIFIEDTEXTBASIC displays justified text.
%   w = drawJustifiedTextBasic('hey', 30, 1, 2, 0.8, rect(3), w) displays
%   'hey' in a font size of 30px in italic (1), with a line_height of 2, in the color on
%   80% of the screen, given the height and width of the screen (rect) and
%   the window itself (w).
%
%   Defaults: font family Arial, font ratio for Mac and Windows

% calculate max segment length
full_width = rect(3);
border = full_width * (1-display_width)/2;
topMargin = 1 + border;
displayedPixels = full_width * display_width;

% default settings
font_family = 'Arial';
if ismac
    font_ratio = 0.5;
else
    font_ratio = 0.65;
end

if ismac == 0
    Screen(w,'TextFont', font_family);
end


Screen('TextSize', w, size);
Screen('TextStyle', w, style);
horizontal_range_letter = floor(displayedPixels/(size*font_ratio));

DrawFormattedText(w, string, border, topMargin, color, horizontal_range_letter, [], [], line_height, [], [border 40 rect(3) rect(4)]);
