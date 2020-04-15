%扩频函数
function [out] = spread(data, code)

% ****************************************************************
%   data   : 输入数据序列
%   code   : 扩频码序列
%   out    : 扩频后的输出数据序列
% ****************************************************************

switch nargin
case { 0 , 1 }                                  %如果输入参数个数不对，提示错误
    error('缺少输入参数');
end

[hn,vn] = size(data);
[hc,vc] = size(code);

if hn > hc                                      %如果扩频码数小于输入的待扩频的数据序列，提示错误
    error('缺少扩频码序列');
end

out = zeros(hn,vn*vc);

for ii=1:hn
    out(ii,:) = reshape(code(ii,:).'*data(ii,:),1,vn*vc);
end

%******************************** end of file ********************************
