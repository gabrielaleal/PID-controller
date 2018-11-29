% b = 100 N . s/m | m = 1000kg
b = 100;
m = 1000;

% PID parameters
Kp = 350;
Kd = 300;
Ki = 30;

l = 20*ones(50,1).'; % aux vector
n = 40*ones(50,1).'; % aux vector
u = cat(2, l, n);
%{
  using the vector u we change the wanted speed
  in the middle of the interval
%}

s = tf('s');
P = 1/(m*s+b); % transfer function (plant)
C = pid(Kp, Ki, Kd); % controller

sys = series(C, P); % since the controller and the plant are in series

T = feedback(sys,1, -1); % we obtained the feedback system

% plot graph
t = 0.5 : 0.5 : 50; % interval
lsim(T, u, t);