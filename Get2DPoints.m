function XY2D = Get2DPoints(ImageFileName, NumberOfPoints)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
XY2D=[];
[Img, Col]=imread(ImageFileName); %%% assuming the imagefile is a jpg file.
image(Img); drawnow; hold on;
for i=1:NumberOfPoints
[x, y]=ginput(1);
v=[y;x];
plot(x, y, 'r*');
XY2D=[XY2D v];
end

