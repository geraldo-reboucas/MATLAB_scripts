function y = plot_properties(type, idx, idx_color, opts)
%PLOT_PROPERTIES sets the plotting properties (style, width/size, color)
% for different types of plot (e.g. line and marker)
%
% Usage:
%   y = plot_properties('line'  , idx, idx_color, opts);
%   y = plot_properties('marker', idx, idx_color, opts);
%

    if(isempty(idx_color) && ((idx >= 1) && (idx <= length(opts.color))))
        idx_color = idx;
    elseif((idx_color < 1) || (idx_color > length(opts.color)))
        error('prog:input','Color index [%d] is out of boundaries [%d].', idx_color, length(opts.color));
    elseif(idx < 1)
        error('prog:input','Index [%d] is negative.', idx);
    end
    
    y = {};
    type = lower(type);
    
    switch type
        case 'line'
            y = {'lineStyle', opts.line{idx}, ...
                 'lineWidth', opts.line_width, ...
                 'color', opts.color(idx_color, :)};
        case 'marker'
            y = {'marker', opts.marker{idx}, ...
                 'markerSize', opts.marker_size, ...
                 'lineStyle',  'none', ...
                 'markerFaceColor', opts.color(idx_color, :), ...
                 'markerEdgeColor', opts.color(idx_color, :)};
        otherwise
            warning('prog:input', 'Type [%s] is invalid', type);
    end
end
