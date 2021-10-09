function varargout = Latihan3(varargin)
% LATIHAN3 MATLAB code for Latihan3.fig
%      LATIHAN3, by itself, creates a new LATIHAN3 or raises the existing
%      singleton*.
%
%      H = LATIHAN3 returns the handle to a new LATIHAN3 or the handle to
%      the existing singleton*.
%
%      LATIHAN3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LATIHAN3.M with the given input arguments.
%
%      LATIHAN3('Property','Value',...) creates a new LATIHAN3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Latihan3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Latihan3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Latihan3

% Last Modified by GUIDE v2.5 05-Oct-2021 21:05:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Latihan3_OpeningFcn, ...
                   'gui_OutputFcn',  @Latihan3_OutputFcn, ...
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


% --- Executes just before Latihan3 is made visible.
function Latihan3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Latihan3 (see VARARGIN)

% Choose default command line output for Latihan3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Latihan3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Latihan3_OutputFcn(hObject, eventdata, handles) 
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

% Open Image
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

% his = sum(h)
% his = his/max(his)
img = handles.data1;
gray = rgb2gray(img);
his = sum(gray);
his = his/max(his);
axes(handles.axes2);
imhist(his);
% bar(his);
guidata(hObject,handles);
% UINT16
% img = handles.data1;
% gray = rgb2gray(img);
% his = uint16(gray);
% axes(handles.axes2);
% imhist(his);
% guidata(hObject,handles);
