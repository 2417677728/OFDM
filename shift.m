function [outregi] = shift(inregi,shiftr)

% ****************************************************************
% inrege     : 输入序列
% shiftr     : 循环右移的位数
% outregi    : 输出序列
% ****************************************************************

v  = length(inregi);
outregi = inregi;

shiftr = rem(shiftr,v);

if shiftr > 0
    outregi(:,1:shiftr) = inregi(:,v-shiftr+1:v);     %循环移位
    outregi(:,1+shiftr:v) = inregi(:,1:v-shiftr);
elseif shiftr < 0
    outregi(:,1:v+shiftr) = inregi(:,1-shiftr:v);
    outregi(:,v+shiftr+1:v) = inregi(:,1:-shiftr);
end

%******************************** end of file ********************************
