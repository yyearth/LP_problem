clear
clc

global dose_mat
global tumor
global criti

% 1:tumor 2:critical organs 3:normal tissue 0:blank
type_mat = Types;
tumor = find(type_mat==1);
criti = find(type_mat==2);
dose_mat = DoseMatrix;
[rows, cols] = size(dose_mat);

% options = optimset('MaxFunEvals',200000);

[a, fval] = fgoalattain(@obj_fun, ones(594, 1), [-85, 45], [10, 1],[],[],...
    [],[],zeros(594, 1),[])

% fgoalattain(fun,x0,goal,weight,A,b,Aeq,beq,lb,ub,nonlcon,options)

% x = 1*ones(cols, 1);
% [y, a] = obj_fun(x)

function [y, a] = obj_fun(x)
    global tumor
    global criti
    global dose_mat
%     size(dose_mat);
    a = dose_mat*x;
    y(1) = -1*sum(a(tumor));
    y(2) = sum(a(criti));
    
end

function [] = null_fuc(x)
    x = x;
end

