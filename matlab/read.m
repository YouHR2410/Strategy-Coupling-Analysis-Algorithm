function [readData] = read()

csvfile='C:\Users\华为\Desktop\毕业论文\A5仿真数据\Sexp4236.csv'; startRound=4001;
[t_head Yret3  YretAvg Mean5 ]=read_5angl_for_stagy(csvfile, startRound)

readData.t_head = t_head;
readData.Yret3 = Yret3;
readData.YretAvg = YretAvg;
readData.Mean5 = Mean5;

save('read.mat', 'readData');