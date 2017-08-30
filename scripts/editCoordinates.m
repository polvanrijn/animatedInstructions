function coordinates = editCoordinates(coordinates, border)

for i = 1:4
    if i <= 2
        coordinates(i) = coordinates(i) + border(i);
    else
        coordinates(i) = coordinates(i) - border(i);
    end
end