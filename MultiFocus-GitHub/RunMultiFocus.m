clc;
clear;
close all;

% Read the images (SourceA and SourceB) from the given paths.
% SourceA is the first image and SourceB is the second image to be fused.
SourceA = imread('..');
SourceB = imread('..');

% Resize both images to 256x256 pixels to make them of the same size.
SourceB = imresize(SourceB, [256 256]);
SourceA = imresize(SourceA, [256 256]);

% Get the dimensions of SourceB and SourceA.
[x1, y1, z1] = size(SourceB);
[x2, y2, z2] = size(SourceA);

% Convert the images to grayscale if they are color images (i.e., if z1 or z2 > 1).
if z1 > 1
    SourceBGray = rgb2gray(SourceB);  % Convert SourceB to grayscale
else
    SourceBGray = SourceB;  % If already grayscale, use as is
end    
if z2 > 1
    SourceAGray = rgb2gray(SourceA);  % Convert SourceA to grayscale
else
    SourceAGray = SourceA;  % If already grayscale, use as is
end

% Initialize empty arrays to store the fused images for both SourceA and SourceB.
BF = zeros(x1, y1, 3);  % Fused image for SourceB
BF2 = zeros(x2, y2, 3);  % Fused image for SourceA

%% Problem Information
% Define problem parameters for optimization.

nVar = 2;             % Number of Decision Variables (block size in this case)

VarSize = [1, nVar];   % Size of the Decision Variables matrix (a row vector)

VarMin = 8;           % Lower Bound for the Decision Variables (minimum block size)
VarMax = 24;          % Upper Bound for the Decision Variables (maximum block size)

%% ABC (Artificial Bee Colony) Settings

MaxIt = 100;           % Maximum number of iterations for the algorithm

nPop = 20;              % Population size (number of bees in the colony)

nOnlooker = nPop;      % Number of onlooker bees (same as the population size)

L = round(0.6 * nVar * nPop);  % Abandonment Limit (maximum trials per bee)

a = 1;  % Acceleration coefficient upper bound (used in bee movement)

% Define the fitness function for the optimization problem.
% The fitness function evaluates the fusion quality based on block size.
CostFunction = @(x) FitnessFunction(x, SourceAGray, SourceBGray, x1, y1);

% Main optimization loop to run the ABC algorithm.
for iter = 1:30
    abc;  % Call the ABC algorithm (this is assumed to be defined in another script or function)
    
    % Store the results of the best solution (block size) found in each iteration.
    results(iter, 1) = BestSol.Position(1, 1);  % Best horizontal block size
    results(iter, 2) = BestSol.Position(1, 2);  % Best vertical block size
end

