% ------ AN�LISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOM�DICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

function DETECTADO = funcao_detetarPessoas( imagem, escolha )
    %funcao_detetarPessoas: Cria um objecto classificador, de acordo com a
    %string de escolha inserida no input. Depois, classifica �reas da
    %imagem que correspondam ao pedido, devolvendo a sua localiza��o e
    %extens�o (estas �reas correspondem a tra�os humanos).
    %   INPUT:  imagem: imagem onde queremos fazer classifica��o;
    %           escolha: string com informa��o do tipo de estrutura a
    %           classificar (face, nariz, ...).
    %   OUTPUT: DETECTADO: matriz Mx4 do tipo [coluna linha largura
    %   altura], que indica a localiza��o e tamanho das M �reas
    %   classificadas.
    %
    %   REFER�NCIAS:
    %   http://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector-class.html#bs_kkbv
    %   http://www.mathworks.com/help/vision/ref/vision.cascadeobjectdetector.step.html
    
    
    % Criar objecto classificador. Caso "escolha" n�o seja string, ou tenha
    % informa��o n�o compat�vel, a opera��o � imposs�vel.
    detetor = vision.CascadeObjectDetector('ClassificationModel',escolha);
    
    % Aplica o detector � imagem de input. A classifica��o (boa ou m�) �
    % muito dependente da imagem escolhida, dado que a dete��o de
    % par�metros f�sicos humanos gen�ricos carece de classificadores
    % excepcionalmente robustos (e n�o �, como se v�, efectuado qualquer
    % treino "personalizado" para este classificador).
    DETECTADO = step(detetor, imagem);
    
end

