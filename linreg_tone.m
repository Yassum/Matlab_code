listOflinreg = dir('*W-linreg.mat');
numberOflinreg = numel(listOflinreg);
x=load(listOflinreg(1).name);
numberofbetas=size(x.betas,2);

for j = 1:numberOflinreg
	x=load(listOflinreg(j).name);
    idx=find(x.rsq>0.2);
    temp=x.betas(idx,:);
    mylinreg{j,1}=x.betas;
    mylinreg{j,2}=x.rsq;
    mylinreg{j,3}=idx;
    mylinreg{j,4}=temp;
    mylinreg{j,5}=listOflinreg(j).name;
end

save('GCaMP6s_allLinR.mat','mylinreg','-v7.3')

temp=cat(1,mylinreg{1,4},mylinreg{2,4});

for j = 3:size(mylinreg,1)
    temp=cat(1,temp,mylinreg{j,4});
end

for j = 1:numberOflinreg
	x=load(listOflinreg(j).name);
    idx=find(x.rsq>0.2);
    temp3=x.betas(idx,:);
    mylinreg2{j,1}=x.betas;
    mylinreg2{j,2}=x.rsq;
    mylinreg2{j,3}=temp3;
    mylinreg2{j,4}=listOflinreg(j).name;
end

temp2=cat(1,mylinreg2{1,3},mylinreg2{2,3});

for j = 3:numberOflinreg
    temp2=cat(1,temp2,mylinreg2{j,3});
end

A=0;
B=0;
clear C;
for i = 1:numberOflinreg
A=A+size(mylinreg{i,2},1);
B=B+size(mylinreg{i,3},1);
token=regexp(mylinreg{i,4},'(\d+)um','tokens');
plane=str2num(token{1,1}{1,1});
C{(plane/10)+1,1}=size(mylinreg{i,2},1);
C{(plane/10)+1,2}=size(mylinreg{i,3},1);
end
C=cell2mat(C);

D = C;
columnSums = sum(D);
for i = 1:numel(columnSums)
  D(:,i) = D(:,i)./columnSums(i);
end


GCaMP6=[0.000256990000000000;0.00850739000000000;0.0654158300000000;0.0784609000000000;0.0764130100000000;0.0665958600000000;0.0579028900000000;0.0467942900000000;0.0232079800000000;0.0144564400000000;0.00695772000000000;0.00526551000000000;0.00299500000000000;0.00198520000000000;0.00128512000000000;0.00134175000000000;0.000403170000000000;0];

LRsound=zeros(2,200);
LRsound(1,21:21+size(GCaMP6,1)-1)=GCaMP6';
LRsound(1,71:71+size(GCaMP6,1)-1)=GCaMP6';
LRsound(1,145:145+size(GCaMP6,1)-1)=GCaMP6';

LRsound(2,45:45+size(GCaMP6,1)-1)=GCaMP6';
LRsound(2,95:95+size(GCaMP6,1)-1)=GCaMP6';
LRsound(2,120:120+size(GCaMP6,1)-1)=GCaMP6';

aud8freq=zeros(8,700);
GCaMP6=[-0.104392135015146,1.69644104899772,5.13796058542217,8.27886020152244,10.3756715204800,11.8173714529814,12.2425184714093,10.8571417354877,8.80831829681196,6.91339112244670,5.46959264663869,4.30868766622567,3.42533619066766,2.75378443486879,2.18017250852183,1.72816235135824,1.32732537295463,1.00684435500268,0.730210038304555,0.530242444093118,0.362253250339685,0.227668255288566,0.0869242416152502,0.000718266708050853,-0.0828334873368325]';
%GCaMP6=[0.000256990000000000;0.00850739000000000;0.0654158300000000;0.0784609000000000;0.0764130100000000;0.0665958600000000;0.0579028900000000;0.0467942900000000;0.0232079800000000;0.0144564400000000;0.00695772000000000;0.00526551000000000;0.00299500000000000;0.00198520000000000;0.00128512000000000;0.00134175000000000;0.000403170000000000;0];
aud8freq(1,20:20+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(1,405:405+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(1,610:610+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(2,45:45+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(2,380:380+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(2,530:530+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(3,70:70+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(3,355:355+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(3,505:505+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(4,95:95+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(4,330:330+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(4,555:555+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(5,120:120+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(5,305:305+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(5,485:485+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(6,145:145+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(6,285:285+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(6,585:585+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(7,170:170+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(7,260:260+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(7,465:465+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(8,200:200+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(8,235:235+size(GCaMP6,1)-1)=GCaMP6';
aud8freq(8,640:640+size(GCaMP6,1)-1)=GCaMP6';
clearvars GCaMP6;

aud8freqb=zeros(8,700);
GCaMP6=[-0.104392135015146,1.69644104899772,5.13796058542217,8.27886020152244,10.3756715204800,11.8173714529814,12.2425184714093,10.8571417354877,8.80831829681196,6.91339112244670,5.46959264663869,4.30868766622567,3.42533619066766,2.75378443486879,2.18017250852183,1.72816235135824,1.32732537295463,1.00684435500268,0.730210038304555,0.530242444093118,0.362253250339685,0.227668255288566,0.0869242416152502,0.000718266708050853,-0.0828334873368325]';
%GCaMP6=[0.000256990000000000;0.00850739000000000;0.0654158300000000;0.0784609000000000;0.0764130100000000;0.0665958600000000;0.0579028900000000;0.0467942900000000;0.0232079800000000;0.0144564400000000;0.00695772000000000;0.00526551000000000;0.00299500000000000;0.00198520000000000;0.00128512000000000;0.00134175000000000;0.000403170000000000;0];
aud8freqb(1,21:21+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(1,407:407+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(1,612:612+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(2,46:46+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(2,382:382+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(2,532:532+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(3,71:71+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(3,357:357+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(3,507:507+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(4,95:95+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(4,331:331+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(4,555:555+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(5,120:120+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(5,306:306+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(5,487:487+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(6,146:146+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(6,285:285+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(6,590:590+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(7,174:174+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(7,261:261+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(7,462:462+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(8,200:200+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(8,235:235+size(GCaMP6,1)-1)=GCaMP6';
aud8freqb(8,640:640+size(GCaMP6,1)-1)=GCaMP6';
clearvars GCaMP6;


aud8freq2=zeros(8,700);
aud8freq2(1,22:22+5)=100;
aud8freq2(1,407:407+5)=100;
aud8freq2(1,611:611+5)=100;
aud8freq2(2,47:47+5)=200;
aud8freq2(2,383:383+5)=200;
aud8freq2(2,532:532+5)=200;
aud8freq2(3,71:71+5)=300;
aud8freq2(3,357:357+5)=300;
aud8freq2(3,507:507+5)=300;
aud8freq2(4,97:97+5)=400;
aud8freq2(4,332:332+5)=400;
aud8freq2(4,557:557+5)=400;
aud8freq2(5,121:121+5)=500;
aud8freq2(5,307:307+5)=500;
aud8freq2(5,487:487+5)=500;
aud8freq2(6,146:146+5)=600;
aud8freq2(6,282:282+5)=600;
aud8freq2(6,586:586+5)=600;
aud8freq2(7,167:167+5)=700;
aud8freq2(7,257:257+5)=700;
aud8freq2(7,462:462+5)=700;
aud8freq2(8,190:190+5)=800;
aud8freq2(8,232:232+5)=800;
aud8freq2(8,646:646+5)=800;

Norm=[0.241970724519143,0.398942280401433,0.241970724519143,0.0539909665131881];
aud8freq_sp=zeros(8,700);
aud8freq_sp(1,22:22+length(Norm)-1)=Norm;
aud8freq_sp(1,407:407+length(Norm)-1)=Norm;
aud8freq_sp(1,611:611+length(Norm)-1)=Norm;
aud8freq_sp(2,47:47+length(Norm)-1)=Norm;
aud8freq_sp(2,382:382+length(Norm)-1)=Norm;
aud8freq_sp(2,532:532+length(Norm)-1)=Norm;
aud8freq_sp(3,71:71+length(Norm)-1)=Norm;
aud8freq_sp(3,357:357+length(Norm)-1)=Norm;
aud8freq_sp(3,507:507+length(Norm)-1)=Norm;
aud8freq_sp(4,96:96+length(Norm)-1)=Norm;
aud8freq_sp(4,332:332+length(Norm)-1)=Norm;
aud8freq_sp(4,557:557+length(Norm)-1)=Norm;
aud8freq_sp(5,121:121+length(Norm)-1)=Norm;
aud8freq_sp(5,307:307+length(Norm)-1)=Norm;
aud8freq_sp(5,487:487+length(Norm)-1)=Norm;
aud8freq_sp(6,143:143+length(Norm)-1)=Norm;
aud8freq_sp(6,282:282+length(Norm)-1)=Norm;
aud8freq_sp(6,586:586+length(Norm)-1)=Norm;
aud8freq_sp(7,167:167+length(Norm)-1)=Norm;
aud8freq_sp(7,257:257+length(Norm)-1)=Norm;
aud8freq_sp(7,462:462+length(Norm)-1)=Norm;
aud8freq_sp(8,190:190+length(Norm)-1)=Norm;
aud8freq_sp(8,232:232+length(Norm)-1)=Norm;
aud8freq_sp(8,646:646+length(Norm)-1)=Norm;
clearvars Norm;

aud5vol=zeros(5,550);
GCaMP6=[0.000256990000000000;0.00850739000000000;0.0654158300000000;0.0784609000000000;0.0764130100000000;0.0665958600000000;0.0579028900000000;0.0467942900000000;0.0232079800000000;0.0144564400000000;0.00695772000000000;0.00526551000000000;0.00299500000000000;0.00198520000000000;0.00128512000000000;0.00134175000000000;0.000403170000000000;0];
aud5vol(1,51:51+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(1,301:301+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(1,376:376+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(2,76:76+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(2,276:276+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(2,451:451+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(3,101:101+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(3,251:251+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(3,426:426+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(4,126:126+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(4,226:226+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(4,401:401+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(5,151:151+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(5,201:201+size(GCaMP6,1)-1)=GCaMP6;
aud5vol(5,351:351+size(GCaMP6,1)-1)=GCaMP6;

Flow=zeros(2,655);
GCaMP6s=[0,0.0475933299981904,0.145856570270634,0.430801346740194,0.668851696043037,0.884090900705590,1.14719633336821,1.47908870813882,1.72716359052556,1.86668931053985,1.96775585287134,2.01121377310865,1.97209592006446,1.93064972399530,1.83224963937462,1.78886983545796,1.68091789126201,1.61223472755904,1.54727108905559,1.45592997089662,1.42606356600772,1.36195262426789,1.31962132973532,1.35842071432120,1.22768630028142,1.09989977722903,1.08050029807282,1.02222085806611,1.00247267480427,0.941359237961540,0.913403267719926,0.848162190268675,0.775900471298636,0.763502131239842,0.707616208087574,0.701650224693810,0.626903241075486,0.586552578480782,0.596334956051919,0.508125155252630,0.424847284914456,0.342630731278809,0.280292972135101,0.209321360756159,0.230138213249034,0.228253793486019,0.232693250867309,0.213256243548382,0.213978330381058,0.190685709211860,0.187053726270874,0.160134191614294,0.177987329477276,0.129884519652005,0.112321079539204,0.0365583129968624,0.0217215155949885,0.00796210976596419,0.00966071606944334,0.000472906366358352,0];
Flow(1,56:56+length(GCaMP6s)-1)=GCaMP6s;
Flow(1,256:256+length(GCaMP6s)-1)=GCaMP6s;
Flow(1,456:456+length(GCaMP6s)-1)=GCaMP6s;
Flow(2,156:156+length(GCaMP6s)-1)=GCaMP6s;
Flow(2,356:356+length(GCaMP6s)-1)=GCaMP6s;
Flow(2,556:556+length(GCaMP6s)-1)=GCaMP6s;
clearvars GCaMP6s;

GCaMP6s=[0,0.241970724519143,0.398942280401433,0.241970724519143,0.1480,0.0539909665131881,0];
Flow2=zeros(2,655);
Flow2(1,58:58+length(GCaMP6s)-1)=GCaMP6s;
Flow2(1,258:258+length(GCaMP6s)-1)=GCaMP6s;
Flow2(1,458:458+length(GCaMP6s)-1)=GCaMP6s;
Flow2(2,158:158+length(GCaMP6s)-1)=GCaMP6s;
Flow2(2,358:358+length(GCaMP6s)-1)=GCaMP6s;
Flow2(2,558:558+length(GCaMP6s)-1)=GCaMP6s;
clearvars GCaMP6s;


parfor i=1:size(DF,1)
    mdl=stepwiselm(aud8freq',DF(i,:),'linear','Criterion','adjrsquared','Upper','interactions','verbose',0);
    model_DF_Thr5(i).coef=mdl.Coefficients;
    model_DF_Thr5(i).MSE=mdl.MSE;
    model_DF_Thr5(i).Fitted=mdl.Fitted;
    model_DF_Thr5(i).rsquared=mdl.Rsquared.Adjusted;
end

for Rsquared=rsq
    if Rsquared>0.5
        
end