% ------ ANÁLISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOMÉDICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

% RESUMO DE 'fotografia_NunoPinheiro':
%
% Esta interface permite detectar várias estruturas humanas, em
% fotografias. Ainda permite a adição de ícones (de forma automática ou
% personalizada), bem como guardar imagens modificadas.
%
% NOTA: Todo o projecto foi realizado com utilização do MATLAB R2014b, e as
% suas funcionalidades, em toda a sua competência, não estão completamente
% asseguradas em versões anteriores do software.

% BOTÕES DE 'fotografia_NunoPinheiro':
%
% Carregar: Deve ser o primeiro botão seleccionado, permitindo que o
% utilizador seleccione uma fotografia para upload na tela de apresentação.
%
% Guardar: Permite captar e guardar a imagem mostrada na janela, em
% directoria e com extensão e nome ao gosto do utilizador.
%
% Limpar: Faz reset na interface, esvaziando a janela de apresentação.
%
% Detectar: Leva à abertura de um submenu, onde o utilizador pode escolher
% qual a estrutura corporal a detectar. Após este passo, o programa tenta
% detectá-la.
%
% Máscara, Nariz de Palhaço, Óculos: Permite a adição automática do
% respectivo ícone PNG aos locais adequados da fotografia, caso estes sejam
% detectados. Estes locais são, ordenadamente: faces frontais, narizes,
% pares de olhos.
%
% Inserir Ícone Livre: Concede que o utilizador, pelo uso de rato ou
% touchpad, seleccione uma área da imagem na tela e sobreponha, nessa zona,
% um ícone à sua escolha.
%
% Instruções: Abre as instruções para a utilização da interface, semelhante
% às apresentadas aqui. Após a sua abertura, é permitido o regresso à
% janela anterior, através de um botão "Regressar".
%
% Voltar: Abre a janela de menu anterior a esta ('janela_inicial_
% NunoPinheiro').
%
% Sair: Fecha a aplicação.

% REFERÊNCIAS:
% http://www.mathworks.com/help/matlab/ref/waitforbuttonpress.html
% http://www.mathworks.com/help/matlab/ref/menu.html
% http://www.mathworks.com/help/matlab/ref/imwrite.html
% http://www.mathworks.com/help/matlab/ref/uiputfile.html
% http://matlab.wikia.com/wiki/FAQ#How_can_I_share_data_between_callback_functions_in_my_GUI.3F
% http://www.mathworks.com/help/matlab/ref/questdlg.html

%-------------------------------------------------------------------------%

function varargout = fotografia_NunoPinheiro(varargin)
% FOTOGRAFIA_NUNOPINHEIRO MATLAB code for fotografia_NunoPinheiro.fig
%      FOTOGRAFIA_NUNOPINHEIRO, by itself, creates a new FOTOGRAFIA_NUNOPINHEIRO or raises the existing
%      singleton*.
%
%      H = FOTOGRAFIA_NUNOPINHEIRO returns the handle to a new FOTOGRAFIA_NUNOPINHEIRO or the handle to
%      the existing singleton*.
%
%      FOTOGRAFIA_NUNOPINHEIRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOTOGRAFIA_NUNOPINHEIRO.M with the given input arguments.
%
%      FOTOGRAFIA_NUNOPINHEIRO('Property','Value',...) creates a new FOTOGRAFIA_NUNOPINHEIRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fotografia_NunoPinheiro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fotografia_NunoPinheiro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fotografia_NunoPinheiro

% Last Modified by GUIDE v2.5 30-Dec-2015 20:15:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fotografia_NunoPinheiro_OpeningFcn, ...
                   'gui_OutputFcn',  @fotografia_NunoPinheiro_OutputFcn, ...
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


% --- Executes just before fotografia_NunoPinheiro is made visible.
function fotografia_NunoPinheiro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fotografia_NunoPinheiro (see VARARGIN)

% Choose default command line output for fotografia_NunoPinheiro
handles.output = hObject;

%CENTRALIZAÇÃO DA JANELA NO ECRÃ
movegui(gcf,'center');

%INTRODUÇÃO DO LOGÓTIPO NO RESPECTIVO SÍTIO
I = imread('detetorlogo.jpg');
axes(handles.detetorlogo);
Y = imresize(I,[100 100],'bilinear');
imshow(Y);

set(handles.axes2, 'XTick', []); set(handles.axes2, 'YTick', []);

%DEFINIÇÃO DE BOTÕES INICIALMENTE DESACTIVADOS
set(handles.botao_guardar,'enable','off')
set(handles.botao_limpar,'enable','off')
set(handles.botao_mascara,'enable','off')
set(handles.botao_narizpalhaco,'enable','off')
set(handles.botao_oculos,'enable','off')
set(handles.botao_detectar,'enable','off')
set(handles.botao_iconelivre,'enable','off')

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes fotografia_NunoPinheiro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fotografia_NunoPinheiro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botao_carregar.
function botao_carregar_Callback(hObject, eventdata, handles)
% hObject    handle to botao_carregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEM fun_path1;

% FAZER LOAD DE UMA IMAGEM, À ESCOLHA DO UTILIZADOR

% Predefine directoria a abrir na janela de selecção
fun_name = mfilename;
fun_path = mfilename('fullpath');
fun_path1 = fun_path(1:end-length(fun_name)-1);

% Janela de selecção
[filename, pathname] = uigetfile({'*.jpg';'*.tif';'*.png'},'Carregar imagem',fun_path1);
if isequal(filename,0)
else
    % IMAGEM DEFINIDA
    IMAGEM = imread(fullfile(pathname, filename));
    
    % APRESENTAÇÃO DA IMAGEM NA JANELA
    axes(handles.axes2);
    imshow(IMAGEM);
    
    %DEFINIÇÃO DE BOTÕES QUE AGORA SE PODERÃO UTILIZAR
    set(handles.botao_guardar,'enable','on')
    set(handles.botao_limpar,'enable','on')
    set(handles.botao_mascara,'enable','on')
    set(handles.botao_narizpalhaco,'enable','on')
    set(handles.botao_oculos,'enable','on')
    set(handles.botao_detectar,'enable','on')
    set(handles.botao_iconelivre,'enable','on')
end


% --- Executes on button press in botao_guardar.
function botao_guardar_Callback(hObject, eventdata, handles)
% hObject    handle to botao_guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEM fun_path1;

% Janela de selecção, com directoria predefinida
[filename, pathname] = uiputfile({'*.jpg';'*.tif';'*.png'},'Guardar imagem',fun_path1);
if isequal(filename,0)
else
    imwrite(IMAGEM,fullfile(pathname, filename));
end


% --- Executes on button press in botao_limpar.
function botao_limpar_Callback(hObject, eventdata, handles)
% hObject    handle to botao_limpar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% LIMPAR JANELA COM IMAGEM
cla(handles.axes2,'reset')
set(handles.axes2, 'XTick', []); set(handles.axes2, 'YTick', []);

%DEFINIÇÃO DE BOTÕES QUE AGORA NÃO SE PODERÃO USAR
set(handles.botao_guardar,'enable','off')
set(handles.botao_limpar,'enable','off')
set(handles.botao_mascara,'enable','off')
set(handles.botao_narizpalhaco,'enable','off')
set(handles.botao_oculos,'enable','off')
set(handles.botao_detectar,'enable','off')
set(handles.botao_iconelivre,'enable','off')


% --- Executes on button press in botao_mascara.
function botao_mascara_Callback(hObject, eventdata, handles)
% hObject    handle to botao_mascara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEM fun_path1;

% ABRE FUNÇÃO DE DETECÇÃO, QUE ESCREVI À PARTE
BB = funcao_detetarPessoas( IMAGEM, 'FrontalFaceCART' );

% LÊ ICON A ADICIONAR, DA PASTA ICONS
[IMpequena,~,alfa] = imread([fun_path1, '\ICONS\', 'mask2.png']);

% FAZ A ADIÇÃO DO ELEMENTO À IMAGEM, POR OUTRA FUNÇÃO À PARTE
for i=1:1:size(BB,1)
    IMAGEM = funcao_adicionarIcon( IMAGEM, IMpequena, alfa, BB(i,1), BB(i,2), BB(i,4), BB(i,3) );
end

% APRESENTAÇÃO DA IMAGEM NA JANELA
axes(handles.axes2);
imshow(IMAGEM);


% --- Executes on button press in botao_narizpalhaco.
function botao_narizpalhaco_Callback(hObject, eventdata, handles)
% hObject    handle to botao_narizpalhaco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEM fun_path1;

% ABRE FUNÇÃO DE DETECÇÃO, QUE ESCREVI À PARTE
BB = funcao_detetarPessoas( IMAGEM, 'Nose' );

% LÊ ICON A ADICIONAR, DA PASTA ICONS
[IMpequena,~,alfa] = imread([fun_path1, '\ICONS\', 'clown_nose.png']);

% FAZ A ADIÇÃO DO ELEMENTO À IMAGEM, POR OUTRA FUNÇÃO À PARTE
for i=1:1:size(BB,1)
    IMAGEM = funcao_adicionarIcon( IMAGEM, IMpequena, alfa, BB(i,1), BB(i,2), BB(i,4), BB(i,3) );
end

% APRESENTAÇÃO DA IMAGEM NA JANELA
axes(handles.axes2);
imshow(IMAGEM);


% --- Executes on button press in botao_oculos.
function botao_oculos_Callback(hObject, eventdata, handles)
% hObject    handle to botao_oculos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEM fun_path1;

% ABRE FUNÇÃO DE DETECÇÃO, QUE ESCREVI À PARTE
BB = funcao_detetarPessoas( IMAGEM, 'EyePairBig' );

% LÊ ICON A ADICIONAR, DA PASTA ICONS
[IMpequena,~,alfa] = imread([fun_path1, '\ICONS\', 'sunglasses2.png']);

% FAZ A ADIÇÃO DO ELEMENTO À IMAGEM, POR OUTRA FUNÇÃO À PARTE
for i=1:1:size(BB,1)
    IMAGEM = funcao_adicionarIcon( IMAGEM, IMpequena, alfa, BB(i,1), BB(i,2), BB(i,4), BB(i,3) );
end

% APRESENTAÇÃO DA IMAGEM NA JANELA
axes(handles.axes2);
imshow(IMAGEM);


% --- Executes on button press in botao_detectar.
function botao_detectar_Callback(hObject, eventdata, handles)
% hObject    handle to botao_detectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEM;

% ESCOLHER QUAL A ESTRUTURA A DETECTAR
MENSAGEM = 'Antes de avançar, escolha uma das opções abaixo.';
button = menu(MENSAGEM, 'Face (frontal)', 'Cabeça e tronco', 'Olhos (frontal)', 'Boca', 'Nariz', 'Cancelar');

permitir = false;

switch button
    case 1, escolha='FrontalFaceCART'; permitir=true;
    case 2, escolha='UpperBody'; permitir=true;
    case 3, escolha='EyePairBig'; permitir=true;
    case 4, escolha='Mouth'; permitir=true;
    case 5, escolha='Nose'; permitir=true;
    case 6
end

if (permitir)
    % ABRE FUNÇÃO DE DETECÇÃO, QUE ESCREVI À PARTE
    BB = funcao_detetarPessoas( IMAGEM, escolha );
    
    % MOSTRA IMAGEM, MAS ESPERA PELA CONSTRUÇÃO TOTAL DA FIGURA
    axes(handles.axes2);
    imshow(IMAGEM); hold on;
    
    % COLOCA RECTÂNGULOS EM TORNO DAS ÁREAS SELECCIONADAS E LIBERTA A FIGURA
    for i=1:size(BB,1)
        rectangle('Position',BB(i,:), 'LineWidth',5, 'LineStyle','-', 'EdgeColor','r');
    end
    hold off;
end


% --- Executes on button press in botao_iconelivre.
function botao_iconelivre_Callback(hObject, eventdata, handles)
    % hObject    handle to botao_iconelivre (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    global IMAGEM fun_path1;
    
    % CAIXA DE DIÁLOGO QUE INFORMA UTILIZADOR PARA A SUA ACÇÃO SEGUINTE
    button = questdlg('Ao continuar, deverá clicar sobre uma zona da imagem e aguentar o clique. Mova o rato, seleccionando uma área da figura. Ao levantar o clique, poderá escolher um ícone PNG a seu gosto, que aparecerá no local seleccionado.', ...
        'Inserir Ícone Livre: AVISO','Continuar','Cancelar','Continuar');
    
    switch button
        case 'Cancelar'
        case 'Continuar'
            
            % CÓDIGO QUE PERMITE AO UTILIZADOR SELECCIONAR UMA ÁREA DA FIGURA À SUA ESCOLHA
            k1 = waitforbuttonpress;
            ponto1 = get(handles.axes2,'CurrentPoint');                     % detecta pressão no left-click do rato
            k2 = rbbox;
            ponto2 = get(handles.axes2,'CurrentPoint');                     % detecta o término da pressão
            
            ponto1 = ponto1(1,1:2);                                         % extrai as coordenadas necessárias
            ponto2 = ponto2(1,1:2);
            inicio = min(ponto1,ponto2);                                    % calcula os pontos iniciais e dimensões
            dimensao = abs(ponto1-ponto2);
            
            x1 = round(inicio(1));
            x2 = round(inicio(1)+dimensao(1));
            y1 = round(inicio(2));
            y2 = round(inicio(2)+dimensao(2));
            
            if (y2-y1>0) && (x2-x1>0)       % PREVINE ERRO DE DETECÇÃO DE EVENTO
                
                % SELECCIONAR ÍCONE PNG AO GOSTO DO UTILIZADOR
                % Janela de selecção
                [filename, pathname] = uigetfile({'*.png'},'Carregar ícone PNG',[fun_path1, '\ICONS']);
                if isequal(filename,0)
                else
                    % ICONE DEFINIDO
                    [icone,~,alfa] = imread(fullfile(pathname, filename));
                    
                    % INTRODUÇÃO DO ÍCONE NA IMAGEM, PELA FUNÇÃO
                    IMAGEM = funcao_adicionarIcon( IMAGEM, icone, alfa, x1, y1, y2-y1, x2-x1 );
                    
                    % DISPLAY DA IMAGEM MODIFICADA
                    axes(handles.axes2);
                    imshow(IMAGEM);
                end
                
            else
                % CAIXA DE DIÁLOGO QUE INFORMA UTILIZADOR DO ERRO
                button = questdlg('Ocorreu um erro na detecção de eventos. As causas mais prováveis serão um clique incorrecto no rato/touchpad ou uma falha no sistema. Por favor, tente de novo.', ...
                    'ERRO NA CAPTAÇÃO DE EVENTO','OK','OK');
                switch button
                    case 'OK'
                end
            end
    end


% --- Executes on button press in botao_instrucoes.
function botao_instrucoes_Callback(hObject, eventdata, handles)
%torna o painel das fotografias invisivel e o das instrucoes visivel
set(handles.painelfotografias,'visible','off');
set(handles.painelinstrucoes,'visible','on');


% --- Executes on button press in botao_voltar.
function botao_voltar_Callback(hObject, eventdata, handles)
%volta ao menu inicial
close(fotografia_NunoPinheiro);
janela_inicial_NunoPinheiro;


% --- Executes on button press in botao_sair.
function botao_sair_Callback(hObject, eventdata, handles)
%fechar tudo
close all;


% --- Executes on button press in botao_regressar.
function botao_regressar_Callback(hObject, eventdata, handles)
%torna o painel das instrucoes invisivel e o das fotografias visivel
set(handles.painelinstrucoes,'visible','off');
set(handles.painelfotografias,'visible','on');



% --- Executes on button press in botao_sair2.
function botao_sair2_Callback(hObject, eventdata, handles)
%fechar tudo
close all;
