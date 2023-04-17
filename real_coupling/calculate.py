# -*- coding: utf-8 -*-
import pandas as pd

def calculate_real(csv_name,start_round):
    data = pd.read_csv(csv_name)
    #data = df[['y','y.1','y.2','y.3']]
    #columns = data.columns.tolist()
    #for i,col in enumerate(columns[:-1]):
#    data[col] = data[col] - data[columns[i+1]]
    start = start_round
    #data = data[start:len(data)]
    #print(data)
    avg = data.mean().tolist()
    sum_lst = []
    for i in range(len(data.iloc[0])):
        for j in range(i,len(data.iloc[0])):
            sum = 0
            for k in range(len(data)):
                sum+=(data.iloc[k,i]-avg[i])*(data.iloc[k,j]-avg[j])
            sum_lst.append(sum)
    return  sum_lst


def calculate_real2(csv_name,start_round):
    df = pd.read_csv(csv_name)
    data = df[['y','y.1','y.2','y.3']]
    columns = data.columns.tolist()
    for i,col in enumerate(columns[:-1]):
        data[col] = data[col] - data[columns[i+1]]
    start = start_round
    data = data[start:len(data)]
    #print(data)
    avg = data.mean().tolist()
    sum_lst = []
    for i in range(len(data.iloc[0])):
        for j in range(i,len(data.iloc[0])):
            sum = 0
            for k in range(len(data)):
                sum+=(data.iloc[k,i]-avg[i])*(data.iloc[k,j]-avg[j])
            sum_lst.append(sum)
    return  sum_lst

#q:what is the difference between the two functions?
#a:the first function is used to calculate the real covariance matrix, the second function is used to calculate the covariance matrix of the difference of the data

#q:what does the function calculate_real2 do?
#a:the function calculate_real2 is used to calculate the covariance matrix of the difference of the data

