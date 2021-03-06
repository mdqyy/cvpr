echo off;
clear all;
clc;
rand('seed',1);
setpaths
load('testData.mat');

fprintf('\n\nRunning multiple-metrics LMNN  ...\n');

[Ldim2,Det]= multiLMNN(sample,[1:316 1:316],1,'maxiter',450,'checkup',0);
%load('Ldim2.mat');
%L = pca(sample)';
%L = L(1:outdim,:);
%sample = Ldim2 * sample;


% to speed up the demo I set "validation" to 0.0 -- this only works because maxiter is so low
% usually you would want to hvae maxiter larger, and 'validation' set to 0.2 or 0.3. 
fixe = [ones(1,105) ones(1,105)*2 ones(1,106)*3];
perm = randperm(316);
fixe = fixe(perm);
[Ls,Dets]=MMlmnn(sample,[1:316 1:316],1,'initl',Ldim2,'verbose',1,'maxiter',20000,'validation',0.0,'stepsize',1e-07,'fixe',[fixe fixe]);