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

% ��s�M��octave
clear ; close all; clc

%% ==================== Part 1: Basic Function ====================
% octave��l�m��
% �bwarmUpExercise.m return�@��5x5�����x�}(part1�@�~)

% Complete warmUpExercise.m
fprintf('Running warmUpExercise ... \n');
fprintf('5x5 Identity Matrix: \n');
warmUpExercise()

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ======================= Part 2: Plotting =======================
% ex1data1.txt�t��97*2�����
% �Ĥ@�C�O�����H�f��(���U�H)
% �ĤG�C�O���q(���U��)
% �H�U�N�Q�ξ����ǲߪ��覡�ӳB�z�o�����,���R�X�����H�f�Ʀ��h�֮�,�����i�H�o��h�֦��q

fprintf('Plotting Data ...\n')
% Ū��ex1data1.txt����ƨ�data
data = load('ex1data1.txt');
% ���odata�Ĥ@�C������(�x�})��X��
% ���odata�ĤG�C������(�x�})��y��
% m��y���� = ����`��
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m

% �bplotData.m�NX,y����ƥΤG���Ϫ��(part2�@�~)
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Cost and Gradient descent ===================

% h(x) = �c0 + �c1 * X1
% �N�c0���� �c0 * 1 = �c0 * X0
% X,�c�������Y�N�i�H�ର�ίx�}�B�z
% �]��X�e���[�@�CX0��(�ƭȬҬ�1)
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
% �ŧi�c
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
% �ŧi��פU���k�����N���ƩM�ǲ߲v
iterations = 1500;
alpha = 0.01;

% �����շl�����

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost

% �bcomputeCost.m�p��l�����(part3�@�~�@)
J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 32.07\n');

% �Ntheta�]��[-1 ; 2],�ӦA�״��շl����ƬO�_���T

% further testing of the cost function
J = computeCost(X, y, [-1 ; 2]);
fprintf('\nWith theta = [-1 ; 2]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 54.24\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

% �l����Ƨ�����N��}�l�i���פU��
% �bgradientDescent.m�i���פU��(part3�@�~�G)

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' -3.6303\n  1.1664\n\n');

% Plot the linear fit

% hold on : �O�d���e����,�~��ø�s�s�����e
% (�]���o��[�Fhold on,�bpart2�������ͪ��ϭY�b�����o��e�N�������ܷ|�X�{���~�T�� = �]���S����)
hold on; % keep previous plot visible

% x�b�������ƪ�x
% (�]���e�����F�x�}�B��ӧ�X�e���h�[�F�Ĥ@��X0��,�G�n���쥻��x��ƴN�o��X�x�}���ĤG�C����)
% y�b�h�OX���W�g�L��פU����D�X���stheta,�]�N�O�����ǲ߹L�᪺�w�����G
% '-'���O��ܵ��G�νu�s�_��
plot(X(:,2), X*theta, '-')
% legend���O�|���ϤW�s�W�@����ΥH�N�ϤW����T�[�W��r����
legend('Training data', 'Linear regression')
% hold off����hold on���O,���A�o�ϤW�~��ø�s��T
hold off % don't overlay any more plots on this figure

% ���յ��G
% 3.5,7�O���Ƥ��S�������]x��
% �ݬݥN�i�ǲ᪺߫theta���G�|�O�p��
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

% �ɥR: �N���������ǲߪ��D�n���G�c0,�c1�i����
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
% �c0�d���-10~10����100�ӵ����I
% �c1�d��� -1~4 ����100�ӵ����I
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
% �ŧi�ΨӦs�񵲪G���x�}
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals

% �Q��for�j��McomputeCost.m
% �p��e���]�w���c0,�c1, 100x100���զX�U�l����ƪ����G��
% �N���G�s��bJ_vals��
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped

% ���۷|��surf�����Oø�s�T�������
% ��surf���O�x�}���G�O�ݦC��,�ӫe��for�j��s���G�ɬO�s�檺
% �ҥH�n���令��m�x�}���G�~�|�������T
J_vals = J_vals';
% Surface plot
% �إߤ@�ӷs����(����e�����¹ϻ\��)
figure;
% �N�c0,�c1�M�������l����Ƶ��Gø�s���T�������
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% ø�s�����u��(�i���e�����T������ϨӤ��)
% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
% ø�s�������u���ȩ�logspace(-2, 3, 20) : 10^-2 ~ 10^3 ������20�ӵ����I
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
% �̫�bø�s�n�������u�ϤW�ά���x(rx)�Хܾ����ǲߺ�X��theta��m
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
