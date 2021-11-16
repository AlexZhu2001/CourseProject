function [x,y] = readPoints(fn)
    file=fopen(fn);
    cols=textscan(file,"%f %f");
    fclose(file);
    x=cols{1};
    y=cols{2};
end

