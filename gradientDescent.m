function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples

% 用來記錄每一次迭代後的損失函數
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % 梯度下降公式 θj := θj - (α/m) * sigma(i=1:m)(h(Xi) - yi)*xj
    % 梯度下降的目標是要求得損失函數J(θ)的結果為最小值時的theta值
    % 對J(θ)求偏導即取得損失函數的切線斜率
    % 再依學習率微調,讓θ隨切線方向迭代調整至J(θ)為最小值的情況
    % (sigma(i=1:m)(h(Xi) - yi)*xj) / m 就是J(θ)的偏導結果(x0 = 1)
    
    % X     的格式   資料總數   * (特徵數+1)  +1是為了補θ0的項數值
    % theta 的格式   (特徵數+1) * 1
    % y     的格式   資料總數   * 1
    % 依據格式將矩陣轉置,即可得出對應於theta格式的J(θ)偏導結果
    
    theta = theta - (alpha / m) * ((X * theta - y)' * X)' ;





    % ============================================================

    % Save the cost J in every iteration 
    % 將更新後的theta代入損失函數,將本次迭代結果記錄起來   
    J_history(iter) = computeCost(X, y, theta);

end

end
