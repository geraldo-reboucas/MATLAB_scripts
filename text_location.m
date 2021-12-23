function hOut = text_location(textString,varargin)
%TEXT_LOCATION function used to automatically place a text object at the
%'best' location similar to a 'legend' object. Please note that the use of
%this function will delete any legend currently in the figure window. If
%you wish to use a legend in your figure, please specify it after calling
%the 'TextLocation' function.
%
% Examples:
% plot(1:10);
% TextLocation('Hello','Location','best');
%
% plot(1:10);
% TextLocation('Hello','Location','southwest');
%
%   See also LEGEND, ANNOTATION, TEXT.
%
% taken from (27/02/2018):
% https://se.mathworks.com/matlabcentral/answers/98082-how-can-i-automatically-specify-a-best-location-property-for-the-textbox-annotation-function
%
    leg = legend(textString, varargin{:});
    text_box = annotation('textbox');
    text_box.String = textString;
    text_box.Position = leg.Position;
    delete(leg);
    text_box.LineStyle = 'None';

    if nargout
        hOut = text_box;
    end
end