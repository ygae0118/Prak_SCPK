% 123190035
% JST - PERCEPTION Pola Fungsi Logka "OR" Dengan 2 Variabel
% BOBOT Awal [-1,1] dan BIAS [1]

disp("POLA INPUTAN : \n")
p1 = [1;1];
p2 = [1;0];
p3 = [0;1];
p4 = [0;0];
P = [p1 p2 p3 p4]

disp("TARGET : \n")
t1 = 1;
t2 = 1;
t3 = 1;
% Target4 Bernilai 0 Disebabkan Pada Pola4 Bernilai 0 Keseluruhan
% Ketentuan Target Benilai 0 Apabila Pola Input 0 Keselurhan
t4 = 0;
T = [t1 t2 t3 t4]

% Menentukan Target 
% PERCEPTRON Baru
net = newp([0 1;0 1],1);

%BOBOT Awal
BOBOT = [-1 1]
net.IW{1,1} = BOBOT;

%BIAS Awal
BIAS = [1]
net.b{1} = BIAS;

disp("Tampilan OUTPUT : \n")
% Untuk Tampilan Output Dilakukan Pemrosesan Masing-masing 
% Pada Setiap Inputan Variabel Menggunakan Fungsi "learnp"

disp("Proses Pelatihan Inputan 1 Variabel1 = 1 Dan Variabel2 = 1 ")
OUTPUT1 = sim(net,p1)
ERROR1 = t1 - OUTPUT1
% Variabel dW Untuk Menyimpan Perubahan BOBOT
disp("Variabel dW (Menyimpan Perubahan BOBOT)")
dW = learnp(BOBOT,p1,[],[],[],[],ERROR1,[],[],[],[],[])
% BOBOT Akhir
disp("Nilai BOBOT Akhir Dilakukan Penjumlahan -> BOBOT + dW ")
BOBOT = BOBOT + dW

disp("Proses Pelatihan Inputan 2 Variabel1 = 1 Dan Variabel2 = 0")
OUTPUT2 = sim(net,p2)
ERROR2 = t2 - OUTPUT2
dW = learnp(BOBOT,p2,[],[],[],[],ERROR2,[],[],[],[],[])
BOBOT = BOBOT + dW

disp("Proses Pelatihan Inputan 3 Variabel1 = 0 Dan Variabel2 = 1")
OUTPUT3 = sim(net,p3)
ERROR3 = t3 - OUTPUT3
dW = learnp(BOBOT,p3,[],[],[],[],ERROR3,[],[],[],[],[])
BOBOT = BOBOT + dW

disp("Proses Pelatihan Inputan 4 Variabel1 = 0 Dan Variabel2 = 0")
OUTPUT4 = sim(net,p4)
ERROR4 = t4 - OUTPUT4
dW = learnp(BOBOT,p4,[],[],[],[],ERROR4,[],[],[],[],[])
BOBOT = BOBOT + dW

disp("Proses Pelatihan Inputan Keseluruhan")
OUTPUT = sim(net,P)
TARGET = T
ERROR = T-OUTPUT
PERFORMANCE = perform(net,T,OUTPUT,{1})

% Karena Hasil Yang Diterima Belum Sesuai 
% Dilakukan Proses Pelatihan Ulang
% Proses Pelatihan Ulang Dengan Fungsi "net = train(net, p , t)"
net = train(net,P,T);
    
disp("Hasil  Akhir Proses Pelatihan Inputan Keseluruhan : ")
OUTPUT = sim (net, P)
TARGET = T
ERROR = T-OUTPUT
PERFORMANCE = perform(net,T,OUTPUT,{1})

% Tampilkan BOBOT dan BIAS Dalam Keadaan Optimal Pada Kedua Variabel
disp("BOBOT Dalam Bentuk Optimal : \n")
disp(net.IW{1,1})
disp("BIAS Dalam Bentuk Optimal : \n")
disp(net.b{1})

disp("Menampilkan GUI Proses Pelatihan Dan Performance !!!")
