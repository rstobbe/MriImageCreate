%=========================================================
% (v2a) 
%       - accomodate new objects
%=========================================================

function [SCRPTipt,SCRPTGBL,err] = CreateImage_Rws_v2a(SCRPTipt,SCRPTGBL)

Status('busy','Write ');
Status2('done','',2);
Status2('done','',3);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Clear Naming
%---------------------------------------------
inds = strcmp('Image_Name',{SCRPTipt.labelstr});
indnum = find(inds==1);
if length(indnum) > 1
    indnum = indnum(SCRPTGBL.RWSUI.scrptnum);
end
SCRPTipt(indnum).entrystr = '';
setfunc = 1;
DispScriptParam(SCRPTipt,setfunc,SCRPTGBL.RWSUI.tab,SCRPTGBL.RWSUI.panelnum);

%---------------------------------------------
% Tests
%---------------------------------------------
if not(isfield(SCRPTGBL,'Samp_File_Data'))
    if isfield(SCRPTGBL.CurrentTree.('Samp_File').Struct,'selectedfile')
    file = SCRPTGBL.CurrentTree.('Samp_File').Struct.selectedfile;
        if not(exist(file,'file'))
            err.flag = 1;
            err.msg = '(Re) Load Samp_File - path no longer valid';
            ErrDisp(err);
            return
        else
            load(file);
            saveData.path = file;
            SCRPTGBL.('Samp_File_Data') = saveData;
        end
    else
        err.flag = 1;
        err.msg = '(Re) Load Samp_File';
        ErrDisp(err);
        return
    end
end
if not(isfield(SCRPTGBL,'Wrt_File_Data'))
    if isfield(SCRPTGBL.CurrentTree.('Wrt_File').Struct,'selectedfile')
    file = SCRPTGBL.CurrentTree.('Wrt_File').Struct.selectedfile;
        if not(exist(file,'file'))
            err.flag = 1;
            err.msg = '(Re) Load Wrt_File - path no longer valid';
            ErrDisp(err);
            return
        else
            load(file);
            saveData.path = file;
            SCRPTGBL.('Wrt_File_Data') = saveData;
        end
    else
        err.flag = 1;
        err.msg = '(Re) Load Wrt_File';
        ErrDisp(err);
        return
    end
end

%---------------------------------------------
% Load Input
%---------------------------------------------
IMG.method = SCRPTGBL.CurrentTree.Func;
IMG.imgmethfunc = SCRPTGBL.CurrentTree.ImgMethfunc.Func;

%---------------------------------------------
% Load Implementation
%---------------------------------------------
SAMP = SCRPTGBL.Samp_File_Data.SAMP;
WRT = SCRPTGBL.Wrt_File_Data.WRT;

%---------------------------------------------
% Get Working Structures from Sub Functions
%---------------------------------------------
IMGMETHipt = SCRPTGBL.CurrentTree.('ImgMethfunc');
if isfield(SCRPTGBL,('ImgMethfunc_Data'))
    IMGMETHipt.ImgMethfunc_Data = SCRPTGBL.ImgMethfunc_Data;
end

%---------------------------------------------
% Write
%---------------------------------------------
func = str2func(IMG.imgmethfunc);           
[IMGMETH,err] = func(IMGMETHipt);
if err.flag
    return
end
err = IMGMETH.CreateImage(SAMP,WRT);
if err.flag
    return
end
IMG = IMGMETH;

%--------------------------------------------
% Output to TextBox
%--------------------------------------------
global FIGOBJS
FIGOBJS.(SCRPTGBL.RWSUI.tab).Info.String = IMG.ExpDisp;

%--------------------------------------------
% Return
%--------------------------------------------
name = inputdlg('Name System Writing:','System Writing',1,{IMG.name});
if isempty(name)
    SCRPTGBL.RWSUI.KeepEdit = 'yes';
    SCRPTGBL.RWSUI.SaveGlobal = 'no';
    return
end
IMG.name = name{1};

SCRPTipt(indnum).entrystr = IMG.name;
SCRPTGBL.RWSUI.SaveVariables = IMG;
SCRPTGBL.RWSUI.SaveVariableNames = 'IMG';            
SCRPTGBL.RWSUI.SaveGlobal = 'yes';
SCRPTGBL.RWSUI.SaveGlobalNames = IMG.name;
SCRPTGBL.RWSUI.SaveScriptOption = 'yes';
SCRPTGBL.RWSUI.SaveScriptPath = 'outloc';
SCRPTGBL.RWSUI.SaveScriptName = IMG.name;

Status('done','');
Status2('done','',2);
Status2('done','',3);

