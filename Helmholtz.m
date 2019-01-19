function varargout = Helmholtz(varargin)
% HELMHOLTZ MATLAB code for Helmholtz.fig
%      HELMHOLTZ, by itself, creates a new HELMHOLTZ or raises the existing
%      singleton*.
%
%      H = HELMHOLTZ returns the handle to a new HELMHOLTZ or the handle to
%      the existing singleton*.
%
%      HELMHOLTZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELMHOLTZ.M with the given input arguments.
%
%      HELMHOLTZ('Property','Value',...) creates a new HELMHOLTZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Helmholtz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Helmholtz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Helmholtz

% Last Modified by GUIDE v2.5 05-Dec-2018 11:40:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Helmholtz_OpeningFcn, ...
                   'gui_OutputFcn',  @Helmholtz_OutputFcn, ...
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


% --- Executes just before Helmholtz is made visible.
function Helmholtz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Helmholtz (see VARARGIN)

% Choose default command line output for Helmholtz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Helmholtz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Helmholtz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.R,'String',num2str(get(handles.slider1,'Value')));
%get(0,'Min');
%get(20,'Max');
hObject.Max=20;
hObject.Min=0;
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



function R_Callback(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R as text
%        str2double(get(hObject,'String')) returns contents of R as a double
set(handles.slider1,'value',str2num(get(hObject,'string')));

% --- Executes during object creation, after setting all properties.
function R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%data.number_errors = 0;
%set(hObject,'UserData',data.number_errors)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=get(handles.R,'string');
d=str2num(d);
x=[-20:0.1:20];
u0=4*pi*10^(-7);
I=1;R=10;
fd=0.5*u0*I*R*R./(R*R+(d/2+x).^2).^(3/2)+0.5*u0*I*R*R./(R*R+(d/2-x).^2).^(3/2);
plot(x,fd);