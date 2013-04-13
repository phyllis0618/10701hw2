function alpha=svmdual(trainX,trainY,C,sigma)
    %Build H
     N=size(trainX,2);
     H=zeros(N,N);
     for n=1:N
         for m=1:N
             H(n,m)=exp(-norm(trainX(:,n)-trainX(:,m),2)^2/(2*sigma^2))*trainY(n)*trainY(m);
         end
     end
     f=-ones(N,1);
     A=[eye(N);-eye(N)];
     b=[C*ones(N,1);zeros(N,1)];
     Ae=trainY;
     be=0;
  %   opts = optimset('Algorithm','active-set');
  %   alpha=quadprog(H,f,A,bb,Ae,be,[],[],[],opts);
  alpha=quadprog(H,f,A,b,Ae,be);
end