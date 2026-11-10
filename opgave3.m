m=200;
n=100;

B=randn(m,n);
[Q, R]=qr(B,"econ");

D=zeros(n,n);
for i=1:n
    D(i,i)=2^(1-i);
end

V=eye(n);
for i=1:n
    V(1,i)=1;
end

A=Q*D*V;

%a1=q1
%aj=qj*2^(1-j)+q1 voor j=2:n