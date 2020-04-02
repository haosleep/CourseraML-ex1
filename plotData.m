function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% �إߤ@�ӷs����
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

% plot�O�e�G���ϫ��O
% x,y��x�b�My�b�����
% rx�O�G���ϼХ�����,��Ʀb�ϤW�|�H"����x"���Φ��Хܦb�ϤW
% 'MarkerSize'��ܼХܤj�p�]�w,�᭱��10�Y���]�w���j�p
% ylabel,xlabel���x�b�My�b���W�ټХ�

plot (x, y, 'rx', 'MarkerSize' , 10);     % Plot the data
ylabel('Profit in $10,000s');             % Set the y-axis label
xlabel('Population of City in 10,000s');  % Set the x-axis label



% ============================================================

end
