function [code,dict] = HuffmanEncoder(sequence)
    [counts,values] = groupcounts(sequence');
    symbols = values';
    prob = counts';
    totalCount = sum(prob);
    prob = prob./totalCount;

    [dict,~] = huffmandict(symbols,prob);
%     encoding = containers.Map(dict(:,1),dict(:,2));
    code = huffmanenco(sequence,dict);
end

