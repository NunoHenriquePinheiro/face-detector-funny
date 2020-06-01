% ------ ANÁLISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOMÉDICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

% RESUMO DE 'sobre_programa_NunoPinheiro':
%
% Acedido através do programa 'janela_inicial_NunoPinheiro', este programa
% tem, apenas, a função de mostrar um texto ao utilizador, com um resumo
% breve acerca das funcionalidades e objectivo do projecto.

% NOTA: Todo o projecto foi realizado com utilização do MATLAB R2014b, e as
% suas funcionalidades, em toda a sua competência, não estão completamente
% asseguradas em versões anteriores do software.

% BOTÕES DE 'sobre_programa_NunoPinheiro':
%
% Voltar: Abre a janela de menu anterior a esta ('janela_inicial_
% NunoPinheiro').
%
% Sair: Fecha a aplicação.

%-------------------------------------------------------------------------%

function varargout = sobre_programa_NunoPinheiro(varargin)
% SOBRE_PROGRAMA_NUNOPINHEIRO MATLAB code for sobre_programa_NunoPinheiro.fig
%      SOBRE_PROGRAMA_NUNOPINHEIRO, by itself, creates a new SOBRE_PROGRAMA_NUNOPINHEIRO or raises the existing
%      singleton*.
%
%      H = SOBRE_PROGRAMA_NUNOPINHEIRO returns the handle to a new SOBRE_PROGRAMA_NUNOPINHEIRO or the handle to
%      the existing singleton*.
%
%      SOBRE_PROGRAMA_NUNOPINHEIRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOBRE_PROGRAMA_NUNOPINHEIRO.M with the given input arguments.
%
%      SOBRE_PROGRAMA_NUNOPINHEIRO('Property','Value',...) creates a new SOBRE_PROGRAMA_NUNOPINHEIRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sobre_programa_NunoPinheiro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sobre_programa_NunoPinheiro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sobre_programa_NunoPinheiro

% Last Modified by GUIDE v2.5 30-Dec-2015 18:41:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sobre_programa_NunoPinheiro_OpeningFcn, ...
                   'gui_OutputFcn',  @sobre_programa_NunoPinheiro_OutputFcn, ...
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


% --- Executes just before sobre_programa_NunoPinheiro is made visible.
function sobre_programa_NunoPinheiro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sobre_programa_NunoPinheiro (see VARARGIN)

% Choose default command line output for sobre_programa_NunoPinheiro
handles.output = hObject;

%CENTRALIZAÇÃO DA JANELA NO ECRA
movegui(gcf,'center');

%INTRODUÇÃO DO LOGOTIPO NO RESPETIVO SITIO
I = imread('detetorlogo.jpg');
axes(handles.detetorlogo);
Y = imresize(I,[100 100],'bilinear');
imshow(Y);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sobre_programa_NunoPinheiro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sobre_programa_NunoPinheiro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botao_voltar.
function botao_voltar_Callback(hObject, eventdata, handles)
close(sobre_programa_NunoPinheiro);
janela_inicial_NunoPinheiro;
