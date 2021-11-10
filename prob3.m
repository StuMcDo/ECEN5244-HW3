clc;
clear;
close all;
Y = load('hw3_3.mat')

data = Y.Y;
%%Subtract off the mean vector
data(:,1) = data(:,1)-mean(data(:,1));
data(:,2) = data(:,2)-mean(data(:,2));
data(:,3) = data(:,1)-mean(data(:,3));
data(:,4) = data(:,2)-mean(data(:,4));
data(:,5) = data(:,1)-mean(data(:,5));
data(:,6) = data(:,2)-mean(data(:,6));
%%part i
data = transpose(data)

c =data*transpose(data)./344
%Covariance = cov(transpose(data)); %X^TX
Correlation = corrcoef(transpose(data));

%%what is the significance of the correlation matrix

%%how to render these matrices?

%%eigen vectors are the principle component
%part 2 
%data = transpose(data)

% ii
[E,lambda] = eig(c);

%how to plot the modes? Eigen vectors are the principle value
%transformed vectors 
% channel = linspace(1,6,6)
% plot(channel,E(:,6),channel,E(:,5),channel,E(:,3))
%iv
z1 = transpose(E(:,6))*data; %backwards??? V.'*data.'
 xlabel('channel')
 ylabel('mode')
 title('3 most energetic modes')
legend('E6','E5','E4')
z2 = transpose(E(:,5))*data;
z3 = transpose(E(:,4))*data;
% these components do not match
t = linspace(0,344,345)
plot(t,z1,t,z2,t,z3)

  xlabel('time')
  ylabel('Z')
  title('most energetic principle components')
  legend('E6','E5','E4')

%v
scatter(z1(1,:),z2(1,:))
hold on;
scatter(z1(1,:),z3(1,:))
scatter(z2(1,:),z3(1,:))
  xlabel('z')
 ylabel('Z')
  title('most energetic principle components')
 legend('z1/z2','z1/z3','z2/z3')

%decode data
% Y1 = E(:,6).*z1;
% data = transpose(data);
% Y1 = transpose(Y1);
% figure;
% scatter(data(:,1),data(:,2))
% hold on;
% scatter(Y1(:,1),Y1(:,2))
%iii





P = pca(data);