%load x.xlsx, y.xlsx
%X=x.xlsx;
%Y=y.xlsx;

load('data.mat');
C=1;

Xnew=data(:,1:2);
Ynew=data(:,3);

Ynew(Ynew==0)=-1;
 

    Xnewtrain=Xnew';
 Ynewtrain=Ynew';
        Xnewtest=Xnew';
 Ynewtest=Ynew';
 
 sigma=1;
  alpha=alpha(Xnewtrain,Ynewtrain,C,sigma);
Label=[];
for t=1:size(Xnewtest,2)
 
[predictedY] = svm_dual_classify(Xnewtest(:,t), Xnewtrain, Ynewtrain, C,1);
Label=[Label predictedY];
end

Ratio=sum(Label==Ynewtest)/length(Ynewtest)
%CorrectRatio1=(length(find(Ynewtestdualsvm' -Ynewtest~=0)))/(length(Ynewtestdualsvm))
%disp(CorrectRatio1);



