function varargout = TransformasiLogaritmik(varargin)
% TRANSFORMASILOGARITMIK MATLAB code for TransformasiLogaritmik.fig
%      TRANSFORMASILOGARITMIK, by itself, creates a new TRANSFORMASILOGARITMIK or raises the existing
%      singleton*.
%
%      H = TRANSFORMASILOGARITMIK returns the handle to a new TRANSFORMASILOGARITMIK or the handle to
%      the existing singleton*.
%
%      TRANSFORMASILOGARITMIK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSFORMASILOGARITMIK.M with the given input arguments.
%
%      TRANSFORMASILOGARITMIK('Property','Value',...) creates a new TRANSFORMASILOGARITMIK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TransformasiLogaritmik_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TransformasiLogaritmik_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TransformasiLogaritmik

% Last Modified by GUIDE v2.5 08-Oct-2021 09:57:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TransformasiLogaritmik_OpeningFcn, ...
                   'gui_OutputFcn',  @TransformasiLogaritmik_OutputFcn, ...
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


% --- Executes just before TransformasiLogaritmik is made visible.
function TransformasiLogaritmik_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TransformasiLogaritmik (see VARARGIN)

% Choose default command line output for TransformasiLogaritmik
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TransformasiLogaritmik wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TransformasiLogaritmik_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Transformasi Logaritmik
img = handles.data1;
image = im2double(img);
c = get(handles.slider1,'value');
transform = c*log(image+1);
axes(handles.axes2);
imshow(transform);
sliderVal = get(handles.slider1,'value');
set(handles.text3,'String',num2str(sliderVal));
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
