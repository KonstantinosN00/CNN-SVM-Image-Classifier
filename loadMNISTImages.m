function images = loadMNISTImages(filename)
%loadMNISTImages 

fp = fopen(filename, 'rb','ieee-be');

magic = fread(fp, 1, 'int32');
assert(magic == 2051, ['Bad magic number in ', filename, '']);

numImages = fread(fp, 1, 'int32');
numRows = fread(fp, 1, 'int32');
numCols = fread(fp, 1, 'int32');

images = fread(fp, inf, 'unsigned char');
images = reshape(images, numCols, numRows,1, numImages);
images = permute(images,[2 1 3 4]);

fclose(fp);

% Convert to double and rescale to [0,1]
images = double(images) / 255;

end
