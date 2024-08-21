function labels = loadMNISTLabels(filename)
%LOADMNISTLABELS

fid2 = fopen(filename, 'rb','ieee-be');

magicNum = fread(fid2, 1,'int32');
assert(magicNum == 2049, ['Bad magic number in ', filename, '']);
labelNum = fread(fid2,1,'int32'); 
labels = fread(fid2, inf);
labels = categorical(labels);

end

