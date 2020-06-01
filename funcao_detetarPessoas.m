% ------ ANÁLISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOMÉDICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

function DETECTADO = funcao_detetarPessoas( imagem, escolha )
    %funcao_detetarPessoas: Cria um objecto classificador, de acordo com a
    %string de escolha inserida no input. Depois, classifica áreas da
    %imagem que correspondam ao pedido, devolvendo a sua localização e
    %extensão (estas áreas correspondem a traços humanos).
    %   INPUT:  imagem: imagem onde queremos fazer classificação;
    %           escolha: string com informação do tipo de estrutura a
    %           classificar (face, nariz, ...).
    %   OUTPUT: DETECTADO: matriz Mx4 do tipo [coluna linha largura
    %   altura], que indica a localização e tamanho das M áreas
    %   classificadas.
    %
    %   REFERÊNCIAS:
    %   http://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector-class.html#bs_kkbv
    %   http://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector.step.html
    
    
    % Criar objecto classificador. Caso "escolha" não seja string, ou tenha
    % informação não compatível, a operação é impossível.
    detetor = vision.CascadeObjectDetector('ClassificationModel',escolha);
    
    % Aplica o detector à imagem de input. A classificação (boa ou má) é
    % muito dependente da imagem escolhida, dado que a deteção de
    % parâmetros físicos humanos genéricos carece de classificadores
    % excepcionalmente robustos (e não é, como se vê, efectuado qualquer
    % treino "personalizado" para este classificador).
    DETECTADO = step(detetor, imagem);
    
end

