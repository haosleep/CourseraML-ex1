function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% 建立一個新的圖
figure; % open a new figure window

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

% plot是畫二維圖指令
% x,y表x軸和y軸的資料
% rx是二維圖標示類型,資料在圖上會以"紅色x"的形式標示在圖上
% 'MarkerSize'表示標示大小設定,後面的10即為設定的大小
% ylabel,xlabel表示x軸和y軸的名稱標示

plot (x, y, 'rx', 'MarkerSize' , 10);     % Plot the data
ylabel('Profit in $10,000s');             % Set the y-axis label
xlabel('Population of City in 10,000s');  % Set the x-axis label



% ============================================================

end
