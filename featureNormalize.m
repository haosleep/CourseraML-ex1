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

% mean(X)是取得X的平均值
% X是矩陣時,結果會是每行的平均值(1*矩陣行數 的格式)
mu = mean(X);
% std(X)是取得X的標準差
% X是矩陣時跟mean一樣
sigma = std(X);

% 將原特徵值的資料 減去 此特徵值的平均 後再除以 此特徵值的標準差
% 就能將特徵值的範圍限縮為0~1
% 此即為特徵縮放
% (範圍也可以縮為-1 ~ 1,甚至-1 ~ 2都可以,主要只要範圍不要太大且各特徵值數值也不要差太遠即可)

% 直接將X-平均值
% 雖然傳進來的X格式應為47*2的矩陣,而mean(X)會是1*2
% 不過因兩矩陣行數一致,Octave會自動進行對應讓X第一行的值減去mean(X)第一項,X第二行減去mean(X)第二項
% 如果兩矩陣是列數一致時Octave一樣也能自動對應運作

% 除以標準差的部分也是相同
% 不過是要各項除以標準差而非進行矩陣除法,所以是用 ./
X_norm = (X - mean(X)) ./ std(X);



% ============================================================

end
