function varargout = Implementasi1(varargin)
% IMPLEMENTASI1 MATLAB code for Implementasi1.fig
%      IMPLEMENTASI1, by itself, creates a new IMPLEMENTASI1 or raises the existing
%      singleton*.
%
%      H = IMPLEMENTASI1 returns the handle to a new IMPLEMENTASI1 or the handle to
%      the existing singleton*.
%
%      IMPLEMENTASI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPLEMENTASI1.M with the given input arguments.
%
%      IMPLEMENTASI1('Property','Value',...) creates a new IMPLEMENTASI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Implementasi1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Implementasi1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Implementasi1

% Last Modified by GUIDE v2.5 03-Oct-2021 20:17:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Implementasi1_OpeningFcn, ...
                   'gui_OutputFcn',  @Implementasi1_OutputFcn, ...
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


% --- Executes just before Implementasi1 is made visible.
function Implementasi1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Implementasi1 (see VARARGIN)

% Choose default command line output for Implementasi1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Implementasi1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Implementasi1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
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
    cla(handles.axes2);
    cla(handles.axes3);
    cla(handles.axes4);
    imshow(handles.data1);
    title('RGB');
else
    return
end





% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Histogram RGB
% img = handles.data1;
% gray = rgb2gray(img);
% axes(handles.axes2);
% imhist(gray);
% % imshow(gray);
% guidata(hObject,handles);


% === BAR() === 
img = handles.data1;
gray = rgb2gray(img);
axes(handles.axes2);
bar(gray);
axes(handles.axes3);
% imshow(gray);
guidata(hObject,handles);



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Equalization
% img = handles.data1;
% gray = rgb2gray(img);
% axes(handles.axes3);
% imshow(gray);
% h = histeq(gray);
% axes(handles.axes4);
% imshow(h);
% guidata(hObject,handles);


% === BAR() ===
% img = handles.data1;
% gray = rgb2gray(img);
% axes(handles.axes2);
% h = histeq(gray);
% bar(h);
% guidata(hObject,handles);


% === IMHIST() ===
img = handles.data1;
gray = rgb2gray(img);
axes(handles.axes2);
h = histeq(gray);
imhist(h);
guidata(hObject,handles);




% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Layer
img = handles.data1;

%gray = rgb2gray(img);

% axes(handles.axes2);
% R = img(:,:,1);
% imhist(R);
% axes(handles.axes3);
% G = img(:,:,2);
% imhist(G);
% axes(handles.axes4);
% B = img(:,:,3);
% imhist(B);
% guidata(hObject,handles);


% === BAR() ===
axes(handles.axes2);
R = img(:,:,1);
bar(R,'red');
axes(handles.axes3);
G = img(:,:,2);
bar(G,'green');
axes(handles.axes4);
B = img(:,:,3);
bar(B,'blue');
guidata(hObject,handles);
