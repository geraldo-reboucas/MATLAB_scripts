function super_save(fig_name, export_setting, fig_dim, has_leg)

    % check if folder exist:
    if(~exist(fig_name, 'dir'))
        mkdir(fig_name);
    end
    
    str = input(['Press [q/Q] to quit without saving, or do some small modifications \n', ...
                 'on the figure and press ENTER to save it.\n'], 's');
    if(isempty(str) || ((str ~= 'q') && (str ~= 'Q')))
        print(fig_name, '-dpng');
        flag = true;
        try
            export_fig(gcf, fig_name, export_setting{:});
        catch
            warning('export_fig did not worked.');
            flag = false;
        end
        savefig(fig_name);
        tikz = @(x)([x, '.tikz']);
        matlab2tikz('filename', tikz(fig_name), 'showInfo', false);

        fig_axes = findobj(gcf, 'Type', 'Axes');
        fig_axes = flipud(fig_axes);

        fig_legs = findobj(gcf, 'Type', 'Legend');
        fig_legs = flipud(fig_legs);

        tam = length(fig_axes);
        if(tam > 1)

            if(length(has_leg) ~= tam)
                error('has_leg must have the same number of elements as axes.');
            end

            leg_idx = 0;
            for idx = 1:tam
                axes_idx = fig_axes(idx);

                % create temporary figure:
                tmp_fig = figure(fig_dim{:}, 'Visible', 'off');
                copyobj(axes_idx, tmp_fig);
                tmp_fig.Visible = 'off';

                % add legend:
                if(has_leg(idx))
                    leg_idx = leg_idx + 1;
                    leg = fig_legs(leg_idx);
                    legend(               leg.String, ...
                           'location',    leg.Location, ...
                           'fontName',    leg.FontName, ...
                           'fontSize',    leg.FontSize, ...
                           'interpreter', leg.Interpreter, ...
                           'NumColumns',  leg.NumColumns, ...
                           'Orientation', leg.Orientation, ...
                           'Position',    leg.Position, ...
                           'Box',         leg.Box);
                end

                % create temporary name:
                name_idx = sprintf('%s\\%d_of_%d', fig_name, idx, tam);

                % save the temporary figure:
                print(     tmp_fig, name_idx, '-dpng');
                if(flag)
                    export_fig(tmp_fig, fig_name, '-append', export_setting{:});
                end
                savefig(    tmp_fig, name_idx);
                matlab2tikz('figurehandle', tmp_fig, ...
                            'filename', tikz(name_idx), ...
                            'showInfo', false);

                % close the temporary figure:
                close(tmp_fig);
            end
        else
            warning('prog:input', ...
                'The current figure has only one axes. There is no need for a subplot save.');
        end
    end
end
