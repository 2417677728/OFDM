
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
    
    mout(1,ii) = inidata(n);                        % 瀵勫瓨鍣ㄧ殑杈撳嚭鍊?
    temp        = mod(inidata*fpos,2);              % 璁＄畻鍙嶉鏁版嵁 
    
    inidata(2:n) = inidata(1:n-1);                  % 瀵勫瓨鍣ㄧЩ浣嶄竴娆?
    inidata(1)     = temp;                          % 鏇存柊绗?1涓瘎瀛樺櫒鐨勫?? 
    
end

if num > 1                                          %濡傛灉瑕佽緭鍑哄涓猰搴忓垪锛岀敓鎴愬叾浠杕搴忓垪
    for ii=2:num
        mout(ii,:) = shift(mout(ii-1,:),1);
    end
end
