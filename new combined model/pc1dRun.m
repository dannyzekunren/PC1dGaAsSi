function y = pc1dRun(file)
% Function to run a pc1d prm-file with current parameters. The output is
% the data presented in the graph(s) in the single graph window defined in
% the pc1d program. The output data is a cell array containing header
% titles for each coloumn and the numerical data itself, in the format
% [X-data, Ydata1, Ydata2, ...]

 [a b] = dos(['cmd-pc1d.exe ' file]);
 data = textscan(b,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
 data = [data{:}];
 data1 = data(1,:);
 emptycol = not(isfinite(data1));
 data(:,emptycol) = [];
 coloumns = length(data(1,:));
 firstline = textscan(b,'%s',coloumns,'Delimiter','\t');
 headers = firstline{1};
 y = {headers,data};
 
end
 




