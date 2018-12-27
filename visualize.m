function visualize(uq, r_range, phi_range)
    %takes in matrix which is a list of points in polar coords.
    % columns are radius, phi, and z value
    % we'll convert to xyz and visualize
    
    points = separate(uq, r_range, phi_range);
    
    translated = zeros(size(points));
    
    for i = 1:length(points)
        r = points(i,1);
        th = points(i,2);
        translated(i,1) = real(r*cos(th));
        translated(i,2) = real(r*sin(th));
        translated(i,3) = abs(points(i,3));
    end
    
    x = translated(:,1);
    y = translated(:,2);
    z = translated(:,3);
    tri = delaunay(x,y);
    trisurf(tri,x,y,z)
end