function rzero=countrowzero(mat,rzero)
  %check for no. of 0s in each row
    %row operation
    [x,y]=size(mat);
    for i=1:x
        for j=1:y
            if(mat(i,j)==0)
                rzero(i)=rzero(i)+1;
            end
        end
    end