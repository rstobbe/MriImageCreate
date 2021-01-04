%====================================================
%
%====================================================

function [default] = ZeroFill_SelectionSS400_v1a_Default2(SCRPTPATHS)

m = 1;
default{m,1}.entrytype = 'Choose';
default{m,1}.labelstr = 'ZeroFill';
default{m,1}.entrystr = '400';
mat = (256:16:1220).';
default{m,1}.options = mat2cell(mat,length(mat));
