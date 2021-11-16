function [x,y] = im2rect(filename)
    img=imread(filename);
    imgray=rgb2gray(img);
    imb=1-imbinarize(imgray);
    imb=bwmorph(imb,'open',4);
    imb=imfill(imb,'holes');
    imb=medfilt2(imb,[8,8]);
    
    ime=edge(imb,'canny');
%     imshow(ime);
    [r,~]=size(ime);
    [i,j]=find(ime==1);
    y=r+1-i;
    x=j;
    
    x=x-min(x);
    y=y-min(y);
%     cx=mean(x);
%     cy=mean(y);
%     a=atan2(y-cy,x-cx)
%     [~,order] = sort(a);
%     x=x(order);
%     y=y(order);

    [x,y]=poly2cw(x,y);
    k=boundary([x,y],0.9);
    x=x(k);
    y=y(k);
end

