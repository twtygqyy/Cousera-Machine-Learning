x = load('ex3x.dat');
y = load('ex3y.dat');

m = length(y); % store the number of training examples
x = [ones(m, 1), x]; % Add a column of ones to x

% figure % open a new figure window
% plot(x, y, 'o');
% ylabel('Height in meters')
% xlabel('Age in years')

theta0=0;
theta1=0;
theta2=0;
%theta=[theta0;theta1;theta2];

alph=0.07;

xT=transpose(x);
theta=(xT*x)^-1*xT*y;
% for iter=1:500   
%     sum=0;
%     for i=1:m
%         theta=(xT*x)'*xT*y;        
%     end
%     theta=theta-alph/m*sum;
% end

hold on % Plot new data without clearing old plot
plot(x(:,2), x*theta, '-') % remember that x is now a matrix with 2 columns
                           % and the second column contains the time info
legend('Training data', 'Linear regression')


