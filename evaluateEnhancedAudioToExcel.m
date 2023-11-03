function evaluateEnhancedAudioToExcel(cleanFolder, enhancedFolder, fs, excelFileName, jobNo)
    addpath("/gpfs/home/cdn16hqu/Matlab_eval");
    addpath("/gpfs/home/cdn16hqu/Matlab_eval/natsortfiles");
    addpath(enhancedFolder);

    enhancedFolder

    % Get a list of all the files in both folders
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
    meanPesq = mean(pesqScores)
    meanEstoi = mean(estoiScores)

    % Append the new PESQ and ESTOI scores to the existing data
    newData = [meanPesq; meanEstoi]
    
    % Check if the Excel file exists
    if exist(excelFileName, 'file') == 2
        % Load the existing data from the CSV file
        existingData = csvread(excelFileName);
        
        % Find the next available row for writing
        nextRow = size(existingData, 1) + 1;
    else
        % Create a new Excel file if it doesn't exist
        existingData = [];
        nextRow = 1;
    end

    csvwrite(excelFileName, [existingData; newData]);

    % Display results
    fprintf('Evaluated %d files\n', numel(cleanFiles));
    fprintf('Mean PESQ: %.4f\n', mean(pesqScores));
    fprintf('Mean ESTOI: %.4f\n', mean(estoiScores));
end
