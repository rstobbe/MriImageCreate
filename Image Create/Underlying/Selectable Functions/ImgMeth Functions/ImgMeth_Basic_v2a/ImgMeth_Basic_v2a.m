%==================================================================
% (v2a)
%   
%==================================================================

classdef ImgMeth_Basic_v2a < handle

properties (SetAccess = private)                   
    Method = ' ImgMeth_Basic_v2a'
    KRN
    IF
    Panel = cell(0)
    PanelOutput
    ExpDisp
end
properties (SetAccess = public)    
    name
    path
    saveSCRPTcellarray
end

methods 
   
%==================================================================
% Constructor
%==================================================================  
function [IMGMETH,err] =  ImgMeth_Basic_v2a(IMGMETHipt)    
    err.flag = 0;
    global COMPASSINFO
    load([COMPASSINFO.USERGBL.imkernloc,'Kern_',IMGMETHipt.('Kernel')]);
    IMGMETH.KRN = saveData.KRNprms;   
    load([COMPASSINFO.USERGBL.invfiltloc,'IF_',IMGMETHipt.('Kernel'),'zf',IMGMETHipt.('ZeroFill'),'S']);
    IMGMETH.IF = saveData.IFprms;    
end 

%==================================================================
% Write
%================================================================== 
function err = CreateImage(IMGMETH,SAMP,WRT)
  
    

end


end
end






