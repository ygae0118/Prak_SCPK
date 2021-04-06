function varargout = CekTahunKabisat(varargin)
% CEKTAHUNKABISAT MATLAB code for CekTahunKabisat.fig
%      CEKTAHUNKABISAT, by itself, creates a new CEKTAHUNKABISAT or raises the existing
%      singleton*.
%
%      H = CEKTAHUNKABISAT returns the handle to a new CEKTAHUNKABISAT or the handle to
%      the existing singleton*.
%
%      CEKTAHUNKABISAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CEKTAHUNKABISAT.M with the given InputTahun arguments.
%
%      CEKTAHUNKABISAT('Property','Value',...) creates a new CEKTAHUNKABISAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CekTahunKabisat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All hasils are passed to CekTahunKabisat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CekTahunKabisat

% Last Modified by GUIDE v2.5 06-Apr-2021 13:51:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CekTahunKabisat_OpeningFcn, ...
                   'gui_OutputFcn',  @CekTahunKabisat_OutputFcn, ...
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


% --- Executes just before CekTahunKabisat is made visible.
function CekTahunKabisat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CekTahunKabisat (see VARARGIN)

% Choose default command line output for CekTahunKabisat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CekTahunKabisat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CekTahunKabisat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function InputTahun_Callback(hObject, eventdata, handles)
% hObject    handle to InputTahun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'string') returns contents of InputTahun as text
%        str2double(get(hObject,'string')) returns contents of InputTahun as a double


% --- Executes during object creation, after setting all properties.
function InputTahun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputTahun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% --- Eksekusi Tombol CEK
cekTahun = get(handles.InputTahun, 'string');
cekTahun = str2double (cekTahun); 
if isempty(cekTahun) % --- Apabila Data Tahun Kosong - Output X_x
    set(handles.Output,'string',("X_x"));
elseif ~isfinite(cekTahun) % --- Data Tahun Selain Angka - Output X_x
    set(handles.Output,'string',("X_x"));
elseif  (mod(cekTahun,400) == 0)
    set(handles.Output,'string',("True || Iya"));
elseif (mod(cekTahun,100) == 0)
    set(handles.Output,'string',("False || Tidak"));
elseif (mod(cekTahun,4) == 0)
    set(handles.Output,'string',("True || Iya"));
else 
    set(handles.Output,'string',("False || Tidak"));
end
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'string') returns contents of edit2 as text
%        str2double(get(hObject,'string')) returns contents of edit2 as a double


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over header.
function header_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to header (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
