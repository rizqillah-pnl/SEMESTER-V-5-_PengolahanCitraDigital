function varargout = Soal2v2(varargin)
% SOAL2V2 MATLAB code for Soal2v2.fig
%      SOAL2V2, by itself, creates a new SOAL2V2 or raises the existing
%      singleton*.
%
%      H = SOAL2V2 returns the handle to a new SOAL2V2 or the handle to
%      the existing singleton*.
%
%      SOAL2V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL2V2.M with the given input arguments.
%
%      SOAL2V2('Property','Value',...) creates a new SOAL2V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Soal2v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Soal2v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Soal2v2

% Last Modified by GUIDE v2.5 25-Sep-2021 14:31:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Soal2v2_OpeningFcn, ...
                   'gui_OutputFcn',  @Soal2v2_OutputFcn, ...
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


% --- Executes just before Soal2v2 is made visible.
function Soal2v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Soal2v2 (see VARARGIN)

% Choose default command line output for Soal2v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Soal2v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Soal2v2_OutputFcn(hObject, eventdata, handles) 
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

% BLACK AND WHITE /Threshold
image1 = handles.data1;
bw = im2bw(image1);
axes(handles.axes2);
imshow(bw);
handles.data2 = bw;
guidata(hObject,handles);
title('Threshold');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Threshold Otsu
image1 = handles.data1;
level = graythresh(image1);
bw = im2bw(image1,level);
axes(handles.axes2);
imshow(bw);
handles.data2 = bw;
guidata(hObject,handles);
title('Threshold Otsu');
