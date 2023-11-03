%% Mix noise with speech using ASL

cleanDir = "/Users/georgiesfeclis/Code/SpeechCode/GRID/s4_clean/test/"; %gets directory
noiseDir = "/Users/georgiesfeclis/Code/Noise/noise5/test1/";
outDir = "/Users/georgiesfeclis/Code/SpeechCode/GRID/s4_15db/test/";
cleanFile = dir(fullfile(cleanDir,'*.wav')); %gets all wav files in struct
noiseFile = dir(fullfile(noiseDir, '*.wav'));

for k = 1:length(cleanFile)
      baseFileName = cleanFile(k).name;
      cl = baseFileName(1:6);
      noiseFileName = noiseFile(k).name;
      outFileName =  cl + "_15db" + ".wav";
      outFileLoc = fullfile(outDir, outFileName);
      fullFileName = fullfile(cleanDir, baseFileName);
      noiseFileName = fullfile(noiseDir, noiseFileName);
      fprintf(1, 'Now reading %s\n', fullFileName);
      fprintf(1, 'Merging with %s\n', noiseFileName);
    
      addnoise_asl(fullFileName, noiseFileName, outFileLoc, 15);

end