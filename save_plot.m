function save_plot(fig_name, export_setting)
    gcf;
    fprintf('Want to change anything before saving?\n');
    pause;
    export_fig(fig_name, export_setting{:});
    savefig(fig_name);
    fprintf('Figure ''%s'' saved succesfully as .pdf, .png and .mat.\n', fig_name);

end
