function varargout = LuasVolumeBalok(varargin)
% LUASVOLUMEBALOK MATLAB code for LuasVolumeBalok.fig
%      LUASVOLUMEBALOK, by itself, creates a new LUASVOLUMEBALOK or raises the existing
%      singleton*.
%
%      H = LUASVOLUMEBALOK returns the handle to a new LUASVOLUMEBALOK or the handle to
%      the existing singleton*.
%
%      LUASVOLUMEBALOK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LUASVOLUMEBALOK.M with the given inputLebar arguments.
%
%      LUASVOLUMEBALOK('Property','Value',...) creates a new LUASVOLUMEBALOK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LuasVolumeBalok_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LuasVolumeBalok_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LuasVolumeBalok

% Last Modified by GUIDE v2.5 06-Apr-2021 12:54:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LuasVolumeBalok_OpeningFcn, ...
                   'gui_OutputFcn',  @LuasVolumeBalok_OutputFcn, ...
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


% --- Executes just before LuasVolumeBalok is made visible.
function LuasVolumeBalok_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LuasVolumeBalok (see VARARGIN)

% Choose default command line output for LuasVolumeBalok
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LuasVolumeBalok wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LuasVolumeBalok_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushLuas.
function pushLuas_Callback(~, ~, handles)
% --- Eksekusi Tombol Luas 
Panjang = get(handles.inputPanjang, 'string');
Lebar = get(handles.inputLebar, 'string');
Tinggi = get(handles.inputTinggi, 'string');
Panjang = str2double (Panjang);
Lebar = str2double (Lebar);  
Tinggi = str2double (Tinggi); 
Luas = 2*(Panjang*Lebar+Panjang*Tinggi+Lebar*Tinggi);
set(handles.hasilLuas ,'string',(Luas));

% hObject    handle to pushLuas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushVolume.
function pushVolume_Callback(~, ~, handles)
% --- Eksekusi Tombol Volume
Panjang = get(handles.inputPanjang, 'string');
Lebar = get(handles.inputLebar, 'string');
Tinggi = get(handles.inputTinggi, 'string');
Panjang = str2double (Panjang); 
Lebar = str2double (Lebar); 
Tinggi = str2double (Tinggi); 
Volume = Tinggi*Lebar*Panjang;
set(handles.hasilVolume ,'string',(Volume));

% hObject    handle to pushVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function inputPanjang_Callback(~, ~, ~)
% hObject    handle to inputPanjang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputPanjang as text
%        str2double(get(hObject,'String')) returns contents of inputPanjang as a double


% --- Executes during object creation, after setting all properties.
function inputPanjang_CreateFcn(hObject, ~, ~)
% hObject    handle to inputPanjang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputTinggi_Callback(~, ~, ~)
% hObject    handle to inputTinggi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputTinggi as text
%        str2double(get(hObject,'String')) returns contents of inputTinggi as a double


% --- Executes during object creation, after setting all properties.
function inputTinggi_CreateFcn(hObject, ~, ~)
% hObject    handle to inputTinggi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hasilLuas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilLuas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function hasilVolume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilLuas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
