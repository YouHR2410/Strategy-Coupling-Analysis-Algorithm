

%csvfile='C:\Users\a\Desktop\0306payoffs.csv'; startRound=4001;

function [t_head Yret3  YretAvg Mean5 ]=read_5angl_for_payoff(csvfile, startRound)  % (filename, 2001)  
 
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
                a_1=[a_1 tm(:,i)]; %-tm(:,i+4)
        end
        a_1=[a_1 tm(:,2+N*4)];
% 构造 6 7 二列为合成的策略；        
%         a(:,6) =  a(:,1) +  a(:,4);
%         a(:,7) =  a(:,2) +  a(:,5); 

    t_head = a_1(1:startRound,:);
    a_tial = a_1(startRound:end,:);  % 20220730; 

angle=[];
    for m=1:4
        for n=m+1:5
                x=a_tial(:,m);
                y=a_tial(:,n);
                s=1;
                L=[0,0,0];
            for j=1:1:length(a_tial(:,1))-1
               NE=mean(a_tial);
                % NE=[ 2/5, 1/5, 1/5, 1/5, 2/5, 1/5, 1/5, 1/5];
                %NE=[ 444/2987, 22/103, 641/2987, 288/2987, 976/2987];
                 x1=(x(j+1)-NE(m));
                 y1=(y(j+1)-NE(n));
                 x0=(x(j)-NE(m));
                 y0=(y(j)-NE(n));
                 detx=x1-x0;
                 dety=y1-y0;
                 l=cross([x0,y0,0],[detx,dety,0]) ;
                 L=L+l;
                 s=s+1;
            end
                angle=[angle;L];
        end
    end
    Yret1 = angle; 
    Yret3 = angle(:,3);
    YretAvg=Yret3/(length(a_tial(:,1))-1);
    Mean5 = NE;
end


