function h = plotCircle(x, y, r)
    % plot on the current focused figure
    hold on
    % theta makes a full circle from 0 to 2*pi radians
    fraction = 50;
    theta = 0 : pi / fraction : 2 * pi;
    % build the x-axis and y-axis vectors of points
    xs = r * cos(theta) + x;
    ys = r * sin(theta) + y;
    h = plot(xs, ys);
    hold off
endfunction