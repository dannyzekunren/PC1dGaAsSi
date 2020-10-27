A=xlsread('temp.xlsx')
B=A(:,1)
C=A(:,2)
D=interp1(B,C,300:1200)