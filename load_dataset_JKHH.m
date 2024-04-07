% Load dataset which is bandpass filtered and downsampled III_IVa.
% made from 'load_dataset_filt.m'
% No change is applied except for functionalize.
% by Uehara

function [ ddata ] = load_dataset_JKHH(subject)

%clear all

%path = '../midatasets'
path = '/Users/rabiul/Desktop/Musa project/datasets/midatasets/fs128/';
%path = './III_IVa/bandpassof7to30Hz_downsampledto100Hz';
%path = '../III_IVa/bandpassof7to30Hz_downsampledto100Hz';

ii = subject;
fn{1} = 'sa'; dirc{1} = path; dlab{1} = 's3a'; mcls(1) = 2; dur(1) = 4.0; delay(1) = 0;
fn{2} = 'sb'; dirc{2} = path; dlab{2} = 's3l'; mcls(2) = 2; dur(2) = 4.0; delay(2) = 0;
fn{3} = 'sc'; dirc{3} = path; dlab{3} = 's3v'; mcls(3) = 2; dur(3) = 4.0; delay(3) = 0;
fn{4} = 'sd'; dirc{4} = path; dlab{4} = 's3w'; mcls(4) = 2; dur(4) = 4.0; delay(4) = 0;
fn{5} = 'se'; dirc{5} = path; dlab{5} = 's3y'; mcls(5) = 2; dur(5) = 4.0; delay(5) = 0;

%ii = 3; % index of dataset you want to load
[ddata originalsig originalpos nfo]  = dcompose(fn{ii}, dirc{ii}, [7 30], dur(ii), delay(ii));
% mu rithm 7,8-11,12 Hz

%N = size(ddata.sig, 1);
%M = size(ddata.sig, 2);

% ddate: signals divided by trials
% ddata.sig: signal, TIME x CHANNEL x TRIAL
% ddata.prd: original time point, SAMPLE POINT x TRIAL
% ddata.labels: class labels of all trial
% originalsig: continous signal, SAMPLE x CHANNEL
% originalpos: cue positions for original continous signal, TRIAL
% nfo: informations
% nfo.fs: sampling frequency
% nfo.clab: channel names
% nfo.xpos: channel positions along x-axis
% nfo.ypos: channel positions along y-axis