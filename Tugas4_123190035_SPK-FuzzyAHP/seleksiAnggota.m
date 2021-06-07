clc;
clear;
close all;

namaAnggota = {'Bara' 'Praswara' 'Andreo' 'Bagas' 'Fatimah' 'Zahra' 'Yongae'};

data = [70 84 78 
        68 91 89
        60 78 54 
        60 81 70
        84 69 90
        93 78 42
        86 80 81];

TFN = {  [-100/9 0 100/9] [9/100 0 -9/100]
         [0 100/9 200/9] [9/200 9/100 0]
         [100/9 200/9 300/9] [9/300 9/200 9/100]
         [200/9 300/9 400/9] [9/400 9/300 9/200]
         [300/9 400/9 500/9] [9/500 9/400 9/300]
         [400/9 500/9 600/9] [9/600 9/500 9/400]
         [500/9 600/9 700/9] [9/700 9/600 9/500] };
     
maksKerapihan = 100;
maksKeserasian = 100;
maksSikap = 100;

data(:,1)=data(:,1)/maksKerapihan;
data(:,2)=data(:,2)/maksKeserasian;
data(:,3)=data(:,3)/maksSikap;


relasiAntarKriteria = [1    0.25    0.5
                       0    1       0.25
                       0    0       1];

[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria);

if RasioKonsistensi<0.10
    [bobotAntarKriteria,relasiAntarKriteria]=FuzzyAHP(relasiAntarKriteria,TFN);
    
    ahp = data*bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP');
    disp('Nama Anggota, Skor Akhir, Kesimpulan');
end

for i = 1:size(ahp, 1)
       
    if ahp(i) < 0.6
        status = 'Tidak Memenuhi';
    elseif ahp(i) < 0.7
        status = 'Kurang Memenuhi';
    elseif ahp(i) < 0.8
        status = 'Memenuhi';
    else
        status = 'Memenuhi (Rekomendasi)';
    end
    
    disp([char(namaAnggota(i)),blanks(13-cellfun('length',namaAnggota(i))),',',...
        num2str(ahp(i)),blanks(10-length(num2str(ahp(i)))),',',...
        char(status)])
     
end

 