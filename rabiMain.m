%%% Dimension Reduction scripts
clear all
addpath('/Users/rabiul/Desktop/Musa project/datasets/midatasets/fs128/');
dataset = 'JKHH';  
Class = [3 4]; % in case of JKHH

% demension reduction method
DR = 0; % {0: not to reduce, 1: Graph Laplacian, 2: PCA}
%basis = [5:5:100]; % number of basis (1--118)
basis = 20
kappa = .5 % (default: .5) threshold of distance between nodes on graph
theta = .12 % (default: .1) parameter to tune the closeness of the two electrodes on graph
subject=1;
ddata = load_dataset_JKHH(subject);
sig = ddata.sig;
labels = ddata.labels;

U = graphLaplacian(dataset, kappa, theta);
bb=basis;
[P1 P2] = III_IVaSCM_with_Graph(dataset, sig, labels, U, bb,Class);