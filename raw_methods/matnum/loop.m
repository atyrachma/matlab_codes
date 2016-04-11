function [subs,A,z,p1]=loop(A,subs,k,ph)
% fungsi untuk melakukan iterasi pada metode simplex
% Bland's rule digunakan untuk menghindari cycling

tbn=0;
str1='Apakah anda ingin memonitor fasa 1 tahap demi tahap?';
str2='Apakah anda ingin memonitor fasa 2 tahap demi tahap?';
if ph==1
    str=str1;
else
    str=str2;
end
question_ans=questdlg(str,'Make a choice window','Ya','Tidak','Tidak');
if strcmp(question_ans,'Ya')
    p1='y'
else
    p1='t'
end
if p1=='y'&ph==1
    disp(sprintf('\n\n              Tableau awal'))
    A
    disp(sprintf('Tekan sembarang tombol untuk melanjutkan ...\n\n'))
    pause
end
if p1=='y'&ph==2
    tbn=1;
    disp(sprintf('Tekan sembarang tombol untuk melanjutkan ...\n\n'))
    pause
end
[m,n]=size(A);
[mi,col]=Br(A(m,1:n-1));
while ~isempty(mi)&mi<0&abs(mi)>eps
    t=A(1:m-k,col);
    if all(t<=0)
        z=-inf;
        disp(sprintf('\n    Program linearnya unbounded dengan z=\n ',z))
        return
    end
    [row,small]=MRT(A(1:m-k,n),A(1:m-k,col));
    if ~isempty(row)
        if abs(small)<=100*eps&k==1
            [s,col]=Br(A(m,1:n-1));
        end
        if p1=='y'
            disp(sprintf('    pivot row ->%g pivot column->%g', row,col))
        end
        A(row,:)=A(row,:)/A(row,col);
        subs(row)=col;
        for i=1:m
            if i~=row
                A(i,:)=A(i,:)-A(i,col)*A(row,:);
            end
        end
        [mi,col]=Br(A(m,1:n-1));
    end
    tbn=tbn+1;
    if p1=='y'
        disp(sprintf('\n\n               Tableau %g   ', tbn))
        A
        disp(sprintf(' Tekan sembarang tombol untuk melanjutkan .... \n\n'))
        pause
    end
end
z=A(m,n)