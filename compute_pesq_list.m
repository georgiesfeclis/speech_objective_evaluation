%%% Read audio and write to .mfc file script
myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.wav')); %gets all wav files in struct

noisyDir = uigetdir; %gets directory
noisyFiles = dir(fullfile(noisyDir,'*.wav')); %gets all wav files in struct

for k = 1:length(myFiles)

  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myDir, baseFileName);

  noisy = noisyFiles(k).name;
  noisyFullFileName = fullfile(noisyDir, noisy);
%   keyboard

  
  [y, Fs] = audioread(noisyFullFileName);
  [x, fs] = audioread(fullFileName);


  fprintf(1, 'Now reading %s\n', noisyFullFileName);
  pesqVal(k) = pesq(fullFileName, noisyFullFileName);
  estoiVal(k) = estoi(x,y,Fs);
  
end

pesqVal;