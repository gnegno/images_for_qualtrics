clear all; close all; clc

load data.mat
dir = './subset';
im_names = ls('*.png');
n_to_sample = 160;

%% 
selected_idxs = str2num(im_names(:,6:8));  %#ok<ST2NM>
% Here all the numbers from the file names, that are indexes for subset_features


sampled_idxs = randsample(selected_idxs,n_to_sample);

fullHist(sampled_features(sampled_idxs,:));

%% Copy files
run_dirs = ls(strcat(dir,'/run*'));

for i = 1:length(sampled_idxs)
    copyfile(im_names(sampled_idxs(i),:), ...
        fullfile(dir,run_dirs(floor((i-1)/40)+1,:)));
end

%% 

subset_features = sampled_features(sampled_idxs,:);
subset_tMatrix =  sampled_tMatrix(:,:,sampled_idxs);





