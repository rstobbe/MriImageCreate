%=========================================================
% 
%=========================================================

function [default] = ImgMeth_Basic_v2a_Default2(SCRPTPATHS)

m = 1;
default{m,1}.entrytype = 'Choose';
default{m,1}.labelstr = 'Kernel';
default{m,1}.entrystr = 'KBCw2b5p5ss1p6';
default{m,1}.options = {'KBCw2b5p5ss1p6'};

m = m+1;
default{m,1}.entrytype = 'Input';
default{m,1}.labelstr = 'ZeroFill';
default{m,1}.entrystr = '128';

m = m+1;
default{m,1}.entrytype = 'Choose';
default{m,1}.labelstr = 'ReturnFov';
default{m,1}.entrystr = 'Design';
default{m,1}.options = {'Design','All'};


