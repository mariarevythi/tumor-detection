%%  TRAINING AND TESTING

close all

clear all

clc


 

X = imread('lungTexp1__rec1400','bmp');

figure; imshow(X);

title('Tumor Picture');

impixelinfo;


cooc=zeros(256,256);

for i=1:2596

    for j=1:2595

        cooc(X(i,j)+1,X(i,j+1)+1)=cooc(X(i,j)+1,X(i,j+1)+1)+1;

    end

end


figure;imshow(uint8(cooc))

impixelinfo


cooc1=cooc;

cooc1(70:150,70:150)=0;

figure;imshow(uint8(cooc1))

impixelinfo


X1=zeros(size(X));


for i=1:2596

    for j=1:2595

       

        if(X(i,j)>=70 & X(i,j)<=150)

            if(X(i,j+1)>=70 & X(i,j+1)<=150)

        X1(i,j)=255;

            end

        end

       

    end

end


figure; imshow(uint8(X1));

title('Segmented Picture');

impixelinfo;