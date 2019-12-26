clear all;close all;

A = imread('CISE_Building.jpg');

distPoints = Get2DPoints('CISE_Building.jpg', 4);
correctPoints = Get2DPoints('CISE_Building.jpg', 4);

h = homography_solve(distPoints, correctPoints);
invh = inv(h);
C=uint8(zeros([size(A,1) size(A,2) 3 ]));
midx=ceil((size(C,1)+1)/2);
midy=ceil((size(C,2)+1)/2);

 for i=1:size(A,1)

    i1=i;%-midx;
  %  i1 = i;
    for J=1:size(A,2)

     j1 = J;%-midy;
  % j1 =j;

point = invh * [i1;j1;1];
%point = homography_transform([i1;j1], invh);

x = point(1)/point(3);

y = point(2)/point(3);

% = point(1);
%y = point(2);

x = round(x);%+midx);

y = round(y);%+midy);
%x = round(x);
%y = round(y);
if(x>=1 && y>=1 && x<=size(C,1) && y<=size(C,2))
 C(x,y,:) = A(i,J,:);
end
    end
 end

 imshow(C);
 
