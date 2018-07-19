clc;
clear all;
close all;
no_of_lambda1=0.2:0.125:1.2;
nt=1000;
nvm=20;

[art1 , gr1 , tp1] = Project_Bestfit_3(nt,nvm);
[art2 , gr2 , tp2] = Project_Firstfit_3(nt,nvm);
[art3 , gr3 , tp3] = Project_HEFT_3(nt,nvm);
[art4 , gr4 , tp4] = Project_Bestfit_three(nt,nvm);
[art5 , gr5 , tp5] = Project_Firstfit_three(nt,nvm);
[art6 , gr6 , tp6] = Project_HEFT_three(nt,nvm);
% [art4 , gr4 , tp4] = Project_B_EDF(nt,lambda1);

value1=load('Project_Bestfit_3.mat');
value2=load('Project_Firstfit_3.mat');
value3=load('Project_HEFT_3.mat');
value4=load('Project_Bestfit_three.mat');
value5=load('Project_Firstfit_three.mat');
value6=load('Project_HEFT_three.mat');
% value4=load('Project_B_EDF.mat');

Plot_Main_3(value1,value2,value3,value4,value5,value6);

