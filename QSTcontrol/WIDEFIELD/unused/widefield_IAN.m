%% Start image acquisition

% in this script, the file directories and naming format for each data
% acquisition is saved. It is important that the animal id and the details
% about the stimulus are saved here. This is linked back to the stimulus
% control after the end of the experiment


%% RESET connections.

clear;
imaqreset;

%% SET PARAMETERS
% animal id
% animalid = 'debug';
 %animalid='12622';
%animalid='ian1';
animalid='ian2';
 % animalid='11915';
%animalid='12617';
%animalid='11109';
% animalid='11913';
% animalid='11912';
% animalid
%animalid='11464';
%animalid='11512';
%animalid='11465';
%animalid='11516';

% % %stimulus id
stimnum =5;

switch stimnum
    case 1
        stimid = 'simpletest_cold';
        TMAX = 5; %trial duration (10 seconds)
        NTRIAL =1;
        tstim =2;      %seconds of rec before stim onset
    case 2
        stimid = 'simpletest_touch';
        TMAX = 5; %trial duration (10 seconds)
        NTRIAL =1;
        tstim =2;      %seconds of rec before stim onset
    case 3 
        stimid = 'exp';
        TMAX = 14; %trial duration (10 seconds)
        NTRIAL = 60;
        tstim =5;      %seconds of rec before stim onset
    case 4
        stimid = 'expB';
        TMAX = 10; %trial duration (10 seconds)
        NTRIAL =60;
        tstim =5;      %seconds of rec before stim onset
           
    case 5 
        stimid = 'expTsweep';
        TMAX = 14; %trial duration (10 seconds)
        NTRIAL = 70;
        tstim =5;      %seconds of rec before stim onset
        
    case 6
        stimid = 'exp2paw';
        TMAX = 14; %trial duration (10 seconds)
        NTRIAL = 100;
        tstim =5;      %seconds of rec before stim onset
        
end

%% file directory

filesavedir = 'C:\Users\2P_Resonant\Data\WidefieldRig\';
yy =num2str(year(datetime));
mm = num2str(month(datetime));
dd = num2str(day(datetime));
if numel(mm)<2
    mm = ['0' mm];
end
if numel(dd)<2
    dd = ['0' dd];
end
expdate = [yy mm dd];
filesaveloc = [filesavedir animalid filesep expdate filesep];
if ~isfolder(filesaveloc)
    mkdir(filesaveloc);
end

% ADD TIFF CAPABILITIES
addpath(genpath('TIFF'));

%% Start Data Acquisition
hamamatsu_widefield_triggered_16bit;
