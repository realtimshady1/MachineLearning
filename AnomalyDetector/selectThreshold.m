function [bestEpsilon bestF1] = selectThreshold(yval, pval)
% Return the best threshold and F1 score of a given dataset

% Initialize outputs
    bestEpsilon = 0;
    bestF1 = 0;
    F1 = 0;

%   Calculate scores
    stepsize = (max(pval) - min(pval)) / 1000;
    for epsilon = min(pval):stepsize:max(pval)
        tp = sum(yval.*(pval<epsilon));
        fp = sum(~yval.*(pval<epsilon));
        fn = sum(yval.*~(pval<epsilon));
        prec = tp/(tp+fp);
        rec = tp/(tp+fn);
        F1 = 2*prec*rec/(prec+rec);
        if F1 > bestF1
           bestF1 = F1;
           bestEpsilon = epsilon;
        end
    end

end
