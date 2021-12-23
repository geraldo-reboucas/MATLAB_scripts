function SS = add_ciphers(str)
%ADD_CIPHERS add '$' character at the beginning and end of an sring or
%string array.

    SS = str;
    flag = contains(str, '$');
    
    if(~any(flag))
        one2N = 1:length(str);
        one2N = one2N(~flag);
        for idx = one2N
            SS{idx} = strcat('$', str{idx}, '$');
        end
    else
        warning('prog:input', ...
                'The string already contains the ciphers [$].');
    end
end
