%=====================================================
% (v1a)
%=====================================================

function [SCRPTipt,ZFIL,err] = ZeroFill_SelectionSS160_v1a(SCRPTipt,ZFILipt,IMP,GRD)

Status2('busy','Zero Fill',2);
Status2('done','',2);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Return Panel Input
%---------------------------------------------
ZFIL.method = ZFILipt.Func;
ZFIL.zf = str2double(ZFILipt.('ZeroFill'));

Status2('done','',2);
Status2('done','',3);









