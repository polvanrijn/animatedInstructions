function coordinates = addPadding(coordinates, border)

for i = 1:4
    if mod(i,2)
        % uneven number -> x-axis
        coordinates(i) = coordinates(i) + border(1);
    else
        % even number -> y-axis
        coordinates(i) = coordinates(i) + border(2);
    end
end