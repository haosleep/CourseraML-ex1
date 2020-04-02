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


% �l����Ƥ��� J(�c) = 1/2m * sigma(i=1:m)(h(Xi) - yi)^2
% h(X) �N�O�NX����ƥN�J�ڭ̳]�w���p�⤽����ұo�X���������G��
% y �h�O��Ƥ���ڪ����G��
% ��Ȫ��t�N�O�����M��ڭȪ��~�t,���F�קK�~�t�������t�ɭP�`�~�t���G�o�O���p�Ȫ����D,�N�~�t������
% ���۱N�C�@�����~�t����[�`
% �̫�N�[�`���~�t�� ���H (��ƶ���*2) �N��o�X�̫᪺�l����ƭ�J
% J�U�p,�N��ܧڭ̳]�w�������ұo�X�����G�M��ڵ��G���t�Z�U�p,�Y��ܧڭ̳]�w���������i�H���׫ܰ�

% p.s:�̫ᰣ�H2m �Ӥ��O���Hm,�D�n�O���F�᭱��פU���ɹ�J�D�ɤW�p�����K�Q
%     ���L���ް��Hm�٬O2m,J�U�p���G�U�n�������٬O����



% X     ���榡   ����`��   * (�S�x��+1)  +1�O���F�ɣc0�����ƭ�
% theta ���榡   (�S�x��+1) * 1
% y     ���榡   ����`��   * 1
% �x�}�B��(X * theta - y)�N���n�B�z�n�C�@����ƪ��~�t���G
% .^2 �N�O�N�x�}�C�@���U�ۨ�����, �p�G�u�g ^2 �|�ܦ��x�}��������
% �̫�N���G�[�`�ᰣ�H(��ƶ���*2),�Y�oJ(�c)

J = sum((X * theta - y) .^ 2) / (2 * m);



% =========================================================================

end
