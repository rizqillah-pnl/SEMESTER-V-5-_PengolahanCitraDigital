function varargout = imhst(varargin)
% IMHIST MATLAB code for imhist.fig
%      IMHIST, by itself, creates a new IMHIST or raises the existing
%      singleton*.
%
%      H = IMHIST returns the handle to a new IMHIST or the handle to
%      the existing singleton*.
%
%      IMHIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMHIST.M with the given input arguments.
%
%      IMHIST('Property','Value',...) creates a new IMHIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imhist_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imhist_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imhist

% Last Modified by GUIDE v2.5 07-Oct-2021 19:42:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imhist_OpeningFcn, ...
                   'gui_OutputFcn',  @imhist_OutputFcn, ...
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


% --- Executes just before imhist is made visible.
function imhist_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imhist (see VARARGIN)

% Choose default command line output for imhist
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imhist wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imhist_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buka.
function buka_Callback(hObject, eventdata, handles)
% hObject    handle to buka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[name_file1,name_path1] = uigetfile( ...
 {'*.png;*.jpeg;*.gif','Files of type image (*.png;*.jpeg;*.gif)';},...
 'Buka Gambar');
if ~isequal(name_file1,0)
 handles.data1 = imread(fullfile(name_path1,name_file1));
 guidata(hObject,handles);
 axes(handles.axes1);
 imshow(handles.data1);
else
    return;
end

% --- Executes on button press in rgb.
function rgb_Callback(hObject, eventdata, handles)
% hObject    handle to rgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.data1;
gray=rgb2gray(img);
axes(handles.axes2);
imhist(gray);
%imshow(gray);
guidata(hObject,handles);
