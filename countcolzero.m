function czero=countcolzero(mat,czero)
  %check for no. of 0s in each col
    %col operation
    [x,y]=size(mat);
for i=1:x
        for j=1:y
            if(mat(i,j)==0)
                czero(j)=czero(j)+1;
            end  
        end
end