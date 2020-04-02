%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
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
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

% 進階練習
% 處理多項特徵值的資料

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

% 拿來練習的資料檔案ex1data2.txt含47*3筆資料
% 第一列是房子坪數
% 第二列是房間數
% 第三列是房價
% 以下將利用機器學習的方式來處理這筆資料,分析出在已知坪數和房間數後預測房價可以賣多少

%% Load Data
data = load('ex1data2.txt');
% 這次特徵值有兩個,故第一列和第二列都屬於X
% (:, 1:2)即為取1~2整列的資料
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
% 先將頭10筆資料print出來確認是否有正確取得資料
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% 因為這次要處理的特徵值不只一個,且特徵值的數值範圍也有顯著差異
% 若不先將特徵值的資料進行處理就直接進行梯度下降的話
% 可能會需要迭代相當多次才能取得最佳的結果值,也甚至可能一直無法收斂(結果極容易被數值範圍很廣的特徵值所影響)
% 於是接著要先利用featureNormalize.m 進行特徵縮放(part1作業)

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
% 加上X0項
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

% 接著進行梯度下降
% 在computeCostMulti.m寫上可用於不只一項特徵值時的損失函數的程式
% 在gradientDescentMulti.m寫上可用於不只一項特徵值時的梯度下降的程式
% 先前computeCost.m, gradientDescent.m有寫好的話就可直接複製
fprintf('Running gradient descent ...\n');

% Choose some alpha value
% 決定學習率和迭代次數
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
% x軸取1 ~ 梯度下降時記錄的損失函數數量(其實也就等同於迭代次數)
% y軸取損失函數
% 用藍色線繪製出二維圖
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
price = 0; % You should change this

% 梯度下降處理完後進行測試,用1650坪,3房的資料來預測房價
% 因為特徵值有先進行特徵縮放,故測試時給的測試資料自然也要進行相同的特徵縮放後再預測

price = [1 (1650 - mu(1))/sigma(1) (3 - mu(2))/sigma(2)] * theta;

% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

% part2建議可以多嘗試幾組學習率來測試結果,並練習用hold on將結果畫在同一張二維圖上
% 於是下面部分進行code練習

fprintf('Plotting other alphaValue result...\n');

% 參考pdf的教學決定三個學習率
tAlphaSet = [0.03 0.1 0.3];
% 利用hold on指令讓接下來的結果都繪製在同一張二維圖上以方便判別不同學習率的差別
hold on;
% 利用for迴圈方式來逐一改變學習率
for cA = 1:length(tAlphaSet)
  % 初始化theta值
  tAtheta = zeros(3, 1);
  % theta用tAtheta, alpha用tAlphaSet(cA) (根據迴圈變數取值) 迭代次數依舊
  % 以此來進行梯度下降
  % 損失函數記錄在tA_J
  [tAtheta, tA_J] = gradientDescentMulti(X, y, tAtheta, tAlphaSet(cA), num_iters);
  % 將結果用線段畫在二維圖上  
  plot(1:numel(tA_J), tA_J, '-', 'LineWidth', 2);
endfor
% 圖上加上線段說明
legend('alpha = 0.01', 'alpha = 0.03', 'alpha = 0.1', 'alpha = 0.3');
hold off;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

% 接著嘗試用正規方程的方式直接取結果

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
% 這邊改用csvread讀取資料,csvread是用來載入以,分隔的矩陣(簡單說就是以csv檔的格式讀取資料)
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
% 在normalEqn.m 用正規方程的方式取得theta值
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = 0; % You should change this

% 和上面一樣將正規方程算出的theta值進行測試
% 因為正規方程不用進行特徵縮放,故直接將測試的資料乘上theta即可

price = [1 1650 3] * theta;

% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

