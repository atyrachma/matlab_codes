% Model Statistika Linier
% Vina Fitriyani M. (10108028) 
% Aty Rachmawati (10108050)
clear all;
clc;
tic;
format short g

% Eksperimen Bagian I
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

bcap=inv(X'*X)*X'*y;        % Jawaban nomor 1

ycap=X*bcap;
ecap=y-ycap;
s2cap=ecap'*ecap/(T-K);     % Jawaban nomor 2

covbcap=s2cap*inv(X'*X);    % Jawaban nomor 3

stdb=sqrt(diag(covbcap));   
t=bcap./stdb;               % t test

SSR=ycap'*ycap-T*(mean(y))^2;
SST=y'*y-T*(mean(y))^2;
SSE=ecap'*ecap;
R2adj=(1-(SSE/(T-K))/(SST/(T-1)))*100; %coefficient of determination

% Jawaban nomor 8
R8=[0 1 0 0 0
    0 0 1 0 0
    0 0 0 1 0
    0 0 0 0 1];
[J8 K]=size(R8);
F8=(R8*bcap-0)'*inv(R8*inv(X'*X)*R8')*(R8*bcap-0)/(J8*s2cap); % F Test

% Jawaban nomor 7
R1=[1 0 0 0 0];
[J1 K]=size(R1);
F1=(R1*bcap-0)'*inv(R1*inv(X'*X)*R1')*(R1*bcap-0)/(J1*s2cap); % F Test untuk b1

R2=[0 1 0 0 0];
[J2 K]=size(R2);
F2=(R2*bcap-0)'*inv(R2*inv(X'*X)*R2')*(R2*bcap-0)/(J2*s2cap); % F Test untuk b2

R3=[0 0 1 0 0];
[J3 K]=size(R3);
F3=(R3*bcap-0)'*inv(R3*inv(X'*X)*R3')*(R3*bcap-0)/(J3*s2cap); % F Test untuk b3

R4=[0 0 0 1 0];
[J4 K]=size(R4);
F4=(R4*bcap-0)'*inv(R4*inv(X'*X)*R4')*(R4*bcap-0)/(J4*s2cap); % F Test untuk b4

R5=[0 0 0 0 1];
[J5 K]=size(R5);
F5=(R5*bcap-0)'*inv(R5*inv(X'*X)*R5')*(R5*bcap-0)/(J5*s2cap); % F Test untuk b5

%Restricted least square
R9=[0 1 1 1 1];
[J9 K]=size(R9);

r=0;
bst=bcap+inv(X'*X)*R9'*inv(R9*inv(X'*X)*R9')*(r-R9*bcap);       % Jawaban nomor 4

r2=0.1;
bst9=bcap+inv(X'*X)*R9'*inv(R9*inv(X'*X)*R9')*(r2-R9*bcap);     % Jawaban nomor 6

ycapst=X*bst;
ecapst=y-ycapst;
s2capst=ecapst'*ecapst/(T-K);
Mst=eye(K)-inv(X'*X)*R9'*inv(R9*inv(X'*X)*R9')*R9;
covbcapst=s2capst*Mst*inv(X'*X)*Mst';                           % Jawaban nomor 5

F9=(R9*bst-0)'*inv(R9*inv(X'*X)*R9')*(R9*bst-0)/(J9*s2capst);   % Jawaban nomor 9
toc

    