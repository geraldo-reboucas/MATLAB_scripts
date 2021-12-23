%% plotting pre-definitions:
% EXPORT_FIG: function to export figures nicely to a number of vector & bitmap formats:
% can be downloaded at (16/05/2017):
% https://se.mathworks.com/matlabcentral/fileexchange/23629-export-fig
addpath('\\home.ansatt.ntnu.no\geraldod\Documents\MATLAB\scripts\export_fig');

% LINSPECER: Plot lots of lines with very distinguishable and aesthetically pleasing colors
% can be dowloaded at (22/11/2017):
% https://se.mathworks.com/matlabcentral/fileexchange/42673-beautiful-and-distinguishable-line-colors-+-colormap
addpath('\\home.ansatt.ntnu.no\geraldod\Documents\MATLAB\scripts\linspecer');

addpath('\\home.ansatt.ntnu.no\geraldod\Documents\MATLAB\scripts\MATLAB2TikZ\src');

% line styles:
line_style = {'-', '--', ':', '-.', ...
              '-', '--', ':', '-.', ...
              '-', '--', ':', '-.', ...
              '-', '--', ':', '-.', ...
              };
      
% line width:
line_width = 2.0;

% markers:
dot_style = {'o', 's', 'd', '^', 'v', '>', '<', 'p', 'h', '+', '*', '.', 'x'};

% marker size:
marker_size = 15.0;

% MATLAB's standard colors:
std_color = {'r', 'g', 'b', 'y', 'm', 'c', 'k', 'w'};

% different colors:
% clr = linspecer(7, 'qualitative');

% figure exporting settings:
export_setting = {'-pdf', '-png', '-transparent', '-nofontswap'};

% font size:
font_size = 12;

% font name:
font_name = 'Times';

% font settings:
font_setting = {'fontName', font_name, 'fontSize', font_size};

% LaTeX settings:
latex_setting = {'fontName', font_name, 'fontSize', font_size, 'interpreter', 'LaTeX'};

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
