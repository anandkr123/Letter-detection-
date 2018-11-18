function label()
img=imread('text_train.jpg');
%img1=imread('text_test.jpg');
G = fspecial('gaussian',[3,3],2);
%# Filter it
Ig1 = imfilter(img,G,'replicate');
Ig=im2double(Ig1);
I_quant=quantile(Ig(:),0.2);
ib1= Ig < I_quant;
ib1=im2double(ib1);
figure;title('just binarized');imshow(ib1);


ib1=imdilate(ib1,strel('square',2));                  % doing dilation 

%figure;title('After dilation done');imshow(ib1)

[L,n]=bwlabel(ib1,4);                                  % labelling the connected component objects 

figure;title('The labeled image, locate your needed letter by using data cursor under tools option'),imshow(L)
% for k=1:n
    Lb=(L==54);
    [r,c]=find(L==54);
    image_A=double(Lb(min(r):max(r),min(c):max(c)));
    figure,imshow(image_A);
  % sum_of_A=sum(image_A(:));
%    ends
% I = imfilter(ib1,image_A,'corr');
% figure,imshow(I.^10,[]);
  figure,imshow(img);
hold on;
%  Extracting all letters from the image%
   % disp(sum_of_A);
    Ideal_filt = imfilter(image_A,image_A,'corr');
    Ideal_threshold = max(Ideal_filt(:));
   % disp(Ideal_threshold);
for k=1:n
    Lb=(L==k);
    [r,c]=find(L==k);
    mean_r=mean(r);
    mean_c=mean(c);
    
    Croppedletter=double(Lb(min(r):max(r),min(c):max(c)));
    LetterCorr = imfilter(Croppedletter,image_A,'corr');
    % imshow(Croppedletter);
    %SumofELC=sum(LetterCorr(:));
  %  disp(SumofELC)
     if(  max(LetterCorr(:))> 0.9*Ideal_threshold )
%          disp(SumofELC);
%          pause;
       plot(mean_c,mean_r,'Marker','o','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',7);
       plot(mean_c,mean_r,'Marker','+','MarkerEdgeColor','w');
     end
end

end
