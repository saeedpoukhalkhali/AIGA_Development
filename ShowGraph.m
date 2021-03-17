% Saeed Pourkhalkhali   2021-03-16
function ShowGraph(coordi_mat, unic_data_all)

name = cell(size(unic_data_all));

for i = 1:size(unic_data_all)
    name(i) = cellstr('R'+ string(unic_data_all(i)));
end

figure();
g = digraph(coordi_mat, name);
plot(g)

end
