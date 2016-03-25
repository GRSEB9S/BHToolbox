function [decStat,classifier] = runBayes(features, classifier)

decStat = zeros(size(features,1),1);
for cnt = 1:size(features,1)
    decStat(cnt) = (-1/2*(features(cnt,:)-classifier.mu1)*...
        pinv(classifier.sigma1)*transpose(features(cnt,:)-classifier.mu1)-1/2*...
        log(det(classifier.sigma1))+log(classifier.w1))-(-1/2*...
        (features(cnt,:)-classifier.mu0)*pinv(classifier.sigma0)...
        *transpose(features(cnt,:)-classifier.mu0)-1/2*log(det(classifier.sigma0))+...
        log(classifier.w0));
end

end