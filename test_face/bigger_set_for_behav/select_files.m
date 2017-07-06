clear all; close all; clc
cd('C:\Users\gnolo\Desktop\Code\images_for_qualtrics\test_face\bigger_set_for_behav')
load data.mat

dir = './subset';
im_names = ls('*.png'); 
% List of the filenames
n_to_sample = 160;

addpath(genpath('C:\Users\gnolo\Desktop\Code\cp-stim-feat\Work folder'))

%% 
idxs_images_name_and_features = str2num(im_names(:,6:8));  %#ok<ST2NM>
% Here all the numbers from the file names, that are indexes needed to work
% with subset_features BUT NOT TO COPY THE FILES!

idxs_images_ls_perm = randperm(n_to_sample);
% Those refer to the indices with which the images appear using ls, are
% needed to WORK WITH THE FILES, are referred to im_names.

idxs_images_name_and_features_perm = idxs_images_name_and_features(idxs_images_ls_perm);
% Here we are associating the index with which a filename appears in ls
% with the index related to sampled_features

fullHist(sampled_features(idxs_images_name_and_features_perm,:));

%% Copy files
run_dirs = ls(strcat(dir,'/run*'));

for idx = 1:n_to_sample
    copyfile(im_names(idxs_images_ls_perm(idx),:), fullfile(dir,run_dirs(floor((idx-1)/40)+1,:)));
end

%% 

subset_features = sampled_features(idxs_images_ls_perm,:);
subset_tMatrix =  sampled_tMatrix(:,:,idxs_images_ls_perm);





