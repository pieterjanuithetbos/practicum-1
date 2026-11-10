function [Q, R]= klGS(A)

m=size(A,1);
n=size(A,2);

Q=zeros(m,n);
R=zeros(n,n);

for j=1:n
    vj=A(:,j);
    for i=1:(j-1)
        R(i,j)=Q(:,i)'*A(:,j);
        vj=vj-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(vj,2);
    Q(:,j)=vj./R(j,j);
end
end