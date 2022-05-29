function z3out = combine_rows(a,a2,...
                            b,b3,...
                            c,c4,...
                            d,d5,...
                            e,e6,...
                            f,f7,...
                            g,g8,...
                            h,h9,...
                            i,i10,...
                            j,j11,...
                            k,k13,...
                            l,l14,...
                            m,m15,...
                            n,n16,...
                            o,o17)
           

%values, ~, ids] = unique(c(:, [1]), 'rows');
%out = splitapply(@(rows) sum(rows, 1), c, ids);
%out(:, [1]) = values;

x1 = union([a,a2],[b,b3],'rows');
[values, ~, ids] = unique(x1(:, [1]), 'rows');
x1out = splitapply(@(rows) sum(rows, 1), x1, ids);
x1out(:, [1]) = values;

x2 = union([c,c4],[d,d5],'rows');
[values, ~, ids] = unique(x2(:, [1]), 'rows');
x2out = splitapply(@(rows) sum(rows, 1), x2, ids);
x2out(:, [1]) = values;

x3 = union([e,e6],[f,f7],'rows');
[values, ~, ids] = unique(x3(:, [1]), 'rows');
x3out = splitapply(@(rows) sum(rows, 1), x3, ids);
x3out(:, [1]) = values;

x4 = union([g,g8],[h,h9],'rows');
[values, ~, ids] = unique(x4(:, [1]), 'rows');
x4out = splitapply(@(rows) sum(rows, 1), x4, ids);
x4out(:, [1]) = values;

x5 = union([i,i10],[j,j11],'rows');
[values, ~, ids] = unique(x5(:, [1]), 'rows');
x5out = splitapply(@(rows) sum(rows, 1), x5, ids);
x5out(:, [1]) = values;

x6 = union([k,k13],[l,l14],'rows');
[values, ~, ids] = unique(x6(:, [1]), 'rows');
x6out = splitapply(@(rows) sum(rows, 1), x6, ids);
x6out(:, [1]) = values;

x7 = union([m,m15],[n,n16],'rows');
[values, ~, ids] = unique(x7(:, [1]), 'rows');
x7out = splitapply(@(rows) sum(rows, 1), x7, ids);
x7out(:, [1]) = values;

y4 = union(x7out,[o,o17],'rows');
[values, ~, ids] = unique(y4(:, [1]), 'rows');
y4out = splitapply(@(rows) sum(rows, 1), y4, ids);
y4out(:, [1]) = values;

y3 = union(x5out,x6out,'rows');
[values, ~, ids] = unique(y3(:, [1]), 'rows');
y3out = splitapply(@(rows) sum(rows, 1), y3, ids);
y3out(:, [1]) = values;

y2 = union(x3out,x4out,'rows');
[values, ~, ids] = unique(y2(:, [1]), 'rows');
y2out = splitapply(@(rows) sum(rows, 1), y2, ids);
y2out(:, [1]) = values;

y1 = union(x1out,x2out,'rows');
[values, ~, ids] = unique(y1(:, [1]), 'rows');
y1out = splitapply(@(rows) sum(rows, 1), y1, ids);
y1out(:, [1]) = values;

z1 = union(y1out,y2out,'rows');
[values, ~, ids] = unique(z1(:, [1]), 'rows');
z1out = splitapply(@(rows) sum(rows, 1), z1, ids);
z1out(:, [1]) = values;

z2 = union(y3out,y4out,'rows');
[values, ~, ids] = unique(z2(:, [1]), 'rows');
z2out = splitapply(@(rows) sum(rows, 1), z2, ids);
z2out(:, [1]) = values;

z3 = union(z1out,z2out,'rows');
[values, ~, ids] = unique(z3(:, [1]), 'rows');
z3out = splitapply(@(rows) sum(rows, 1), z3, ids);
z3out(:, [1]) = values;

end
