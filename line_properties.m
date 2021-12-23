function y = line_properties(idx, idx_color, line_style, line_width, line_color)
%LINE_PROPERTIES sets plotting properties for each line with index idx.

    if(isempty(idx_color) && ((idx >= 1) && (idx <= length(line_color))))
        idx_color = idx;
    elseif((idx_color < 1) || (idx_color > length(line_color)))
        error('prog:input','Color index [%d] is out of boundaries [%d].', idx_color, length(line_color));
    elseif((idx < 1) || (idx > length(line_style)))
        error('prog:input','Index [%d] is out of boundaries [%d].', idx, length(line_style));
    end
    
    y = {'lineStyle', line_style{idx}, ...
         'lineWidth', line_width, ...
         'color', line_color(idx_color, :)};
end
