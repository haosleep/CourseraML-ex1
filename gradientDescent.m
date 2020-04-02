function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples

% �ΨӰO���C�@�����N�᪺�l�����
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % ��פU������ �cj := �cj - (�\/m) * sigma(i=1:m)(h(Xi) - yi)*xj
    % ��פU�����ؼЬO�n�D�o�l�����J(�c)�����G���̤p�Ȯɪ�theta��
    % ��J(�c)�D���ɧY���o�l����ƪ����u�ײv
    % �A�̾ǲ߲v�L��,���c�H���u��V���N�վ��J(�c)���̤p�Ȫ����p
    % (sigma(i=1:m)(h(Xi) - yi)*xj) / m �N�OJ(�c)�����ɵ��G(x0 = 1)
    
    % X     ���榡   ����`��   * (�S�x��+1)  +1�O���F�ɣc0�����ƭ�
    % theta ���榡   (�S�x��+1) * 1
    % y     ���榡   ����`��   * 1
    % �̾ڮ榡�N�x�}��m,�Y�i�o�X������theta�榡��J(�c)���ɵ��G
    
    theta = theta - (alpha / m) * ((X * theta - y)' * X)' ;





    % ============================================================

    % Save the cost J in every iteration 
    % �N��s�᪺theta�N�J�l�����,�N�������N���G�O���_��   
    J_history(iter) = computeCost(X, y, theta);

end

end
