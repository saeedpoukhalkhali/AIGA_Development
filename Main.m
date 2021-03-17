% import excel to matlab file
clear;
close all;
clc;

% please activate one of commands below
% prompt = 'monitor';
% prompt = 'escape';
prompt = 'fall';
% prompt = 'all';

% set data and select values
filename = 'DataSet.xls';
all_sheet = {['Req_', prompt, '_Depend'], ['Req_', prompt, '_Priority'],...
    ['Req_', prompt, '_gold']};

% Req_Depend
sheet_name = all_sheet{1, 1};
[~, txt] = xlsread(filename, sheet_name);
txt = txt(2:end, [1, 3:end]);
data_dep = double(string(replace(txt, 'RT', '')));

for i = size(data_dep, 1):-1:1
    if isnan(data_dep(i, 2))
        data_dep(i, :) = '';
    end
end

% Req_Priority
sheet_name = all_sheet{1, 2};
[num, txt] = xlsread(filename, sheet_name);
txt = txt(2:end, 1);
data_prio = double(string(replace(txt, 'RT', '')));
data_prio(:,2) = num;

% Req_gold
sheet_name = all_sheet{1, 3};
[num, txt] = xlsread(filename, sheet_name);
txt = txt(2:end, 1);
data_gold = double(string(replace(txt, 'RT', '')));
data_gold(:,2) = num;

% prepare graph
[coordi_mat_Depend, uniq_data_dep_all] = PrepareGraph(data_dep, 1);
[coordi_mat_Priority, uniq_data_prio_all] = PrepareGraph(data_prio, 2);
[coordi_mat_gold, uniq_data_gold_all] = PrepareGraph(data_gold, 3);

% show graph
ShowGraph(coordi_mat_Depend, uniq_data_dep_all, "Req-" + prompt + "-Depend");
ShowGraph(coordi_mat_Priority, uniq_data_prio_all, "Req-" + prompt + "-Priority");
ShowGraph(coordi_mat_gold, uniq_data_gold_all, "Req-" + prompt + "-gold");
