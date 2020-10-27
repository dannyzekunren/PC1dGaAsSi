function[power,Gtr]=Power(J,k,top)
T=300;

q=1.60217646e-19;
fw=2.16e-5 ;%dilution factor from sun
sigma=1e-16/10000;
c=299792458;
h=6.626068e-34/q;

Tsun=6000;
eg=1.519-((5.045e-4*T^2)/(T+204)); %perov bandgap
nt=1.75e16*1000000;%number of traps
kb=1.3806503e-23; %boltsmanns in J

ni=1.79e6;
hj=6.626068e-34;
eps0=8.85418782e-12; %epsilon0
% recombination coefficienct calculated from black body rediation
%for j=1:1:10,
B=0;%2.65e-10;  %calculated from radiation
    

pa=dlmread('pa1');%pa1 =200nmperovd, 2=240nm, 3=1000nm
tr=dlmread('tr1');




a=J;

str1= ['Gtop' num2str(top) '.gen'];    
pc1dSet('perov.prm','CExcite::m_Filename',str1);

str2= ['Gbot' num2str(top) '.gen'];    
pc1dSet('Si.prm','CExcite::m_Filename',str2)
   


[c d] = dos(['cmd-pc1d.exe perov.prm']);
data = textscan(d,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
data = [data{:}];



Gtemp=dlmread(str1);
Gbtemp=dlmread(str2);


dlmwrite('Gpr1.gen', Gtemp,'delimiter', '\t','newline','pc');
dlmwrite('Gb1.gen', Gbtemp,'delimiter', '\t','newline','pc');
 % unit nm;
    

    
for j=1:1;
       
   str3= ['Gpr' num2str(j) '.gen'] ;
   str4= ['Gpr' num2str(j+1) '.gen'];
   pc1dSet('perov.prm','CExcite::m_Filename',str3)
   
[e f] = dos(['cmd-pc1d.exe perov.prm']);
data1 = textscan(f,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
data1 = [data1{:}];
x1=min(find(data1(:,2)>0.2)); 
y1=60;
Vm =interp1(data1(x1:y1,1),data1(x1:y1,2),a,'pchip');% calculate Voc

%%Jo=Jsc/exp(q*Voc/kb/T)% calculate Jo
Remitt=B*ni^2*(exp(q*(Vm /kb/T)));


Remitt=Remitt*pa;% space resolution 1nm

Cr=cumsum(Remitt);


dis=1:1:top;
    dis=dis';
     LogDis=logspace(log10(dis(1)),log10(top-0.00001),100);%100 used as universal number of pc1d input
Gr=0;%interp1(dis,Cr,LogDis);
Gr=Gr';

Ggen=dlmread('Gpr1.gen');
Ggen(:,2)=Ggen(:,2)+Gr/1e7;
dlmwrite(str4, Ggen,'delimiter', '\t','newline','pc')
end
V1=Vm;



Gtr=max(cumsum(B*ni^2*(exp(q*(V1/kb/T)))*tr));
Gsi=dlmread('Gb1.gen');

alpha=431;%cm-1
Ggg=Gtr*(1-exp(-alpha*Gsi(:,1)))/1e7;
Gsi(:,2)=Gsi(:,2)+Ggg;
dlmwrite('Gb2.gen', Gsi,'delimiter', '\t','newline','pc');


pc1dSet('Si.prm','CExcite::m_Filename','Gb2.gen');

[h g] = dos(['cmd-pc1d.exe Si.prm']);
data2 = textscan(g,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
data2 = [data2{:}];

Jscb=interp1(data2(5:60,2),data2(5:60,1),0);
pb=min(data2(:,3));
power=a*V1+pb;

%power(i)=interp1(data1(x1:y1,1),data1(x1:y1,3),a(i))+interp1(data2(x:y,1),data2(x:y,3),a(i),'spline');

end

