% The length of the crank and the slider in metres
a = 2; b = 5;
% Point P1
P1 = [0 0];
% Parameters of the plot
axis(gca, 'equal'); % The aspect ratio
axis([-2 7 -2 3]); % The limits

% The angular speed of the crank in rad/s
k = 1;

% Now comes the loop

for t=1:500 % t is the time in tenths of seconds
        theta = k*(t/10);
        % The point P2
        P2 = a*[cos(theta) sin(theta)];
        % The angle alpha
        alpha = asin(a*sin(theta)/b);
        % The point P3
        P3 = [(1*cos(theta) + b*cos(alpha)) 0];
        % The crank line
        crank = line([P1(1) P2(1)], [P1(2) P2(2)]);
        % The slider line
        slider = line([P2(1) P3(1)], [P2(2) P3(2)]);
        % The point P2 trajectory
        P2_traj = viscircles([0 0],a,'LineStyle','--');
        % The point P1, P2, and P3
        P1_circ = viscircles(P1,0.1);
        P2_circ = viscircles(P2,0.1);
        P3_circ = viscircles(P3, 0.1);
        % The interval time to update the plot (the lower the slower)
        pause(0.01);
        % Delete the previous line
        delete(crank);
        delete(P1_circ);
        delete(P2_circ);
        delete(slider);
        delete(P3_circ);
end