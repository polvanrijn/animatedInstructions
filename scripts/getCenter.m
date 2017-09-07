function center = getCenter(coordinate, axis)

if strcmp(axis, 'v')
    center = ((coordinate(4) - coordinate(2))/2) + coordinate(2);
elseif strcmp(axis, 'h')
    center = ((coordinate(3) - coordinate(1))/2) + coordinate(1);
else
    error('No such option!');
end