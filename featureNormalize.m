function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

% mean(X)�O���oX��������
% X�O�x�}��,���G�|�O�C�C��������(1*�x�}�C�� ���榡)
mu = mean(X);
% std(X)�O���oX���зǮt
% X�O�x�}�ɸ�mean�@��
sigma = std(X);

% �N��S�x�Ȫ���� ��h ���S�x�Ȫ����� ��A���H ���S�x�Ȫ��зǮt
% �N��N�S�x�Ȫ��d���Y��0~1
% ���Y���S�x�Y��
% (�d��]�i�H�Y��-1 ~ 1,�Ʀ�-1 ~ 2���i�H,�D�n�u�n�d�򤣭n�Ӥj�B�U�S�x�ȼƭȤ]���n�t�ӻ��Y�i)

% �����NX-������
% ���M�Ƕi�Ӫ�X�榡����47*2���x�},��mean(X)�|�O1*2
% ���L�]��x�}�C�Ƥ@�P,Octave�|�۰ʶi�������X�Ĥ@�C���ȴ�hmean(X)�Ĥ@��,X�ĤG�C��hmean(X)�ĤG��
% �p�G��x�}�O��Ƥ@�P��Octave�@�ˤ]��۰ʹ����B�@

% ���H�зǮt�������]�O�ۦP
% ���L�O�n�U�����H�зǮt�ӫD�i��x�}���k,�ҥH�O�� ./
X_norm = (X - mean(X)) ./ std(X);



% ============================================================

end
