function [Q, R]=herGS(A, kappa)

m=size(A,1);
n=size(A,2);

Q=zeros(m,n);
R=zeros(n,n);

adaptief=(nargin == 2);
if adaptief
    for j=1:n
    vj=A(:,j);
    for k=1:2
        if (k==1) ||(k==2 && norm(vj,2)/norm(A(:,j),2)<kappa)
            A(:,j)=vj;
            for i=1:(j-1)
                r=Q(:,i)'*A(:,j);
                R(i,j)=R(i,j)+r;
                vj=vj-r*Q(:,i);
            end
        end
    end
    if norm(vj,2)/norm(A(:,j),2)>=kappa
    R(j,j)=norm(vj,2);
    Q(:,j)=vj./R(j,j);
    end
    end
else
for j=1:n
    vj=A(:,j);
    for k=1:2
        for i=1:(j-1)
            r=Q(:,i)'*A(:,j);
            R(i,j)=R(i,j)+r;
            vj=vj-r*Q(:,i);
        end
        A(:,j)=vj;
    end
    R(j,j)=norm(vj,2);
    Q(:,j)=vj./R(j,j);
end
end

end