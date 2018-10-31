clear
clc
data_struct = load('data.mat');
data = data_struct.data';
data_test = data(2501:3000, 1:2);
data_result = data(2501:3000, 3);

% scatter(data(1:2500, 1), data(1:2500,2));
% scatter3(data(1:2500, 1), data(1:2500,2), data(1:2500, 3))
% figure(1)
% svm_struct = svmtrain(data(1:2500, 1:2),data(1:2500, 3), ...
%     'Kernel_Function','rbf', 'showplot',true);
% figure(2)
% svm_struct = svmtrain(data(1:2500, 1:2),data(1:2500, 3), ...
%     'Kernel_Function','mlp', 'showplot',true);

figure(3)
svm_struct = svmtrain(data(1:2500, 1:2),data(1:2500, 3), ...
    'Kernel_Function','linear', 'showplot',true);

classes = svmclassify(svm_struct,data_test,...
    'showplot',true);

ee = 0;
for i = 1:500
    if classes(i) ~= data_result(i)
        ee = ee+1;
    end        
end

disp(ee);
disp(svm_struct);


