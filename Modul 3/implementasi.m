function varargout = implementasi(varargin)
% IMPLEMENTASI MATLAB code for implementasi.fig
%      IMPLEMENTASI, by itself, creates a new IMPLEMENTASI or raises the existing
%      singleton*.
%
%      H = IMPLEMENTASI returns the handle to a new IMPLEMENTASI or the handle to
%      the existing singleton*.
%
%      IMPLEMENTASI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPLEMENTASI.M with the given input arguments.
%
%      IMPLEMENTASI('Property','Value',...) creates a new IMPLEMENTASI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before implementasi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to implementasi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help implementasi

% Last Modified by GUIDE v2.5 01-Oct-2021 08:47:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @implementasi_OpeningFcn, ...
                   'gui_OutputFcn',  @implementasi_OutputFcn, ...
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


% --- Executes just before implementasi is made visible.
function implementasi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to implementasi (see VARARGIN)

% Choose default command line output for implementasi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes implementasi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = implementasi_OutputFcn(hObject, eventdata, handles) 
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

% OPEN IMAGE
[FileName,PathName]= uigetfile(...
    {'*.bmp;*.jpg;*.jpeg;*.png;*.tiff;*.gif', 'File of Type(*.bmp,*.jpg,*.jpeg,*.png,*.tiff,*.gif)';
    '*.bmp', 'File Bitmap(*.bmp)';...
    '*.jpg', 'File Jpg(*.jpg)';...
    '*.jpeg', 'File Jpeg(*.jpeg)';...
    '*.png', 'File PNG(*.png)';...
    '*.tiff', 'File TIF(*.tif)';...
    '*.gif', 'File GIF(*.gif)';...
    '*.*', 'All type(*.*)'},...
    'Open Image');
if ~isequal (FileName, 0)
    handles.data1 = imread(fullfile(PathName,FileName));
    guidata (hObject, handles);
    axes(handles.axes1);
    imshow(handles.data1);
else
    return
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% SAVE IMAGE
save = handles.data2;
[filename, pathname] = uiputfile(...
    {'*.jpg','File Jpeg(*.jpg)';...
    '*.bmp', 'File Bitmap(*.bmp)';...
    '*.png', 'File PNG(*.png)';...
    '*.tif','File Tif(*.tif)';
    '*.*','All Files(*.*)'},...
    'Save Image');

if ~isequal(filename,0)
    imwrite(save, fullfile(pathname,filename));
else
    return
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% GRAYSCALE
image1 = handles.data1;
gray = rgb2gray(image1);
axes(handles.axes2);
imshow(gray);
handles.data2 = gray;
guidata(hObject,handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% BLACK AND WHITE
image1 = handles.data1;
bw = im2bw(image1);
axes(handles.axes2);
imshow(bw);
handles.data2 = bw;
guidata(hObject,handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% RED LAYER
image1 = handles.data1;
allBlack = zeros(size(image1,1),size(image1,2));

red = image1(:,:,1);
ired = cat(3,red,allBlack,allBlack);

axes(handles.axes2);
imshow(ired);
handles.data2 = ired;
guidata(hObject,handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% GREEN LAYER
image1 = handles.data1;
allBlack = zeros(size(image1,1),size(image1,2));

green = image1(:,:,1);
igreen = cat(3,allBlack,green,allBlack);

axes(handles.axes2);
imshow(igreen);
handles.data2 = igreen;
guidata(hObject,handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% BLUE LAYER
image1 = handles.data1;
allBlack = zeros(size(image1,1),size(image1,2));

blue = image1(:,:,1);
iblue = cat(3,allBlack,allBlack,blue);

axes(handles.axes2);
imshow(iblue);
handles.data2 = iblue;
guidata(hObject,handles);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% MIX LAYER
image1 = handles.data1;
allBlack = zeros(size(image1,1),size(image1,2));

red = image1(:,:,1); 
green = image1(:,:,1);  
mix = cat(3,255-red,120-green,20-allBlack);

axes(handles.axes2);
imshow(mix);
handles.data2 = mix;
guidata(hObject,handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% INVERS/NEGATIVE
image1 = handles.data1; 
invers=imcomplement(image1); 
handles.data2 = invers; 
axes(handles.axes2); 
imshow(invers); 
handles.data2 = invers; 
guidata(hObject,handles);
