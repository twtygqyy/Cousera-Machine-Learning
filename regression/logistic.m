x = load('ex4x.dat');
y = load('ex4y.dat');

m = length(y); % store the number of training examples
x = [ones(m, 1), x]; % Add a column of ones to x

% find returns the indices of the
% rows meeting the specified condition
pos = find(y == 1); neg = find(y == 0);

% Assume the features are in the 2nd and 3rd
% columns of x
plot(x(pos, 2), x(pos,3), '+'); hold on
plot(x(neg, 2), x(neg, 3), 'o');

theta0=0;
theta1=0;
theta2=0;
theta=[theta0;theta1;theta2];

g = inline('1.0 ./ (1.0 + exp(-z))'); 
% Usage: To find the value of the sigmoid 
% evaluated at 2, call g(2)


xT=transpose(x);
for iter=1:15   
    z = x * theta;
    h = g(z);
    grad = (1/m).*x' * (h-y);
    H = (1/m).*x' * diag(h) * diag(1-h) * x;
    %J =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h));

    theta=theta-H\grad;
end

prob = 1 - g([1, 20, 80]*theta)

% Plot Newton's method result
% Only need 2 points to define a line, so choose two endpoints
plot_x = [min(x(:,2))-2,  max(x(:,2))+2];
% Calculate the decision boundary line
plot_y = (-1./theta(3)).*(theta(2).*plot_x +theta(1));
plot(plot_x, plot_y)
legend('Admitted', 'Not admitted', 'Decision Boundary')
hold off
