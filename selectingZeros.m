%this loop terminates when all 0s are eliminated from the matrix
function mat=selectingZeros(mat,x,y)
    for i=1:x
        rdone(i)=0;
    end
    
    for i=1:y
        cdone(i)=0;
    end
ze=1; %initially will check for 1 zero in column and row and increment this value in each successive iteration
while(1)
    f=0;
    
    for i=1:x
        rzero(i)=0;
    end
    
    for i=1:y
        czero(i)=0;
    end
    
    %check for no. of 0s in each row
    rzero=countrowzero(mat,rzero);
    
    for i=1:x
        if(rzero(i)<=ze && rzero(i)>0)
            for m=1:y
                if(mat(i,m)==0)
                    mat(i,m)=999;
                    rdone(i)=1;
                    cdone(m)=1;
                    rzero(i)=rzero(i)-1;
                    for k=1:x
                        if(mat(i,k)==0)
                            mat(i,k)=-999;
                            rzero(i)=rzero(i)-1;
                        end
                        if(mat(k,m)==0)
                            mat(k,m)=-999;
                            rzero(k)=rzero(k)-1;
                        end
                    end
                end
            end
        end
    end
    
    %applying column operation
    
    %counting number of zero in each column 
     czero=countcolzero(mat,czero);
    
    
    for j=1:y
        if(czero(j)<=ze && czero(j)>0)
            for m=1:x
                if(mat(m,j)==0)
                    mat(m,j)=999;
                    czero(j)=czero(j)-1;
                    rdone(m)=1;
                    cdone(j)=1;
                
                for k=1:x
                    if(mat(m,k)==0)
                        mat(m,k)=-999;
                        czero(k)=czero(k)-1;
                    end
                    if(mat(k,j)==0)
                        mat(k,j)=-999;
                        czero(j)=czero(j)-1;
                    end
                 end
                end
            end
        end
    end
    
  
    for i=1:x
        for j=1:y
            if(mat(i,j)==0)
                f=1;
                break;
            end
        end
        if(f==1)
            break;
        end
    end
    if(f~=1)
        break;
    end
    ze=ze+1;
end
op=0;
    
    for i=1:x
        if(rdone(i)==0 || cdone(i)==0)
             op=1;
        end
    end
    
   if(op)
     fprintf('Optimal solution is not reached..proceeding for finding the optimal solution\n')
     mat
     mat=optimizing(mat,x,y,rzero,czero);
   else
       fprintf('Optimal solution is reached..the End\n')
   end
    
