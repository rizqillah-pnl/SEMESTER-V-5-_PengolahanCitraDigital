function varargout = Soal3(varargin)
% SOAL3 MATLAB code for Soal3.fig
%      SOAL3, by itself, creates a new SOAL3 or raises the existing
%      singleton*.
%
%      H = SOAL3 returns the handle to a new SOAL3 or the handle to
%      the existing singleton*.
%
%      SOAL3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL3.M with the given input arguments.
%
%      SOAL3('Property','Value',...) creates a new SOAL3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Soal3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Soal3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Soal3

% Last Modified by GUIDE v2.5 25-Sep-2021 15:27:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Soal3_OpeningFcn, ...
                   'gui_OutputFcn',  @Soal3_OutputFcn, ...
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


% --- Executes just before Soal3 is made visible.
function Soal3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Soal3 (see VARARGIN)

% Choose default command line output for Soal3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Soal3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Soal3_OutputFcn(hObject, eventdata, handles) 
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
    title('RGB');
else
    return
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% CYAN
image1 = handles.data1;
allBlack = zeros(size(image1,1),size(image1,2));

cyan = image1(:,:,1);
icyan = cat(3,allBlack,cyan,cyan);
axes(handles.axes2);
imshow(icyan);
handles.data2 = cyan;
title('Cyan');
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% HOT
image1 = handles.data1;
[Y] = rgb2ind(image1,28);
axes(handles.axes2);
imagesc(Y);
colormap(hot)
title('HOT');
axis off


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% COOL
image1 = handles.data1;
[Y] = rgb2ind(image1,28);
axes(handles.axes2);
imagesc(Y);
colormap(cool);
title('COOL');
axis off


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% FALSE
image1 = handles.data1;
[Y] = rgb2ind(image1,28);
axes(handles.axes2);
imagesc(Y);
colormap(jet);
title('FALSE');
axis off


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Sephia
d = handles.data1;
dR = d(:,:,1);
dG = d(:,:,2);
dB = d(:,:,3);

r = .393*dR + .769*dG + .189*dB;
g = .349*dR + .686*dG + .168*dB;
b = .272*dR + .534*dG + .131*dB;

dSephia = cat(3,r,g,b);
axes(handles.axes2);
imshow(dSephia);
title('Sephia');
guidata(hObject,handles);
