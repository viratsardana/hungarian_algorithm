function mat=optimizing(mat,x,y,rzero,czero)
%making 999 and -999as zeros and also counting the number of zeros
totzero=0;
for i=1:x
        for j=1:y
            if(mat(i,j)==999||mat(i,j)==-999)
                mat(i,j)=0;
                %counting total number of zeros in the mat
                totzero=totzero+1;
            end
        end
end


%rline and cline corresponds to the lines we draw in the matrix such that
%it cover all the zeros
    for i=1:x
        rline(i)=0;
    end
    
    for i=1:y
        cline(i)=0;
    end
%drawing lines which cover all the zeros  and terminates when total number
%of zeros become 0
while(totzero~=0)
    rzero=countrowzero(mat,rzero);
    czero=countcolzero(mat,czero);
    [rmax,rmaxpos]=max(rzero);
    [cmax,cmaxpos]=max(czero);
    
    if(rmax>=cmax)
        rline(rmaxpos)=1;
        %making all the zeros in that row as 888 
        for i=1:x
            if(mat(rmaxpos,i)==0)
            mat(rmaxpos,i)=888;
            totzero=totzero-1;
            end
        end
    end
    
    if (rmax<cmax)
        cline(cmaxpos)=1;
        %making all the zeros in that col as 888 
        for i=1:x
            if(mat(i,cmaxpos)==0)
            mat(i,cmaxpos)=888;
            totzero=totzero-1;
            end
        end
    end     
end

%finding the minimum number in the matrix from uncovered region
minNum=999;
for i=1:x
    if(rline(i)==1)
        continue;
    end
for j=1:y
    if(cline(j)==1)
        continue;
    end
    minNum=min(mat(i,j),minNum);
end
end
%making zeros in the matrix where it is 888 since intersection can be any
for i=1:x
        for j=1:y
            if(mat(i,j)==888)
                mat(i,j)=0;
            end
        end
end

%adding minimun number from uncovered region to intersection and subs from
%uncovered
for i=1:x
for j=1:y
    if(rline(i)==1&&cline(j)==1)
        mat(i,j)=mat(i,j)+minNum;
    end
    if(rline(i)~=1&&cline(j)~=1)
        mat(i,j)=mat(i,j)-minNum;
    end      
end
end
mat;
%calling the selecting zero to redo the process
mat=selectingZeros(mat,x,y);
end


