% Model Statistika Linier
% Vina Fitriyani M. (10108028) 
% Aty Rachmawati (10108050)
clear all;
clc;
format short g
tic;

% Eksperimen Bagian II
% Monte Carlo Simulation
% Misal beta dan s2 diketahui
A=[
81.7    1.78    6.95    1.11    25088
56.9    2.27    7.32    0.67    26561
64.1    2.21    6.96    0.83    25510
65.4    2.15    7.18    0.75    27158
64.1    2.26    7.46    1.06    27162
58.1    2.49    7.47    1.10    27583
61.7    2.52    7.88    1.09    28235
65.3    2.46    7.88    1.18    29413
57.8    2.54    7.97    0.88    28713
63.5    2.72    7.96    1.30    30000
65.9    2.60    8.09    1.17    30533
48.3    2.87    8.24    0.94    30373
55.6    3.00    7.96    0.91    31107
47.9    3.23    8.34    1.10    31126
57.0    3.11    8.10    1.50    32506
51.6    3.11    8.43    1.17    32408
54.2    3.09    8.72    1.18    33423
51.7    3.34    8.87    1.37    33904
55.9    3.31    8.82    1.52    34528
52.1    3.42    8.59    1.15    36019
52.5    3.61    8.83    1.39    34807
44.3    3.55    8.86    1.60    35943
57.7    3.72    8.97    1.73    37323
51.6    3.72    9.13    1.35    36682
53.8    3.70    8.98    1.37    38054
50.0    3.81    9.25    1.41    36707
46.3    3.86    9.33    1.62    38411
46.8    3.99    9.47    1.69    38823
51.7    3.89    9.49    1.71    38361
49.9    4.07    9.52    1.69    41593];

A=log(A);                
y=A(:,1);                   % y : jumlah softdrink dalam liter
T=length(y);                % T : banyaknya data y
X=[ones(T,1) A(:,2:5)];     % matriks X dengan kolom pertama bernilai 1
[T K]=size(X);              % ukuran X dgn T=30, dan K=5

Ftable=2.60;                % nilai F tabel untuk alpha=5%, v1=K, v2=T-K
R9=[0 1 1 1 1];
[J9 K]=size(R9);

r=0;
r2=0.1;

beta=[-4.7978
      -1.2994
       0.1868
       0.1667
       0.9458];

s2=0.0036;

%beta dan s2 ini akan digunakan untuk menciptakan variabel y

rep=100000;              % banyaknya simulasi
s2sim=zeros(rep,1);
s2stsim=zeros(rep,1);
s2stsim2=zeros(rep,1);

bsim=zeros(rep,K);
bstsim=zeros(rep,K);
bstsim2=zeros(rep,K);

for i=1:rep;
    % Simulasi yt
    ysim=X*beta+sqrt(s2)*randn(T,1);                        
    esim=y-ysim;
    s2sim(i)=esim'*esim/(T-K);
        
    betacap=inv(X'*X)*X'*ysim;                                                  
    
    %Restricted least square
    betast=betacap+inv(X'*X)*R9'*inv(R9*inv(X'*X)*R9')*(r-R9*betacap);   %r=0;       
    betast2=betacap+inv(X'*X)*R9'*inv(R9*inv(X'*X)*R9')*(r2-R9*betacap); %r=0.1;       

    ysimst=X*betast;
    esimst=y-ysimst;
    s2stsim(i)=esimst'*esimst/(T-K);
        
    ysimst2=X*betast2;
    esimst2=y-ysimst2;
    s2stsim2(i)=esimst2'*esimst2/(T-K);
      
    % Menghitung beta
    bsim(i,:)=betacap';                             % Jawaban nomor 1
    bstsim(i,:)=betast';                            % Jawaban nomor 4
    bstsim2(i,:)=betast2';                          % Jawaban nomor 6
    
    % Jawaban nomor 9
    F9(i)=(R9*betast-0)'*inv(R9*inv(X'*X)*R9')*(R9*betast-0)/(J9*s2sim(i));    % F Test
    if F9(i)> Ftable
        test9(i)=1;     % Untuk H0 ditolak
    else
        test9(i)=0;     % Untuk H0 tidak ditolak
    end
    
    % Jawaban nomor 8
    R8=[0 1 0 0 0
        0 0 1 0 0
        0 0 0 1 0
        0 0 0 0 1];
    [J8 K]=size(R8);
    F8(i)=(R8*betacap-0)'*inv(R8*inv(X'*X)*R8')*(R8*betacap-0)/(J8*s2sim(i)); % F Test
    if F8(i)> Ftable
        test8(i)=1;     % Untuk H0 ditolak
    else
        test8(i)=0;     % Untuk H0 tidak ditolak
    end

    % Jawaban untuk nomor 7
    R1=[1 0 0 0 0];
    [J1 K]=size(R1);
    F1(i)=(R1*betacap-0)'*inv(R1*inv(X'*X)*R1')*(R1*betacap-0)/(J1*s2sim(i)); % F Test untuk b1
    if F1(i)> Ftable
        testb1(i)=1;    % Untuk H0 ditolak
    else
        testb1(i)=0;    % Untuk H0 tidak ditolak
    end

    R2=[0 1 0 0 0];
    [J2 K]=size(R2);
    F2(i)=(R2*betacap-0)'*inv(R2*inv(X'*X)*R2')*(R2*betacap-0)/(J2*s2sim(i)); % F Test untuk b2
    if F2(i)> Ftable
        testb2(i)=1;
    else
        testb2(i)=0;
    end

    R3=[0 0 1 0 0];
    [J3 K]=size(R3);
    F3(i)=(R3*betacap-0)'*inv(R3*inv(X'*X)*R3')*(R3*betacap-0)/(J3*s2sim(i)); % F Test untuk b3
    if F3(i)> Ftable
        testb3(i)=1;
    else
        testb3(i)=0;
    end

    R4=[0 0 0 1 0];
    [J4 K]=size(R4);
    F4(i)=(R4*betacap-0)'*inv(R4*inv(X'*X)*R4')*(R4*betacap-0)/(J4*s2sim(i)); % F Test untuk b4
    if F4(i)> Ftable
        testb4(i)=1;
    else
        testb4(i)=0;
    end

    R5=[0 0 0 0 1];
    [J5 K]=size(R5);
    F5(i)=(R5*betacap-0)'*inv(R5*inv(X'*X)*R5')*(R5*betacap-0)/(J5*s2sim(i)); % F Test untuk b5
    if F5(i)> Ftable
        testb5(i)=1;
    else
        testb5(i)=0;
    end
end
% Jawaban nomor 4a
beta;
% Menghitung ekpektasi beta dan betast
Ebsim=mean(bsim);
Ebstsim=mean(bstsim);
Ebstsim2=mean(bstsim2);
[beta Ebsim' Ebstsim' Ebstsim2']

unbias=beta-beta;
% Menghitung bias beta dan betast
biassim=Ebsim'-beta;
biasstsim=Ebstsim'-beta;
biasstsim2=Ebstsim2'-beta;
[unbias biassim biasstsim biasstsim2]
[0 mean(biassim) mean(biasstsim) mean(biasstsim2)]

% Jawaban nomor 4b
figure(1)
histb1=histfit(bsim(:,1));

figure(2)
histb2=histfit(bsim(:,2));

figure(3)
histb3=histfit(bsim(:,3));

figure(4)
histb4=histfit(bsim(:,4));

figure(5)
histb5=histfit(bsim(:,5));

% Bandingkan cov(bsim) dengan cov(bstsim)
% Jawaban nomor 4c
diagcovbsim=[var(bsim(:,1)) var(bsim(:,2)) var(bsim(:,3)) var(bsim(:,4)) var(bsim(:,5))];
diagcovbstsim=[var(bstsim(:,1)) var(bstsim(:,2)) var(bstsim(:,3)) var(bstsim(:,4)) var(bstsim(:,5))];
diagcovbstsim2=[var(bstsim2(:,1)) var(bstsim2(:,2)) var(bstsim2(:,3)) var(bstsim2(:,4)) var(bstsim2(:,5))];

% Jawaban nomor 4d
sigma2 = s2;
Es2sim=mean(s2sim);
Es2stsim=mean(s2stsim);
Es2stsim2=mean(s2stsim2);

% Jawaban nomor 4e
% prop7=(sum(testb1)+sum(testb2)+sum(testb3)+sum(testb4)+sum(testb5))/(5*rep);
% Proporsi ditolak untuk uji hipotesis masing-masing beta
prop71=sum(testb1)/rep;
prop72=sum(testb2)/rep;
prop73=sum(testb3)/rep;
prop74=sum(testb4)/rep;
prop75=sum(testb5)/rep;

% Proporsi ditolak untuk uji hipotesis nomor 8 dan 9
prop8=sum(test8)/rep;
prop9=sum(test9)/rep;
toc
