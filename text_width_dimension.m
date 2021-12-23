function prop = text_width_dimension(port_land, wid_hei, length)
%TEXT_WIDTH_DIMENSION returns figure properties with format 'portrait' or
% 'landscape' with same height/width as in your document. 
% 
% LaTeX code taken from: (01/03/2018)
% http://www.alecjacobson.com/weblog/?p=2576
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
% other dimensions can be found on: 
% https://en.wikibooks.org/wiki/LaTeX/Lengths
%

    % window ratio:
    window_ratio = (1.0 + sqrt(5.0))/2.0;
    
    if(isempty(port_land) || strcmp(port_land, 'landscape') || strcmp(port_land, 'Landscape'))
        if(isempty(wid_hei) || strcmp(wid_hei, 'w') || strcmp(wid_hei, 'width'))
            width  = length;
            height = width/window_ratio;
        elseif(strcmp(wid_hei, 'h') || strcmp(wid_hei, 'height'))
            height = length;
            width  = height*window_ratio;
        else
            width  = 10.0;
            height = 10.0;
            error('prog:input', ...
                  'Option: %s INVALID! Options are ''width'' and ''portrait''.\n', wid_hei);
        end
    elseif(strcmp(port_land, 'portrait') || strcmp(port_land, 'Portrait'))
        if(isempty(wid_hei) || strcmp(wid_hei, 'w') || strcmp(wid_hei, 'width'))
            width  = length;
            height = window_ratio*width;
        elseif(strcmp(wid_hei, 'h') || strcmp(wid_hei, 'height'))
            height = length;
            width  = height/window_ratio;
        else
            width  = 10.0;
            height = 10.0;
            error('prog:input', ...
                  'Option: %s INVALID! Options are ''width'' and ''portrait''.\n', wid_hei);
        end
    else
        prop = {};
        error('prog:input', ...
              'Option: %s INVALID! Options are (P/p)ortrait and (L\l)andscape.\n', port_land);
    end
    
    prop = {'units', 'centimeters', 'position', [5 5 width height]};
    
end
