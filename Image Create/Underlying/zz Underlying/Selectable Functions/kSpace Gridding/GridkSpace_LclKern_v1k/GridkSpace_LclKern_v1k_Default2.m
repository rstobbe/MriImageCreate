%=========================================================
% 
%=========================================================

function [default] = GridkSpace_LclKern_v1k_Default2(SCRPTPATHS)

m = 1;
default{m,1}.entrytype = 'RunExtFunc';
default{m,1}.labelstr = 'Kern_File';
default{m,1}.entrystr = '';
default{m,1}.buttonname = 'Load';
default{m,1}.runfunc1 = 'LoadConvKernCur';
default{m,1}.(default{m,1}.runfunc1).curloc = SCRPTPATHS.imkernloc;
default{m,1}.runfunc2 = 'LoadConvKernDef';
default{m,1}.(default{m,1}.runfunc2).defloc = SCRPTPATHS.imkernloc;
