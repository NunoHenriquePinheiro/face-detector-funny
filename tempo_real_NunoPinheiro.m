% ------ AN�LISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOM�DICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

% RESUMO DE 'tempo_real_NunoPinheiro':
%
% Esta interface permite detectar e seguir caras humanas (v�rias ao mesmo
% tempo, se for o caso), em tempo real. Ainda permite a sobreposi��o de
% �cones nas faces, automaticamente e ao gosto do utilizador, bem como
% guardar fotografias modificadas.
%
% NOTA: Todo o projecto foi realizado com utiliza��o do MATLAB R2014b, e as
% suas funcionalidades, em toda a sua compet�ncia, n�o est�o completamente
% asseguradas em vers�es anteriores do software.

% BOT�ES DE 'tempo_real_NunoPinheiro':
%
% Ligar Webcam: Deve ser o primeiro bot�o seleccionado, criando a liga��o
% entre o programa e a webcam do seu computador, que � activada.
%
% Detectar: Permite o aparecimento da imagem da webcam nesta interface, bem
% como a detec��o e acompanhamento de faces humanas presentes.
%
% Tirar Foto: Permite captar e guardar a imagem mostrada na janela, nesse
% momento, em directoria (e com extens�o e nome) ao gosto do utilizador.
%
% Cancelar: Termina a obten��o de imagens e a conex�o com a webcam. Se
% pressionado uma segunda vez consecutiva, limpa o monitor de capta��o.
%
% Adicionar m�scara: Permite que o utilizador seleccione um �cone PNG, que
% ser� sobreposto, automaticamente, nas faces reconhecidas na tela.
%
% Instru��es: Abre as instru��es para a utiliza��o da interface, semelhante
% �s apresentadas aqui. Ap�s a sua abertura, � permitido o regresso �
% janela anterior, atrav�s de um bot�o "Regressar".
%
% Voltar: Abre a janela de menu anterior a esta ('janela_inicial_
% NunoPinheiro').
%
% Sair: Fecha a aplica��o.

% REFER�NCIAS: [mesmas que em 'fotografia_NunoPinheiro']

%-------------------------------------------------------------------------%

function varargout = tempo_real_NunoPinheiro(varargin)

% TEMPO_REAL_NUNOPINHEIRO MATLAB code for tempo_real_NunoPinheiro.fig
%      TEMPO_REAL_NUNOPINHEIRO, by itself, creates a new TEMPO_REAL_NUNOPINHEIRO or raises the existing
%      singleton*.
%
%      H = TEMPO_REAL_NUNOPINHEIRO returns the handle to a new TEMPO_REAL_NUNOPINHEIRO or the handle to
%      the existing singleton*.
%
%      TEMPO_REAL_NUNOPINHEIRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMPO_REAL_NUNOPINHEIRO.M with the given input arguments.
%
%      TEMPO_REAL_NUNOPINHEIRO('Property','Value',...) creates a new TEMPO_REAL_NUNOPINHEIRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tempo_real_NunoPinheiro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tempo_real_NunoPinheiro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edit_NunoPinheiro

% Last Modified by GUIDE v2.5 31-Dec-2015 04:58:18

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tempo_real_NunoPinheiro_OpeningFcn, ...
                   'gui_OutputFcn',  @tempo_real_NunoPinheiro_OutputFcn, ...
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


% --- Executes just before tempo_real_NunoPinheiro is made visible.
function tempo_real_NunoPinheiro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tempo_real_NunoPinheiro (see VARARGIN)

% Choose default command line output for tempo_real_NunoPinheiro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%CENTRALIZA��O DA JANELA NO ECRA
movegui(gcf,'center');

%INTRODU��O DO LOGOTIPO NO RESPETIVO SITIO
I = imread('detetorlogo.jpg');
axes(handles.detetorlogo);
Y = imresize(I,[100 100],'bilinear');
imshow(Y);

set(handles.axes_video, 'XTick', []); set(handles.axes_video, 'YTick', []);

%DEFINI��O DE BOT�ES INICIALMENTE DESACTIVADOS
set(handles.botao_detetar,'enable','off')
set(handles.botao_foto,'enable','off')
set(handles.botao_mascara,'enable','off')
set(handles.botao_cancelar,'enable','off')

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes tempo_real_NunoPinheiro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tempo_real_NunoPinheiro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botao_ligarweb.
function botao_ligarweb_Callback(hObject, eventdata, handles)
% hObject    handle to botao_ligarweb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global camara fun_path1;

% Predefine directoria a abrir na janela de selec��o
fun_name = mfilename;
fun_path = mfilename('fullpath');
fun_path1 = fun_path(1:end-length(fun_name)-1);

% PROCESSO DE LIGA��O DA WEBCAM
button = questdlg('Ao continuar, o programa tentar� aceder � sua webcam, pela fun��o "webcam()" do MATLAB. Caso n�o possua a fun��o no sistema, a sua instala��o ser� sugerida na Janela de Comandos do MATLAB.', ...
        'Ligar Webcam: AVISO','Continuar','Cancelar','Continuar');

    switch button
        case 'Cancelar'
        case 'Continuar'
            
            % LIGAR WEBCAM
            camara = webcam;
            
            %DEFINI��O DE BOT�ES AGORA ACTIVOS E N�O ACTIVOS
            set(handles.botao_detetar,'enable','on')
            set(handles.botao_ligarweb,'enable','off')
            set(handles.botao_cancelar,'enable','on')
    end



% --- Executes on button press in botao_detetar.
function botao_detetar_Callback(hObject, eventdata, handles)
% hObject    handle to botao_detetar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global loopDetectar camara fotoBOOL fun_path1 mascaraBOOL mascaraBOOL1;

axes(handles.axes_video);                                                   % frames da c�mara ser�o colocados no 'axes_video', pela fu��o 'imshow'

loopDetectar = true;                                                        % booleano de controlo do loop de detec��o e tracking de faces
fotoBOOL = false;                                                           % booleano de obten��o de foto
mascaraBOOL = false;                                                        % booleano controlador da coloca��o de m�scara
mascaraBOOL1 = false;                                                       % booleano controlador da selec��o de m�scara

% INICIA OBJECTO DETECTOR DE FACES E OBJECTO SEGUIDOR DE FACES
faceDetector = vision.CascadeObjectDetector();                              % identifica faces
tracker = MultiObjectTrackerKLT;                                            % faz o seu tracking, atrav�s de fun��o do MATLAB

% LOOP AT� EXISTIR UMA FACE DETECTADA
BBox = [];

while isempty(BBox)
    
    RGBframe = snapshot(camara);
    BWframe = rgb2gray(RGBframe);
    BBox = faceDetector.step(BWframe);                                      % detec��es s�o feitas em imagens com escala de cinzas
    
    imshow(RGBframe);                                                       % mostra consecutiva de frames
end

tracker.addDetections(BWframe, BBox);                                       % adiciona a face para tracking

% ACTIVA��O E DESACTIVA��O DE BOT�ES
set(handles.botao_foto,'enable','on')
set(handles.botao_mascara,'enable','on')
set(handles.botao_detetar,'enable','off')

% LOOP DE DETEC��O E TRACKING
Nframes = 0;

while (loopDetectar)
    
    RGBframe = snapshot(camara);
    BWframe = rgb2gray(RGBframe);
    
    % FACES S�O READQUIRIDAS DE 10 EM 10 FRAMES, PARA EVITAR ERROS E
    % VERIFICAR NOVAS OCORR�NCIAS. DE RESTO, APENAS SE FAZ TRACKING.
    if (mod(Nframes, 10) == 0)
        
        BBox = 2 * faceDetector.step(imresize(BWframe, 0.5));               % reduz recursos gastos pela fun��o 'step'
        
        if ~isempty(BBox)
            tracker.addDetections(BWframe, BBox);                           % caso sejam detectadas faces, adiciona-as para tracking
        end
    else
        tracker.track(BWframe);                                             % fora dos intervalos de 10 em 10 frames, apenas se faz tracking
    end
    
    % COLOCAR RECT�NGULOS EM VOLTA DAS FACES DETECTADAS E PONTOS NOS LOCAIS
    % DE TRACKING
    frameFinal = insertObjectAnnotation(RGBframe, 'rectangle',...
        tracker.Bboxes, tracker.BoxIds);
    frameFinal = insertMarker(frameFinal, tracker.Points);
    
    
    % SELECCIONAR E MOSTRAR M�SCARA
    if (mascaraBOOL==true)
        
        if (mascaraBOOL1==true)
            % SELECCIONAR �CONE PNG AO GOSTO DO UTILIZADOR
            % Janela de selec��o
            [filename, pathname] = uigetfile({'*.png'},'Carregar �cone PNG',[fun_path1, '\ICONS']);
            if isequal(filename,0)
                mascaraBOOL = false;
            else
                % ICONE DEFINIDO
                [icone,~,alfa] = imread(fullfile(pathname, filename));
            end
            mascaraBOOL1 = false;
        end
        
        if (mascaraBOOL==true)
            % INTRODU��O DO �CONE NA IMAGEM, PELA FUN��O
            for i=1:1:size(BBox,1)
                frameFinal = funcao_adicionarIcon( frameFinal, icone, alfa, BBox(i,1), BBox(i,2), BBox(i,4), BBox(i,3) );
            end
        end
    end
    
    % MOSTRAR FRAME
    imshow(frameFinal)
    
    % TIRAR/GUARDAR FOTOGRAFIA
    if (fotoBOOL==true)
        % Janela de selec��o, com directoria predefinida
        [filename, pathname] = uiputfile({'*.jpg';'*.tif';'*.png'},'Guardar imagem',fun_path1);
        if isequal(filename,0)
        else
            imwrite(frameFinal,fullfile(pathname, filename));
        end
        fotoBOOL = false;
    end
    
    Nframes = Nframes + 1;
end



% --- Executes on button press in botao_foto.
function botao_foto_Callback(hObject, eventdata, handles)
% hObject    handle to botao_foto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global fotoBOOL; fotoBOOL = true;                                           % ordena o pedido de armazenamento do frame em aquisi��o


% --- Executes on button press in botao_mascara.
function botao_mascara_Callback(hObject, eventdata, handles)
% hObject    handle to botao_mascara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global mascaraBOOL mascaraBOOL1; mascaraBOOL = true; mascaraBOOL1 = true;   % ordena (pedido de) coloca��o de m�scara


% --- Executes on button press in botao_instrucoes.
function botao_instrucoes_Callback(hObject, eventdata, handles)
%torna o painel do tempo real inicial invisivel e o das instrucoes visivel
set(handles.paineltemporeal,'visible','off');
set(handles.painelinstrucoes,'visible','on');


% --- Executes on button press in botao_voltar.
function botao_voltar_Callback(hObject, eventdata, handles)
%volta ao menu inicial
close(tempo_real_NunoPinheiro);
janela_inicial_NunoPinheiro;


% --- Executes on button press in botao_sair.
function botao_sair_Callback(hObject, eventdata, handles)
%fecha todas as janelas
close all;


% --- Executes on button press in botao_regressar.
function botao_regressar_Callback(hObject, eventdata, handles)
%torna o painel das instru�oes novamente invisivel e o do "tempo real"
%visivel
set(handles.painelinstrucoes,'visible','off');
set(handles.paineltemporeal,'visible','on');


% --- Executes on button press in botao_sair2.
function botao_sair2_Callback(hObject, eventdata, handles)
%fecha todas as janelas
close all;


% --- Executes on button press in botao_cancelar.
function botao_cancelar_Callback(hObject, eventdata, handles)
% hObject    handle to botao_cancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global loopDetectar camara fotoBOOL mascaraBOOL mascaraBOOL1;

% PARAR CICLO DE AQUISI��O DE IMAGEM E DETEC��O DE FACES
loopDetectar = false;

fotoBOOL = false;                                                           % booleano de obten��o de foto
mascaraBOOL = false;                                                        % booleano controlador da coloca��o de m�scara
mascaraBOOL1 = false;                                                       % booleano controlador da selec��o de m�scara

% FECHAR WEBCAM
camara = 0;

% LIMPAR JANELA COM IMAGEM
cla(handles.axes_video,'reset')
set(handles.axes_video, 'XTick', []); set(handles.axes_video, 'YTick', []);

%DEFINI��O DE BOT�ES INICIALMENTE DESACTIVADOS
set(handles.botao_detetar,'enable','off')
set(handles.botao_foto,'enable','off')
set(handles.botao_mascara,'enable','off')

%ACTIVA��O DO BOT�O PARA LIGAR A WEBCAM
set(handles.botao_ligarweb,'enable','on')
