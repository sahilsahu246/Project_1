clc;
clear all;
close all;
lambda1=0.5;
nt=1000;
no_of_vm=10:10:40;
[art1 , gr1 , tp1] = Project_Bestfit(nt,lambda1);
[art2 , gr2 , tp2] = Project_Firstfit(nt,lambda1);
[art3 , gr3 , tp3] = Project_HEFT(nt,lambda1);
% [art4 , gr4 , tp4] = Project_B_EDF(nt,lambda1);
value1=load('Project_Bestfit.mat');
value2=load('Project_Firstfit.mat');
value3=load('Project_HEFT.mat');
% value4=load('Project_B_EDF.mat');

Plot_Main(value1,value2,value3);










