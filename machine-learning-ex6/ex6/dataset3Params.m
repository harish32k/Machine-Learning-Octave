function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%uncomment below snippet, the below snippet is commentized so that submit script 
%runs faster

%{
CVals = [0.01 0.03 0.1 0.3 1 3 10 30];
sigmaVals = [0.01 0.03 0.1 0.3 1 3 10 30];
bestC = C;
bestSigma = sigma;
bestError = 1; %mean of all examples having error=1 is 1. 
%(1+ 1+ 1+...1 (m times))/m =1
count = 1;
for c = CVals
  for s = sigmaVals
    disp(count);
    model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s)); 
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    if(error<bestError)
      bestError = error;
      bestC = c;
      bestSigma = s;
    endif
    count = count+1;
  endfor
endfor


C = bestC
sigma = bestSigma
%}

%answer is directly set, so that submit script runs faster
C =  1;
sigma =  0.10000;
% =========================================================================

end
