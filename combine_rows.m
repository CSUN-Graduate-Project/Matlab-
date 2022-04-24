function out = combine_rows(a,b,d,e)
           
c = union([a, b],[d, e],'rows');
[values, ~, ids] = unique(c(:, [1]), 'rows');
out = splitapply(@(rows) sum(rows, 1), c, ids);
out(:, [1]) = values;

end
