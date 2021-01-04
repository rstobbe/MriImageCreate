%=====================================================
% (v1g)
%       - handles arrayed images   
%=====================================================

function [SCRPTipt,DCCOR,err] = DCcorPA_TrlFid_v1g(SCRPTipt,DCCORipt)

Status2('busy','DC correct FID',2);
Status2('done','',2);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Return Panel Input
%---------------------------------------------
DCCOR.method = DCCORipt.Func;
DCCOR.trfidper = str2double(DCCORipt.('TrlFid'));
DCCOR.smthwin = str2double(DCCORipt.('SmthWin'));
DCCOR.type = DCCORipt.('Method');

Status2('done','',2);
Status2('done','',3);







