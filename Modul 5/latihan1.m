function varargout = latihan1(varargin)
% LATIHAN1 MATLAB code for latihan1.fig
%      LATIHAN1, by itself, creates a new LATIHAN1 or raises the existing
%      singleton*.
%
%      H = LATIHAN1 returns the handle to a new LATIHAN1 or the handle to
%      the existing singleton*.
%
%      LATIHAN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LATIHAN1.M with the given input arguments.
%
%      LATIHAN1('Property','Value',...) creates a new LATIHAN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before latihan1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to latihan1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help latihan1

% Last Modified by GUIDE v2.5 08-Oct-2021 09:01:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @latihan1_OpeningFcn, ...
                   'gui_OutputFcn',  @latihan1_OutputFcn, ...
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


% --- Executes just before latihan1 is made visible.
function latihan1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to latihan1 (see VARARGIN)

% Choose default command line output for latihan1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes latihan1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = latihan1_OutputFcn(hObject, eventdata, handles) 
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

% Inverse
img = handles.data1;
image = im2double(img);
image = imcomplement(image);
transform = 2*log(1+image);
axes(handles.axes2);
imshow(transform);
title('Inverse');
guidata(hObject,handles);









% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Slider Inverse
img = handles.data1;
image = im2double(img);
image = imcomplement(image);
val = get(hObject,'value');
transform = val*log(1+image);
axes(handles.axes2);
imshow(transform);
sliderVal = get(handles.slider1,'value');
set(handles.text4,'String',num2str(sliderVal));
handles.data3 = transform;
guidata(hObject,handles);



% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
