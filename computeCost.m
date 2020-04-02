function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% 損失函數公式 J(θ) = 1/2m * sigma(i=1:m)(h(Xi) - yi)^2
% h(X) 就是將X的資料代入我們設定的計算公式後所得出的推估結果值
% y 則是資料中實際的結果值
% 兩值的差就是推估和實際值的誤差,為了避免誤差有正有負導致總誤差結果卻是極小值的問題,將誤差取平方
% 接著將每一項的誤差平方加總
% 最後將加總的誤差值 除以 (資料項數*2) 就能得出最後的損失函數值J
% J愈小,就表示我們設定的公式所得出的結果和實際結果的差距愈小,即表示我們設定的公式的可信任度很高

% p.s:最後除以2m 而不是除以m,主要是為了後面梯度下降時對J求導上計算比較便利
%     不過不管除以m還是2m,J愈小結果愈好的本質還是不變



% X     的格式   資料總數   * (特徵數+1)  +1是為了補θ0的項數值
% theta 的格式   (特徵數+1) * 1
% y     的格式   資料總數   * 1
% 矩陣運算(X * theta - y)就能剛好處理好每一項資料的誤差結果
% .^2 就是將矩陣每一項各自取平方, 如果只寫 ^2 會變成矩陣本身平方
% 最後將結果加總後除以(資料項數*2),即得J(θ)

J = sum((X * theta - y) .^ 2) / (2 * m);



% =========================================================================

end
