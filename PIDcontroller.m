% b = 100 N . s/m | m = 1000kg
b = 100;
m = 1000;

% PID parameters
Kp = 350;
Kd = 300;
Ki = 30;

s = tf('s');
P = 1/(m*s+b); % transfer function (plant)
C = pid(Kp, Ki, Kd); % controller

sys = series(C, P); % since the controller and the plant are in series

T = feedback(sys,1, -1);

% plot graph
t = 0 : 0.5 : 100; % interval
step(20*T, t) % as 20 means the speed we want to reach