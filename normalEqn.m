function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------

% 正規方程公式: θ = (XT * X)^-(1) * XT * y
% 直接照公式處理即可

theta = pinv(X' * X) * X' * y;

% -------------------------------------------------------------


% ============================================================

end
