function fig_dim = figure_dimensions(paper_size, orientation, width)
%FIGURE_DIMENSIONS returns figure properties for different paper sizes (A4,
% A5, A6 or custom) and orientations (portrait or landscape). It is
% recommended to have the text heigth/width of your document while
% producing your figures. Those parameters can be obtained using the
% following LaTeX code, taken from [1]:
%
% [1] http://www.alecjacobson.com/weblog/?p=2576 (accessed on 01/03/2018)
% 
% Here is a snippet you can paste into your LaTeX document to reveal the
% values of \textwidth and \linewidth printed into your document. First
% include this in your header:
%
% \usepackage{layouts}
%
% Then, put this somewhere in your content:
%
% linewidth: the width of a line in the local environment.
% \printinunitsof{cm}\prntlen{\linewidth}
%
% textwidth: The width of the text on the page.
% \printinunitsof{cm}\prntlen{\textwidth}
%
% Other dimensions can be found on: 
% https://en.wikibooks.org/wiki/LaTeX/Lengths
%

    % golden ratio:
%     window_ratio = (1.0 + sqrt(5.0))/2.0;
    
    % window ratio:
    window_ratio = sqrt(2.0);
    
    paper_size = lower(paper_size);
    orientation = lower(orientation);
    dims = [10 10];
    lower_corner = [5 5];
    
    % portrait is the default orientation
    switch paper_size
        case 'custom'
            dims = round([1.0 window_ratio]*width);
        case 'a4'
            dims = [21.0 29.7];
            lower_corner = [1 0];
        case 'a5'
            dims = [14.8 21.0];
        case 'a6'
            dims = [10.5 14.8];
        case 'big'
            dims = round([1.0 window_ratio]*585);
            lower_corner = [200 50];
        otherwise
            warning('prog:input', ...
                    'Paper size [%s] not defined.\n', paper_size);
    end
    
    switch orientation
        case 'portrait'
            % do nothing
%             dims = dims;
        case 'landscape'
            dims = fliplr(dims);
        otherwise
            warning('prog:input', ...
                    'Orientation [%s] not defined.\n', orientation);
    end
    
    % too weird:
%     fig_dim = {'units', 'centimeters', 'position', [lower_corner dims], 'color', 'none'};
    fig_dim = {'units', 'centimeters', 'position', [lower_corner dims]};

end
