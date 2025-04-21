fxy=cos(peaks(256).*2+pi)+1;            %�����������޺���
[rr,cc]=size(fxy);                      %�������������Ĵ�С
figure,imshow(fxy,[])                   %��ʾ��������
F=fftshift(fft2(fxy));                  %��������������Ƶ��
figure,plot(abs(F(round(rr/2)+1,:))),   %�۲����
figure,plot(abs(F(:,round(cc/2)+1))),   %�۲����
figure,surfl(abs(F)),shading interp,colormap(gray);   %Ƶ��3Dͼ
combxy=zeros(rr,cc);                    %��ʼ����comb����
X=4;Y=4;                                %�������
for n=1:Y:rr
   for m=1:X:cc
   combxy(n,m)=1;
   end
end
figure,imshow(combxy,[]);               %��ʾcomb����
C=fftshift(fft2(combxy));               %����comb������Ƶ��
figure,surfl(abs(C)),shading interp,colormap(gray); % Ƶ��3Dͼ
gxy=zeros(rr,cc);                       %��ʼ���ɳ�������
gxy=fxy.*combxy;                        %���ɳ�������
figure,imshow(gxy,[]);                  %��ʾ��������
Gs=fftshift(fft2(gxy));                 %�������������Ƶ��
figure,surfl(abs(Gs)),shading interp,colormap(gray); %Ƶ��3Dͼ
figure,plot(abs(Gs(:,cc/2+1))),         %�۲�Ƶ���Ƿ����ص�
By=round(rr/2/Y);Bx=round(cc/2/X);      %��ά�غ����˲����Ŀ��
H=zeros(rr,cc);                         %��ʼ���ɶ�ά�غ����˲���
H(round(rr/2)+1-By:round(rr/2)+1+By-1,round(cc/2)+1-Bx:round(cc/2)+1+Bx-1)=1;   
figure,imshow(H,[])                     %��ʾ��ά�غ����˲���
Gsyp=H.*Gs;                             %�˲�����ԭ����Ƶ��
figure,surfl(abs(Gsyp)),shading interp,colormap(gray);
gxyyp=X*Y.*abs(ifft2(Gsyp));            %�渵��Ҷ�任����ԭ����
figure,imshow(gxyyp,[])                 %��ʾ��ԭ��ԭ����