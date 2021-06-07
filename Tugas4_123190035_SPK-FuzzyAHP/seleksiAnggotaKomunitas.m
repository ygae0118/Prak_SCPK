function varargout = seleksiAnggotaKomunitas(varargin)
% SELEKSIANGGOTAKOMUNITAS MATLAB code for seleksiAnggotaKomunitas.fig
%      SELEKSIANGGOTAKOMUNITAS, by itself, creates a new SELEKSIANGGOTAKOMUNITAS or raises the existing
%      singleton*.
%
%      H = SELEKSIANGGOTAKOMUNITAS returns the handle to a new SELEKSIANGGOTAKOMUNITAS or the handle to
%      the existing singleton*.
%
%      SELEKSIANGGOTAKOMUNITAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELEKSIANGGOTAKOMUNITAS.M with the given input arguments.
%
%      SELEKSIANGGOTAKOMUNITAS('Property','Value',...) creates a new SELEKSIANGGOTAKOMUNITAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before seleksiAnggotaKomunitas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to seleksiAnggotaKomunitas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help seleksiAnggotaKomunitas

% Last Modified by GUIDE v2.5 07-Jun-2021 12:47:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @seleksiAnggotaKomunitas_OpeningFcn, ...
                   'gui_OutputFcn',  @seleksiAnggotaKomunitas_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before seleksiAnggotaKomunitas is made visible.
function seleksiAnggotaKomunitas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to seleksiAnggotaKomunitas (see VARARGIN)

% Choose default command line output for seleksiAnggotaKomunitas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes seleksiAnggotaKomunitas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = seleksiAnggotaKomunitas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CrewName = {'Bara' 'Praswara' 'Andreo' 'Bagas' 'Fatimah' 'Zahra' 'Yongae'};

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
relasiAntarKriteria = [1 2 0.5
                       0 1 1/3
                       0 0 1];

RasioKonsistensi=HitungKonsistensiAHP(relasiAntarKriteria);

if RasioKonsistensi<0.10
    [bobotAntarKriteria,relasiAntarKriteria]=FuzzyAHP(relasiAntarKriteria,TFN);
    
    ahp = data*bobotAntarKriteria';
    
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
    
    ahptable{i,:} = {char(status)};
    end
    
   namaAnggota = CrewName.';
   ahpcell = num2cell(ahp);
   newahptable = vertcat(ahptable{:});

   Save = {namaAnggota; ahpcell; newahptable};
   newSave = horzcat(Save{:});
    
    set(handles.uitable5,'Data',newSave)
