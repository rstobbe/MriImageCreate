%====================================================
%
%====================================================

function [default] = CreateImage_v1e_Default2(SCRPTPATHS)

if strcmp(filesep,'\')
    importpath = [SCRPTPATHS.voyagerloc,'Image Create\Underlying\Selectable Functions\Import FID\'];
    imconpath = [SCRPTPATHS.voyagerloc,'Image Create\Underlying\Selectable Functions\Image Construction\'];
    imscalepath = [SCRPTPATHS.voyagerloc,'Image Create\Underlying\Selectable Functions\Image Scale\'];
elseif strcmp(filesep,'/')
end
importfunc = 'ImportFID_Siemens_v2h';
imconfunc = 'ImConst_3DNonCart_v1g';
imscalefunc = 'ImScaleSiemens_v1a';

m = 1;
default{m,1}.entrytype = 'OutputName';
default{m,1}.labelstr = 'Image_Name';
default{m,1}.entrystr = '';

m = m+1;
default{m,1}.entrytype = 'ScriptName';
default{m,1}.labelstr = 'Script_Name';
default{m,1}.entrystr = '';

m = m+1;
default{m,1}.entrytype = 'ScrptFunc';
default{m,1}.labelstr = 'ImportFIDfunc';
default{m,1}.entrystr = importfunc;
default{m,1}.searchpath = importpath;
default{m,1}.path = [importpath,importfunc];

m = m+1;
default{m,1}.entrytype = 'ScrptFunc';
default{m,1}.labelstr = 'ImConstfunc';
default{m,1}.entrystr = imconfunc;
default{m,1}.searchpath = imconpath;
default{m,1}.path = [imconpath,imconfunc];

m = m+1;
default{m,1}.entrytype = 'ScrptFunc';
default{m,1}.labelstr = 'ImScalefunc';
default{m,1}.entrystr = imscalefunc;
default{m,1}.searchpath = imscalepath;
default{m,1}.path = [imscalepath,imscalefunc];

m = m+1;
default{m,1}.entrytype = 'RunScrptFunc';
default{m,1}.scrpttype = 'Image';
default{m,1}.labelstr = 'Create Image';
default{m,1}.entrystr = '';
default{m,1}.buttonname = 'Run';

