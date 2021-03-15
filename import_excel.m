
% Saeed Pourkhalkhali   2021-03-14
% import excel to matlab file
clear;
clc;

flag = 0;
filename = 'DataSet.xls';
while flag == 0
    prompt = input('please enter the sheet name {monitor, escape, fall}: ', 's');
    if ~isempty(prompt) && ismember(prompt, {'monitor', 'escape', 'fall'})
        flag = 1;
        all_sheet = {['Req_', prompt, '_Depend'], ['Req_', prompt, '_Priority'],...
            ['Req_', prompt, '_gold']};
    else
        disp('please enter the correct sheet!!!')
    end
end

% Req_Depend
sheet_name = all_sheet{1, 1};
[~, txt] = xlsread(filename, sheet_name);
txt = txt(2:end, [1, 3:end]);
data_dep = double(string(replace(txt, 'RT', '')));

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
