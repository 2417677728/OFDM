
function [mout] = mseq(n, taps, inidata, num)

% ****************************************************************
% n         : m���еĽ���n
% taps      : �����Ĵ���������λ��
% inidata   : �Ĵ����ĳ�ʼֵ���� 
% num       : �����m���еĸ���
% mout      : �����m���У����num>1,��ÿһ��Ϊһ��m����
% ****************************************************************



mout = zeros(num,2^n-1);
fpos = zeros(n,1);

fpos(taps) = 1;

for ii=1:2^n-1
    
    mout(1,ii) = inidata(n);                        % 寄存器的输出�?
    temp        = mod(inidata*fpos,2);              % 计算反馈数据 
    
    inidata(2:n) = inidata(1:n-1);                  % 寄存器移位一�?
    inidata(1)     = temp;                          % 更新�?1个寄存器的�?? 
    
end

if num > 1                                          %如果要输出多个m序列，生成其他m序列
    for ii=2:num
        mout(ii,:) = shift(mout(ii-1,:),1);
    end
end
