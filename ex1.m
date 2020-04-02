%% Machine Learning Online Class - Exercise 1: Linear Regression

%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions
%  in this exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s
%

%% Initialization

% 刷新清空octave
clear ; close all; clc

%% ==================== Part 1: Basic Function ====================
% octave初始練習
% 在warmUpExercise.m return一個5x5的單位矩陣(part1作業)

% Complete warmUpExercise.m
fprintf('Running warmUpExercise ... \n');
fprintf('5x5 Identity Matrix: \n');
warmUpExercise()

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ======================= Part 2: Plotting =======================
% ex1data1.txt含有97*2筆資料
% 第一列是城市人口數(單位萬人)
% 第二列是收益(單位萬元)
% 以下將利用機器學習的方式來處理這筆資料,分析出城市人口數有多少時,市場可以得到多少收益

fprintf('Plotting Data ...\n')
% 讀取ex1data1.txt的資料到data
data = load('ex1data1.txt');
% 取得data第一列的元素(矩陣)到X中
% 取得data第二列的元素(矩陣)到y中
% m取y長度 = 資料總數
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m

% 在plotData.m將X,y的資料用二維圖表示(part2作業)
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Cost and Gradient descent ===================

% h(x) = θ0 + θ1 * X1
% 將θ0視為 θ0 * 1 = θ0 * X0
% X,θ間的關係就可以轉為用矩陣處理
% 因此X前面加一列X0項(數值皆為1)
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
% 宣告θ
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
% 宣告梯度下降法的迭代次數和學習率
iterations = 1500;
alpha = 0.01;

% 先測試損失函數

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost

% 在computeCost.m計算損失函數(part3作業一)
J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 32.07\n');

% 將theta設為[-1 ; 2],來再度測試損失函數是否正確

% further testing of the cost function
J = computeCost(X, y, [-1 ; 2]);
fprintf('\nWith theta = [-1 ; 2]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 54.24\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

% 損失函數完成後就能開始進行梯度下降
% 在gradientDescent.m進行梯度下降(part3作業二)

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' -3.6303\n  1.1664\n\n');

% Plot the linear fit

% hold on : 保留先前的圖,繼續繪製新的內容
% (因為這邊加了hold on,在part2部分產生的圖若在執行到這行前就關掉的話會出現錯誤訊息 = 因為沒有圖)
hold on; % keep previous plot visible

% x軸維持原資料的x
% (因為前面為了矩陣運算而把X前面多加了第一行X0項,故要取原本的x資料就得取X矩陣的第二列部分)
% y軸則是X乘上經過梯度下降後求出的新theta,也就是機器學習過後的預測結果
% '-'指令表示結果用線連起來
plot(X(:,2), X*theta, '-')
% legend指令會讓圖上新增一方塊用以將圖上的資訊加上文字說明
legend('Training data', 'Linear regression')
% hold off對應hold on指令,不再這圖上繼續繪製資訊
hold off % don't overlay any more plots on this figure

% 測試結果
% 3.5,7是原資料中沒有的假設x值
% 看看代進學習後的theta結果會是如何
% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: Visualizing J(theta_0, theta_1) =============

% 補充: 將此次機器學習的主要結果θ0,θ1可視化
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
% θ0範圍取-10~10之間100個等分點
% θ1範圍取 -1~4 之間100個等分點
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
% 宣告用來存放結果的矩陣
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals

% 利用for迴圈和computeCost.m
% 計算前面設定的θ0,θ1, 100x100的組合下損失函數的結果值
% 將結果存放在J_vals裡
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped

% 接著會用surf的指令繪製三維立體圖
% 但surf指令矩陣結果是看列的,而前面for迴圈存結果時是存行的
% 所以要先改成轉置矩陣結果才會對應正確
J_vals = J_vals';
% Surface plot
% 建立一個新的圖(不把前面的舊圖蓋掉)
figure;
% 將θ0,θ1和對應的損失函數結果繪製成三維立體圖
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% 繪製等高線圖(可拿前面的三維立體圖來比較)
% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
% 繪製的等高線取值於logspace(-2, 3, 20) : 10^-2 ~ 10^3 之間取20個等分點
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
% 最後在繪製好的等高線圖上用紅色x(rx)標示機器學習算出的theta位置
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
