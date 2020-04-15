%信号解扩

function out = despread(data, code)

% ****************************************************************
%   data    : 输入数据序列
%   code    : 解扩使用的扩频码序列
%   out     : 解扩后的输出数据序列
% ****************************************************************

switch nargin                           %如果输入参数个数不对，提示错误
case { 0 , 1 }
    error('缺少输入参数');
end

[hn,vn] = size(data);
[hc,vc] = size(code);                  

out    = zeros(hc,vn/vc);                  

for ii=1:hc
    xx=reshape(data(ii,:),vc,vn/vc);
    out(ii,:)= code(ii,:)*xx/vc;
end

%******************************** end of file ********************************
