% ------ AN�LISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOM�DICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

function IMAGEM = funcao_adicionarIcon( IMgrande, IMpequena, alfa, coluna, linha, altura, largura )
    %funcao_adicionarIcon: Junta uma imagem pequena/icon
    %(IMpequena) a uma imagem maior (IMgrande), formando nova imagem. �
    %suposto funcionar com imagens PNG (caso essencial na IMpequena, que
    %"sobrep�e" a IMgrande), porque estas permitem manter um fundo 
    %transparente que tenham (o que faz todo o sentido, para a sobreposi��o
    %ficar bem).
    %   INPUT:  IMgrande: imagem que vai ser sobreposta;
    %           IMpequena: icon que vai sobrepor a IMgrande (conv�m que
    %           seja PNG, pelas raz�es atr�s);
    %           alfa: crit�rio de opacidade da IMpequena (s� funciona com
    %           imagens PNG);
    %           coluna: coluna N inicial para marcar IMpequena na IMgrande;
    %           linha: linha M inicial para marcar IMpequena na IMgrande;
    %           largura: n� colunas que IMpequena ocupar�;
    %           altura: n� linhas que IMpequena ocupar�.
    %   OUTPUT: IMAGEM: imagem que � a combina��o das duas sobrepostas.
    %
    %   REFER�NCIAS:
    %   http://www.mathworks.com/help/images/ref/imresize.html#buxulax-1
    %   http://www.mathworks.com/help/matlab/ref/repmat.html?refresh=true
    %   http://www.mathworks.com/help/images/image-types-in-the-toolbox.html
    %   http://www.mathworks.com/help/matlab/ref/im2double.html
    
    
    % Alterar tamanho da imagem, com base na altura e largura. Isto � feito
    % para que o icon tenha sempre dimens�es consistentes com o efeito
    % pretendido.
    IMpequena = imresize(IMpequena, [altura largura]);
    alfa = imresize(alfa, [altura largura]);
    
    % O alfa tem de seguir a estrutura MxNx3, para que se possa combinar
    % com os canais RGB das imagens (3 dimens�es).
    alfa = repmat(alfa, [1 1 3]);
    
    % Vou proceder a c�lculos entre estas vari�veis, ent�o conv�m que todas
    % apresentem o mesmo formato, evitando quest�es de precis�o e
    % compatibilidade (por isso, passo as vari�veis para tipo double).
    IMgrande = im2double(IMgrande);
    IMpequena = im2double(IMpequena);
    alfa = im2double(alfa);
    
    % C�lculo para a combina��o das imagens, formando imagem combinada
    % ("IMAGEM"), com as partes escolhidas da IMgrande e com a IMpequena
    % no local pretendido. O crit�rio "alfa" define a opacidade da
    % IMpequena, pelo que, a seguir, se utiliza "alfa" para ditar o que
    % permanece como IMgrande (as partes transparentes da IMpequena) e
    % "(1-alfa)" para definir o que se transforma em IMpequena (as suas
    % partes opacas).
    IMAGEM = IMgrande;
    IMAGEM(linha:(linha+size(IMpequena,1)-1), coluna:(coluna+size(IMpequena,2)-1), :) = IMpequena .* alfa + IMgrande(linha:(linha+size(IMpequena,1)-1), coluna:(coluna+size(IMpequena,2)-1), :) .* (1 - alfa);
    
end

