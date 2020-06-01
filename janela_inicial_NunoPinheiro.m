% ------ ANÁLISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOMÉDICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

% RESUMO DE 'janela_inicial_NunoPinheiro':
%
% Esta é a interface que permite iniciar a interacção correcta e ordenada
% com todos os programas do projecto.
% O projecto total permite detectar diferentes características faciais
% humanas, quer seja em tempo real ou em fotografias. Além disso, permite
% fazer algumas alterações divertidas, de modo automático e amigo do
% utilizador. A eficiência destas detecções é variável, claro, de caso para
% caso.
%
% NOTA: Todo o projecto foi realizado com utilização do MATLAB R2014b, e as
% suas funcionalidades, em toda a sua competência, não estão completamente
% asseguradas em versões anteriores do software.

% BOTÕES DE 'janela_inicial_NunoPinheiro':
%
% Tempo Real: Conduz à interface do programa para detecção e tracking de
% faces humanas em tempo real, pela webcam (e respectivas funcionalidades).
%
% Fotografias: Leva à interface para detecção de diferentes estruturas
% humanas, em imagens (e respectivas funcionalidades).
%
% Sobre o programa: Abre a interface de explicação resumida do programa
% (semelhante ao primeiro parágrafo deste resumo).

%-------------------------------------------------------------------------%

function varargout = janela_inicial_NunoPinheiro(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @janela_inicial_NunoPinheiro_OpeningFcn, ...
                   'gui_OutputFcn',  @janela_inicial_NunoPinheiro_OutputFcn, ...
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


% --- Executes just before janela_inicial_NunoPinheiro is made visible.
function janela_inicial_NunoPinheiro_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for janela_inicial_NunoPinheiro
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

% UIWAIT makes janela_inicial_NunoPinheiro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = janela_inicial_NunoPinheiro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botao_temporeal.
function botao_temporeal_Callback(hObject, eventdata, handles)
close(janela_inicial_NunoPinheiro);
tempo_real_NunoPinheiro;

% --- Executes on button press in botao_fotografia.
function botao_fotografia_Callback(hObject, eventdata, handles)
close(janela_inicial_NunoPinheiro);
fotografia_NunoPinheiro;


% --- Executes on button press in botao_sobreoprograma.
function botao_sobreoprograma_Callback(hObject, eventdata, handles)
close(janela_inicial_NunoPinheiro);
sobre_programa_NunoPinheiro;
