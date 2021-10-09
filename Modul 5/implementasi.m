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

% Last Modified by GUIDE v2.5 08-Oct-2021 08:57:08

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
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




% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Transformasi Logaritmik
img = handles.data1;
image = im2double(img);
transform = 2*log(1+image);
axes(handles.axes2);
imshow(transform);
guidata(hObject,handles);




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Transformasi Grayscale
img = handles.data1;
image = im2double(img);
image = rgb2gray(image);
transform = 2*log(1+image);
axes(handles.axes2);
imshow(transform);
guidata(hObject,handles);




% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Slider Warna
img = handles.data1;
image = im2double(img);
val = get(hObject,'value');
transform = val*log(1+image);
axes(handles.axes2);
imshow(transform);
sliderVal = get(handles.slider1,'value');
set(handles.text6,'String',num2str(sliderVal));
handles.data3 = transform;
guidata(hObject,handles);




% Slider Grayscale
% % img = handles.data1;
% % image = im2double(img);
% % image = rgb2gray(image);
% % val = get(hObject,'value');
% % transform = val*log(1+image);
% % axes(handles.axes2);
% % imshow(transform);
% % sliderVal = get(handles.slider1,'value');
% % set(handles.text6,'String',num2str(sliderVal));
% % handles.data3 = transform;
% % guidata(hObject,handles);




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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Power Law
% img = handles.data1;
% image = im2double(img);
% % gray = rgb2gray(image);
% c = 2;
% y = 15;
% transform = c*image.^y;
% axes(handles.axes2);
% imshow(transform);
% guidata(hObject,handles);



% ==== Power Low 2 ====
img = handles.data1;
image = im2double(img);
% gray = rgb2gray(image);
c = 2;
y = 15;
transform = c*image.^(1/y);
axes(handles.axes2);
imshow(transform);
guidata(hObject,handles);
