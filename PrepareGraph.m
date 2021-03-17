% Saeed Pourkhalkhali   2021-03-16
function [coordi_mat, uniq_data_all] = PrepareGraph(data, title)

% title = ['Req_Depend'   : 1
%          'Req_Priority' : 2
%          'Req_gold'     : 3

if title == 1
    uniq_data_all = unique(data);
    uniq_data_direct = unique(data(:, 2:end));

    for i = size(uniq_data_all):-1:1
        if isnan(uniq_data_all(i))
            uniq_data_all(i, :) = '';
        end
    end

    for i = size(uniq_data_direct):-1:1
        if isnan(uniq_data_direct(i))
            uniq_data_direct(i, :) = '';
        end
    end

    coordi_mat = zeros(size(uniq_data_all, 1), size(uniq_data_all, 1));

    for i = 1:size(uniq_data_direct)
        [chk_row, ~] = find(data(:,2:end) == uniq_data_direct(i));
        while ~isempty(chk_row)
            [chk_row_unic0, ~] = find(uniq_data_all == uniq_data_direct(i));
            [chk_row_unic1, ~] = find(uniq_data_all == data(chk_row(1), 1));
            coordi_mat(chk_row_unic0, chk_row_unic1) = 1;
            chk_row(1, :) = '';
        end
    end
else
    uniq_data_all = sortrows(data, 2);
    uniq_data_direct = unique(data(:, 2));
    coordi_mat = zeros(size(uniq_data_all, 1), size(uniq_data_all, 1));
    [chk_row_base, ~] = find(uniq_data_all(:, 2) == uniq_data_direct(1));
    
    for i = 2:size(uniq_data_direct, 1)
        [chk_row, ~] = find(uniq_data_all(:, 2) == uniq_data_direct(i));
        coordi_mat(chk_row_base, chk_row) = 1;
        chk_row_base = chk_row;
    end
    
    uniq_data_all = uniq_data_all(:, 1);
end

end
