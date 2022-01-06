%% plotting pre-definitions:
% EXPORT_FIG: function to export figures nicely to a number of vector & bitmap formats:
% can be downloaded at (16/05/2017):
% https://se.mathworks.com/matlabcentral/fileexchange/23629-export-fig
file_path = fileparts(mfilename('fullpath'));
addpath([file_path, '\export_fig']);

% LINSPECER: Plot lots of lines with very distinguishable and aesthetically pleasing colors
% can be dowloaded at (22/11/2017):
% https://se.mathworks.com/matlabcentral/fileexchange/42673-beautiful-and-distinguishable-line-colors-+-colormap
addpath([file_path, '\linspecer']);

plot_def = struct;
% line styles:
plot_def.line = {'-', '--', ':', '-.'};

% line width:
plot_def.line_width = 2.0;

% markers:
plot_def.marker = {'o', 's', 'd', '^', 'v', '>', '<', 'p', 'h', '+', '*', '.', 'x'};

% marker size:
plot_def.marker_size = 15.0;

% MATLAB's standard colors:
plot_def.color_std = {'r', 'g', 'b', 'y', 'm', 'c', 'k', 'w'};

% different colors:
plot_def.color = linspecer(8, 'qualitative');

% figure exporting settings:
plot_def.export = {'-svg', '-png', '-transparent', '-nofontswap'}; % '-pdf', 

% font size:
plot_def.font_size = 12;

% font name:
plot_def.font_name = 'Times';

% font settings:
plot_def.font = {'fontName', plot_def.font_name, 'fontSize', plot_def.font_size};

% LaTeX settings:
plot_def.LaTeX_setting = [plot_def.font(:)', {'interpreter'}, {'LaTeX'}];

% Save as .mat file:
save('plot_settings', 'plot_def');

% window ratio:
% window_ratio = (1.0 + sqrt(5.0))/2.0;

% figure sizes:
% big_landscape = {'position', [200 50 [window_ratio 1.0]*945]};
% big_portrait  = {'position', [200 50 [1.0 window_ratio]*585]};
% A4_landscape  = {'units', 'centimeters', 'position', [5 5 29.7 21.0]};
% A4_portrait   = {'units', 'centimeters', 'position', [1 0 21.0 29.7]};
% A5_landscape  = {'units', 'centimeters', 'position', [5 5 21.0 14.8]};
% A5_portrait   = {'units', 'centimeters', 'position', [5 5 14.8 21.0]};
% A6_landscape  = {'units', 'centimeters', 'position', [5 5 14.8 10.5]};
% A6_portrait   = {'units', 'centimeters', 'position', [5 5 10.5 14.8]};

%% centralize last subplot with odd number of plots:
% taken from: (01/06/2018)
% https://se.mathworks.com/matlabcentral/answers/281262-subplot-with-odd-number-of-plots
% fig_axes = findobj(gcf, 'Type', 'Axes');
% 
% pos = get(fig_axes, 'Position');
% new = mean(cellfun(@(v)v(1), pos(1:2)));
% set(fig_axes(1),'Position',[new, pos{1}(2:end)]);
