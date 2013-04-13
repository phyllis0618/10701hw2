function [predictedY] = svm_dual_classify(testX,trainX,trainY, C,sigma,alpha)
%calculate H 

 
  N=size(trainX,2);
    fx=0;
    for n=1:N
            fx=alpha(n)*trainY(n)*exp(-norm(testX-trainX(:,n),2)^2/(2*sigma^2))+fx;
    end
    

    predictedY=sign(fx);

end