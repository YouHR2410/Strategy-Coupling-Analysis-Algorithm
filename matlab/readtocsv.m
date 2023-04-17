%csvfile='C:\Users\a\Desktop\Sexp-4236.csv'; startRound=4001;
csvfile='C:\Users\华为\Desktop\毕业论文\A5仿真数据\Sexp-4236.csv'; startRound=4001;filename='C:\Users\华为\Desktop\毕业论文\A5仿真数据\Sexp-4236_tial.csv';
function    % (filename, 4001)  
 
%
% 输出：数组a  
% 输入：csvfile  abed 的输出数据文件 
%
% 测试用例 1
%   csvfile='D:\M\MSabed-1pop.csv'
%   [MSdata msdata_all]=readAbed(csvfile)
%   a 就是所需的时间序列
%   [num,txt,raw] = xlsread('abed-1pop4d.csv');
%
%

    [num,txt,raw] = xlsread(csvfile);
    v = cell2table(raw(length(txt(:,1))+1:length(raw(:,1)),:));
    tm=table2array(v); 
    
% 将数据分解成 5 列，各个策略的自己的密度 a(:,1:5)
    N=4; 
        a_1=[];
        for i =2:4:2+N*4-1
                a_1=[a_1 tm(:,i)-tm(:,i+4)]; %
        end
        a_1=[a_1 tm(:,2+N*4)];
% 构造 6 7 二列为合成的策略；        
%         a(:,6) =  a(:,1) +  a(:,4);
%         a(:,7) =  a(:,2) +  a(:,5); 

    t_head = a_1(1:startRound,:);
    a_tial = a_1(startRound:end,:);  % 20220730; 
    csvwrite(filename, a_tial);
end