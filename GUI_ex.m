function varargout = GUI_ex(varargin)
% GUI_EX MATLAB code for GUI_ex.fig
%      GUI_EX, by itself, creates a new GUI_EX or raises the existing
%      singleton*.
%
%      H = GUI_EX returns the handle to a new GUI_EX or the handle to
%      the existing singleton*.
%
%      GUI_EX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_EX.M with the given input arguments.
%
%      GUI_EX('Property','Value',...) creates a new GUI_EX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ex_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ex_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ex

% Last Modified by GUIDE v2.5 04-Oct-2021 02:25:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ex_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ex_OutputFcn, ...
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


% --- Executes just before GUI_ex is made visible.
function GUI_ex_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ex (see VARARGIN)

% Choose default command line output for GUI_ex
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ex wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ex_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_inputcitra1.
function pushbutton_inputcitra1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inputcitra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namefile,namepath] = uigetfile(...
    {'*.jpg*.png*.jpeg', 'File of Type(*.jpg,*.png,*.jpeg)';
    '*.jpg', 'File JPG (*.jpg)';...
    '*.png', 'File PNG (*.PNG)';...
    '*.jpeg', 'File JPEG (*.jpeg)';...
    '*.*', 'All Type(*.*)'},...
    'Open Image');
if ~isequal (namefile,0)
    img1 = imread(fullfile(namepath,namefile));
    axes(handles.axes1);
    handles.img1 = img1;
    guidata (hObject, handles);
    imshow(img1);
    title('Citra Asli 1');
else
    return;
end

% --- Executes on button press in pushbutton_grayscale.
function pushbutton_grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
axes(handles.axes3);
imshow(Gray1);title('Citra Grayscale 1')
axes(handles.axes4);
imshow(Gray2);title('Citra Grayscale 2');

% --- Executes on button press in pushbutton_penjumlahan.
function pushbutton_penjumlahan_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_penjumlahan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
a = double(Gray1);
b = double(Gray2);
[r1,c1] = size(a);
[r2,c2] = size(b);
if (r1 == r2) && (c1 == c2)
for x = 1 : r1
for y = 1 : c1
i1(x,y) = a(x,y) + b(x,y);
end
end
end
axes(handles.axes5);
imshow(uint8(i1));title('Citra Penjumlahan');

% --- Executes on button press in pushbutton_pengurangan.
function pushbutton_pengurangan_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pengurangan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
a = double(Gray1);
b = double(Gray2);
[r1,c1] = size(a);
[r2,c2] = size(b);
if (r1 == r2) && (c1 == c2)
for x = 1 : r1
for y = 1 : c1
i2(x,y) = a(x,y) - b(x,y);
end
end
end
axes(handles.axes5);
imshow(uint8(i2));title('Citra Pengurangan');

% --- Executes on button press in pushbutton_perkaliancitra1.
function pushbutton_perkaliancitra1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_perkaliancitra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
Gray1 = rgb2gray(img1);
a = double(Gray1);
[r c] = size(a);
for x = 1 : r
for y = 1 : c
i3(x,y) = a(x,y) * 2;
end
end
axes(handles.axes5);
imshow(uint8(i3));title('Citra Perkalian');

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_penskalaan1.
function pushbutton_penskalaan1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_penskalaan1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
Gray1 = rgb2gray(img1);
i10 = imresize(Gray1,0.2);
axes(handles.axes5);
imshow(i10);title('Penskalaan 1');

% --- Executes on button press in pushbutton_inputcitra2.
function pushbutton_inputcitra2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inputcitra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namefile,namepath] = uigetfile(...
    {'*.jpg*.png*.jpeg', 'File of Type(*.jpg,*.png,*.jpeg)';
    '*.jpg', 'File JPG (*.jpg)';...
    '*.png', 'File PNG (*.PNG)';...
    '*.jpeg', 'File JPEG (*.jpeg)';...
    '*.*', 'All Type(*.*)'},...
    'Open Image');
if ~isequal (namefile,0)
    img2 = imread(fullfile(namepath,namefile));
    axes(handles.axes2);
    handles.img2 = img2;
    guidata (hObject, handles);
    imshow(img2);
    title('Citra Asli 2');
else
    return;
end


% --- Executes on button press in pushbutton_logikaand.
function pushbutton_logikaand_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_logikaand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
a = not(Gray1);
b = not(Gray2);
[r1,c1] = size(a);
[r2,c2] = size(b);
for x = 1 : r1
for y = 1 : c1
i7(x,y) = and(a(x,y),b(x,y));
end
end
axes(handles.axes5);
imshow(i7);title('Citra Logika AND');

% --- Executes on button press in pushbutton_perkaliancitra2.
function pushbutton_perkaliancitra2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_perkaliancitra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2 = handles.img2;
Gray2 = rgb2gray(img2);
b = double(Gray2);
[r c] = size(b);
for x = 1 : r
for y = 1 : c
i4(x,y) = b(x,y) * 2;
end
end
axes(handles.axes5);
imshow(uint8(i4));title('Citra Perkalian');

% --- Executes on button press in pushbutton_pembagiancitra2.
function pushbutton_pembagiancitra2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pembagiancitra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2 = handles.img2;
Gray2 = rgb2gray(img2);
b = double(Gray2);
[r c] = size(b);
for x = 1 : r
for y = 1 : c
i6(x,y) = b(x,y) / 2;
end
end
axes(handles.axes5);
imshow(uint8(i6));title('Citra Pembagian');

% --- Executes on button press in pushbutton_pembagiancitra1.
function pushbutton_pembagiancitra1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pembagiancitra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
Gray1 = rgb2gray(img1);
a = double(Gray1);
[r c] = size(a);
for x = 1 : r
for y = 1 : c
i5(x,y) = a(x,y) / 2;
end
end
axes(handles.axes5);
imshow(uint8(i5));title('Citra Pembagian');


% --- Executes on button press in pushbutton_logikaor.
function pushbutton_logikaor_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_logikaor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
a = not(Gray1);
b = not(Gray2);
[r1 c1] = size(a);
[r2 c2] = size(b);
for x = 1 : r1
for y = 1 : c1
i7(x,y) = and(a(x,y),b(x,y));
end
end
axes(handles.axes5);
imshow(i7);title('Citra Logika OR');

% --- Executes on button press in pushbutton_logikaxor.
function pushbutton_logikaxor_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_logikaxor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
a = not(Gray1);
b = not(Gray2);
[r1 c1] = size(a);
[r2 c2] = size(b);
for x = 1 : r1
for y = 1 : c1
i8(x,y) = xor(a(x,y),b(x,y));
end
end
axes(handles.axes5);
imshow(i8);title('Citra Logika XOR');


% --- Executes on button press in pushbutton_logikanot.
function pushbutton_logikanot_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_logikanot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
img2 = handles.img2;
Gray1 = rgb2gray(img1);
Gray2 = rgb2gray(img2);
a = not(Gray1);
b = not(Gray2);
[r1 c1] = size(a);
[r2 c2] = size(b);
for x = 1 : r1
for y = 1 : c1
i9(x,y) = not(and(a(x,y),b(x,y)));
end
end
axes(handles.axes5);
imshow(i9);title('Citra Logika NOT');


% --- Executes on button press in pushbutton_penskalaan2.
function pushbutton_penskalaan2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_penskalaan2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2 = handles.img2;
Gray2 = rgb2gray(img2);
i11 = imresize(Gray2,0.2);
axes(handles.axes5);
imshow(i11);title('Penskalaan 2');

% --- Executes on button press in pushbutton_refleksi1.
function pushbutton_refleksi1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_refleksi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1 = handles.img1;
Gray1 = rgb2gray(img1);
i12 = flip(Gray1,1);
axes(handles.axes5);
imshow(i12);title('Refleksi 1');

% --- Executes on button press in pushbutton_refleksi2.
function pushbutton_refleksi2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_refleksi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2 = handles.img2;
Gray2 = rgb2gray(img2);
i13 = flip(Gray2,1);
axes(handles.axes5);
imshow(i13);title('Refleksi 2');