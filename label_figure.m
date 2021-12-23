function label_figure(fig_axes, font_setting)
%LABEL_FIGURE inserts alphabetic labels [(a), (b), ...] on each subplot of
%a figure
% based on: (16/02/2018)
% https://se.mathworks.com/matlabcentral/answers/286003-annotation-box-left-corner-position
%
    tam = length(fig_axes);
    
    if(tam > 1)
        fig_axes = flipud(fig_axes);
        letter = char(97:122);

        pos = arrayfun(@plotboxpos, fig_axes, 'uni', 0);
%         pos = get(fig_axes, 'position');
        dim = cellfun(@(x) x.*[1 1 0.5 0.5], pos, 'uni', 0);

        for idx = 1:tam
            annotation(gcf, 'textbox',  dim{idx}, ...
                            'String', ['(', letter(idx), ')'], ...
                            font_setting{:}, 'vert', 'bottom', ...
                            'FitBoxToText', 'on', 'lineStyle', 'none');
        end
    else
        warning('prog:input', ...
                'The current figure has only one axes. There is no need for a letter label.');
    end
end
