function y = plot_properties(type, idx, idx_color, style, width, color)
%PLOT_PROPERTIES sets the plotting properties (style, width/size, color)
% for different types of plot (e.g. line and dot)
%
% Usage:
%   y = plot_properties('line', idx, idx_color, line_style, width, color);
%   y = plot_properties( 'dot', idx, idx_color,  dot_style, width, color);
%

    if(isempty(idx_color) && ((idx >= 1) && (idx <= length(color))))
        idx_color = idx;
    elseif((idx_color < 1) || (idx_color > length(color)))
        error('prog:input','Color index [%d] is out of boundaries [%d].', idx_color, length(color));
    elseif((idx < 1) || (idx > length(style)))
        error('prog:input','Index [%d] is out of boundaries [%d].', idx, length(style));
    end
    
    y = {};
    type = lower(type);
    
    switch type
        case 'line'
            y = {'lineStyle', style{idx}, ...
                 'lineWidth', width, ...
                 'color', color(idx_color, :)};
        case 'dot'
            y = {'marker', style{idx}, ...
                 'markerSize', width, ...
                 'lineStyle',  'none', ...
                 'markerFaceColor', color(idx_color, :), ...
                 'markerEdgeColor', color(idx_color, :)};
        otherwise
            warning('prog:input', 'Type [%s] is invalid', type);
    end
end
