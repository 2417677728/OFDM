
function [mout] = mseq(n, taps, inidata, num)

% ****************************************************************
% n         : m序列的阶数n
% taps      : 反馈寄存器的连接位置
% inidata   : 寄存器的初始值序列 
% num       : 输出的m序列的个数
% mout      : 输出的m序列，如果num>1,则每一行为一个m序列
% ****************************************************************



mout = zeros(num,2^n-1);
fpos = zeros(n,1);

fpos(taps) = 1;

for ii=1:2^n-1
    
    mout(1,ii) = inidata(n);                        % 寄存器的输出值
    temp        = mod(inidata*fpos,2);              % 计算反馈数据 
    
    inidata(2:n) = inidata(1:n-1);                  % 寄存器移位一次
    inidata(1)     = temp;                          % 更新第1个寄存器的值 
    
end

if num > 1                                          %如果要输出多个m序列，生成其他m序列
    for ii=2:num
        mout(ii,:) = shift(mout(ii-1,:),1);
    end
end
