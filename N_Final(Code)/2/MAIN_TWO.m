clc;
clear all;
close all;
lambda1=0.5;
nvm=40;
no_of_task=500:150:1100;

[art1 , gr1 , tp1] = Project_Bestfit_2(nvm,lambda1);
[art2 , gr2 , tp2] = Project_Firstfit_2(nvm,lambda1);
[art3 , gr3 , tp3] = Project_HEFT_2(nvm,lambda1);
[art4 , gr4 , tp4] = Project_Bestfit_two(nvm,lambda1);
[art5 , gr5 , tp5] = Project_Firstfit_two(nvm,lambda1);
[art6 , gr6 , tp6] = Project_HEFT_two(nvm,lambda1);
% [art4 , gr4 , tp4] = Project_B_EDF(nt,lambda1);

value1=load('Project_Bestfit_2.mat');
value2=load('Project_Firstfit_2.mat');
value3=load('Project_HEFT_2.mat');
value4=load('Project_Bestfit_two.mat');
value5=load('Project_Firstfit_two.mat');
value6=load('Project_HEFT_two.mat');
% value4=load('Project_B_EDF.mat');

Plot_Main_2(value1,value2,value3,value4,value5,value6);

