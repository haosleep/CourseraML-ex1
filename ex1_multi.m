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

% �i���m��
% �B�z�h���S�x�Ȫ����

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

% ���ӽm�ߪ�����ɮ�ex1data2.txt�t47*3�����
% �Ĥ@�C�O�Фl�W��
% �ĤG�C�O�ж���
% �ĤT�C�O�л�
% �H�U�N�Q�ξ����ǲߪ��覡�ӳB�z�o�����,���R�X�b�w���W�ƩM�ж��ƫ�w���л��i�H��h��

%% Load Data
data = load('ex1data2.txt');
% �o���S�x�Ȧ����,�G�Ĥ@�C�M�ĤG�C���ݩ�X
% (:, 1:2)�Y����1~2��C�����
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
% ���N�Y10�����print�X�ӽT�{�O�_�����T���o���
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% �]���o���n�B�z���S�x�Ȥ��u�@��,�B�S�x�Ȫ��ƭȽd��]����ۮt��
% �Y�����N�S�x�Ȫ���ƶi��B�z�N�����i���פU������
% �i��|�ݭn���N�۷�h���~����o�̨Ϊ����G��,�]�Ʀܥi��@���L�k����(���G���e���Q�ƭȽd��ܼs���S�x�ȩҼv�T)
% ��O���ۭn���Q��featureNormalize.m �i��S�x�Y��(part1�@�~)

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
% �[�WX0��
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

% ���۶i���פU��
% �bcomputeCostMulti.m�g�W�i�Ω󤣥u�@���S�x�Ȯɪ��l����ƪ��{��
% �bgradientDescentMulti.m�g�W�i�Ω󤣥u�@���S�x�Ȯɪ���פU�����{��
% ���ecomputeCost.m, gradientDescent.m���g�n���ܴN�i�����ƻs
fprintf('Running gradient descent ...\n');

% Choose some alpha value
% �M�w�ǲ߲v�M���N����
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
% x�b��1 ~ ��פU���ɰO�����l����Ƽƶq(���]�N���P�󭡥N����)
% y�b���l�����
% ���Ŧ�uø�s�X�G����
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

% ��פU���B�z����i�����,��1650�W,3�Ъ���ƨӹw���л�
% �]���S�x�Ȧ����i��S�x�Y��,�G���ծɵ������ո�Ʀ۵M�]�n�i��ۦP���S�x�Y���A�w��

price = [1 (1650 - mu(1))/sigma(1) (3 - mu(2))/sigma(2)] * theta;

% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

% part2��ĳ�i�H�h���մX�վǲ߲v�Ӵ��յ��G,�ým�ߥ�hold on�N���G�e�b�P�@�i�G���ϤW
% ��O�U�������i��code�m��

fprintf('Plotting other alphaValue result...\n');

% �Ѧ�pdf���оǨM�w�T�Ӿǲ߲v
tAlphaSet = [0.03 0.1 0.3];
% �Q��hold on���O�����U�Ӫ����G��ø�s�b�P�@�i�G���ϤW�H��K�P�O���P�ǲ߲v���t�O
hold on;
% �Q��for�j��覡�ӳv�@���ܾǲ߲v
for cA = 1:length(tAlphaSet)
  % ��l��theta��
  tAtheta = zeros(3, 1);
  % theta��tAtheta, alpha��tAlphaSet(cA) (�ھڰj���ܼƨ���) ���N���ƨ���
  % �H���Ӷi���פU��
  % �l����ưO���btA_J
  [tAtheta, tA_J] = gradientDescentMulti(X, y, tAtheta, tAlphaSet(cA), num_iters);
  % �N���G�νu�q�e�b�G���ϤW  
  plot(1:numel(tA_J), tA_J, '-', 'LineWidth', 2);
endfor
% �ϤW�[�W�u�q����
legend('alpha = 0.01', 'alpha = 0.03', 'alpha = 0.1', 'alpha = 0.3');
hold off;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

% ���۹��եΥ��W��{���覡���������G

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
% �o����csvreadŪ�����,csvread�O�ΨӸ��J�H,���j���x�}(²�满�N�O�Hcsv�ɪ��榡Ū�����)
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
% �bnormalEqn.m �Υ��W��{���覡���otheta��
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = 0; % You should change this

% �M�W���@�˱N���W��{��X��theta�ȶi�����
% �]�����W��{���ζi��S�x�Y��,�G�����N���ժ���ƭ��Wtheta�Y�i

price = [1 1650 3] * theta;

% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

