
%Hungaraian method to calculate best deal on an ecommerce website for a
%product under different discounts

%n=input('Enter the dimension of matrix\n')

mat=input('Enter the matrix\n')
[x,y]=size(mat)

if(x<y)
 fprintf('Not a balanced matrix adding zeros to the row\n')    
 mat1=zeros(x+1,y);
 for i=1:x
 for j=1:y
 mat1(i,j)=mat(i,j);
 end
 end
end

if(x>y)
 fprintf('Not a balanced matrix adding zeros to the row\n')    
 mat1=zeros(x,y+1);
 for i=1:x
 for j=1:y
 mat1(i,j)=mat(i,j);
 end
 end
end

if(x==y)
    mat1=mat;
end
mat=mat1;
mat
[x,y]=size(mat);
% applying row operation
[rmin,rminpos]=min(mat,[],2);


for i=1:x
    for j=1:y
        mat(i,j)=mat(i,j)-rmin(i);
    end
end

%applying column operation
[cmin,cminpos]=min(mat);

for j=1:y
    for i=1:x
        mat(i,j)=mat(i,j)-cmin(j);
    end
end

mat
f=0;

result=0;

%this loop terminates when all 0s are eliminated from the matrix
%calling selecting zeros
mat=selectingZeros(mat,x,y);
for i=1:x
        for j=1:y
            if(mat(i,j)==-999)
                mat(i,j)=0;
            end
            if(mat(i,j)==999)
                result=result+mat1(i,j);
            end
        end
end
disp('the position with value 999 are selected as the optimal positions')
    mat
disp('the orignal matrix');
    mat1
fprintf('the optimal value is : %d',result);
    
    