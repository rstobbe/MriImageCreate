%=========================================================
% (v1p) 
%     - 
%=========================================================

function [SCRPTipt,RECON,err] = Recon_3DGriddingReturnAll_v1p(SCRPTipt,RECONipt)

Status2('busy','Get Info for Image Creation',2);
Status2('done','',3);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Load Panel Input
%---------------------------------------------
RECON.method = RECONipt.Func;
RECON.prec = RECONipt.('Precision');

%---------------------------------------------
% Grid Function
%---------------------------------------------
if strcmp(RECON.prec,'Single')
    RECON.gridfunc = 'GridkSpace_LclKernS_v1l';
else
    RECON.gridfunc = 'GridkSpace_LclKern_v1l';
end

Status2('done','',2);
Status2('done','',3);

