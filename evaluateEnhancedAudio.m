function evaluateEnhancedAudio(cleanFolder, enhancedFolder, fs)
    % Get a list of all the files in both folders using natsortfiles
    addpath('/gpfs/home/cdn16hqu/Matlab_eval/natsortfiles/');
    cleanFiles = natsortfiles(dir(fullfile(cleanFolder, '*.wav')));
    enhancedFiles = natsortfiles(dir(fullfile(enhancedFolder, '*.wav')));

    % Initialize arrays to store PESQ and ESTOI scores
    pesqScores = zeros(1, numel(cleanFiles));
    estoiScores = zeros(1, numel(cleanFiles));

    % Iterate through the files and process each pair
    for i = 1:numel(cleanFiles)
        cleanFile = fullfile(cleanFolder, cleanFiles(i).name);
        enhancedFile = fullfile(enhancedFolder, enhancedFiles(i).name);

        % Compute PESQ score
        pesqScores(i) = pesq(cleanFile, enhancedFile);

        % Load clean and enhanced audio
        cleanAudio = audioread(cleanFile);
        enhancedAudio = audioread(enhancedFile);

        % Compute ESTOI score
        estoiScores(i) = estoi(cleanAudio, enhancedAudio, fs);

%         fprintf('Processed file: %s\n', cleanFiles(i).name);
    end

    % Calculate mean PESQ and ESTOI scores
    meanPesq = mean(pesqScores);
    meanEstoi = mean(estoiScores);

    % Display results
    fprintf('Evaluated %d files\n', numel(cleanFiles));
    fprintf('Mean PESQ: %.4f\n', meanPesq);
    fprintf('Mean ESTOI: %.4f\n', meanEstoi);
end
