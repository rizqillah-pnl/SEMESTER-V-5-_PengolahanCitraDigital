image = 'naruto.gif';
[I N] = imread(image,'frames','all');
y = immovie(I,N);

implay(y);