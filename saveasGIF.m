function saveasGIF(filename, idx)
%SAVEASGIF this function should be placed on your code in the following way:
% figure;
% filename = 'name.gif';
% for idx = 1:n
% plot(x,y) % plot whatever you want
% saveasGIF(filename, idx);
% end % for
% filename is the name of the file
% idx is the frame that you are plotting
%

    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im,256);
    if(idx == 1)
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append');
    end
end
