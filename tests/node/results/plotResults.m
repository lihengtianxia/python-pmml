function plotResults(file1,file2)
% Plot the load test results against each other
%   File1 is the RBP file and file 2 is the GCP file
    figure(); hold on;
    markers = {'-*','-x'};
    files = {file1,file2};
    for i=1:length(files) 
        data = csvread(files{i},1,0);
        response = data(:,1);
        throughput = data(:,2);
        plot(throughput,response/1000,markers{i});
    end
    xlabel('Request Throughput [req/s]');
    ylabel('Average Prediction Response Time [s]');
    legend({'Raspberry Pi','Google Compute Engine'});
    set(gca,'fontSize',12)
    ylim([0,30])
end

% plotResults('energy-prediction.csv', 'energy-prediction-google.csv')
% plotResults('tool-condition.csv', 'tool-condition-google.csv')