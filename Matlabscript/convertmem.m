function M =convertmem(P)

M=zeros(7,1);
memtot= 9965,5;
for k=1 : length(P)
    M(k)=(memtot*P(k))/100;
end


