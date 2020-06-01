% ------ ANÁLISE E PROCESSAMENTO DE IMAGEM, ANO LECTIVO: 2015/2016 ------ %
%
% FCTUC, M.I. ENGENHARIA BIOMÉDICA
%
% NUNO HENRIQUE PEREIRA MARTINS PINHEIRO, 2011169791
% ----------------------------------------------------------------------- %

function IMAGEM = funcao_adicionarIcon( IMgrande, IMpequena, alfa, coluna, linha, altura, largura )
    %funcao_adicionarIcon: Junta uma imagem pequena/icon
    %(IMpequena) a uma imagem maior (IMgrande), formando nova imagem. É
    %suposto funcionar com imagens PNG (caso essencial na IMpequena, que
    %"sobrepõe" a IMgrande), porque estas permitem manter um fundo 
    %transparente que tenham (o que faz todo o sentido, para a sobreposição
    %ficar bem).
    %   INPUT:  IMgrande: imagem que vai ser sobreposta;
    %           IMpequena: icon que vai sobrepor a IMgrande (convém que
    %           seja PNG, pelas razões atrás);
    %           alfa: critério de opacidade da IMpequena (só funciona com
    %           imagens PNG);
    %           coluna: coluna N inicial para marcar IMpequena na IMgrande;
    %           linha: linha M inicial para marcar IMpequena na IMgrande;
    %           largura: nº colunas que IMpequena ocupará;
    %           altura: nº linhas que IMpequena ocupará.
    %   OUTPUT: IMAGEM: imagem que é a combinação das duas sobrepostas.
    %
    %   REFERÊNCIAS:
    %   http://www.mathworks.com/help/images/ref/imresize.html#buxulax-1
    %   http://www.mathworks.com/help/matlab/ref/repmat.html?refresh=true
    %   http://www.mathworks.com/help/images/image-types-in-the-toolbox.html
    %   http://www.mathworks.com/help/matlab/ref/im2double.html
    
    
    % Alterar tamanho da imagem, com base na altura e largura. Isto é feito
    % para que o icon tenha sempre dimensões consistentes com o efeito
    % pretendido.
    IMpequena = imresize(IMpequena, [altura largura]);
    alfa = imresize(alfa, [altura largura]);
    
    % O alfa tem de seguir a estrutura MxNx3, para que se possa combinar
    % com os canais RGB das imagens (3 dimensões).
    alfa = repmat(alfa, [1 1 3]);
    
    % Vou proceder a cálculos entre estas variáveis, então convém que todas
    % apresentem o mesmo formato, evitando questões de precisão e
    % compatibilidade (por isso, passo as variáveis para tipo double).
    IMgrande = im2double(IMgrande);
    IMpequena = im2double(IMpequena);
    alfa = im2double(alfa);
    
    % Cálculo para a combinação das imagens, formando imagem combinada
    % ("IMAGEM"), com as partes escolhidas da IMgrande e com a IMpequena
    % no local pretendido. O critério "alfa" define a opacidade da
    % IMpequena, pelo que, a seguir, se utiliza "alfa" para ditar o que
    % permanece como IMgrande (as partes transparentes da IMpequena) e
    % "(1-alfa)" para definir o que se transforma em IMpequena (as suas
    % partes opacas).
    IMAGEM = IMgrande;
    IMAGEM(linha:(linha+size(IMpequena,1)-1), coluna:(coluna+size(IMpequena,2)-1), :) = IMpequena .* alfa + IMgrande(linha:(linha+size(IMpequena,1)-1), coluna:(coluna+size(IMpequena,2)-1), :) .* (1 - alfa);
    
end

