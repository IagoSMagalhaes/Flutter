Antes de colocarmos a mão na massa na construção do nosso projeto, é importante entendermos melhor o que é o Flutter e o ambiente que utilizaremos nesse desenvolvimento. A fonte das informações sobre o Flutter será a página da documentação, http://flutter.dev, e a versão utilizada será a 1.7, a mais recente na criação do treinamento.

Quando rolamos a página da documentação, encontramos a informação de que o Flutter é uma ferramenta do Google,e funciona como um toolkit para construir aplicações bonitas. Ou seja, é uma característica do Flutter oferecer uma experiência agradável para o usuário, assim como permitir a compilação de maneira nativa para ambientes de mobile, web e desktop.

Durante nosso curso, focaremos especificamente na categoria mobile, para aplicativos Android e iOS. Caso haja interesse de entender a forma de compilar códigos para outras plataformas, bastará consultar a documentação para tirar suas dúvidas.

Ainda na página teremos outros destaques quanto a esse framework. Por exemplo, é dito que o Flutter é uma ferramenta para desenvolvimento rápido, e de fato ele entrega uma experiência diferente em relação a outras ferramentas. Também é falado sobre a capacidade de construção de telas de maneira expressiva e flexível, o que está relacionado com a proposta de gerar aplicativos com performance similar a de um nativo.

Também é importante citar que o Flutter é uma ferramenta open source com uma comunidade em crescimento, e você pode inclusive contribuir para o seu desenvolvimento.

Após esse nosso primeiro contato com a ferramenta, entenderemos sobre o ambiente que utilizaremos na criação do nosso primeiro projeto com o Flutter. Se clicarmos para entrar na opção "Docs" na barra superior da página da documentação, encontraremos diversas informações. No momento nos interessa a seção à esquerda, em que está escrito "Get Started".

Serão mostradas várias seções menores para acessar, como "Install" e "Set up an editor", e elas indicarão como podemos fazer a instalação. Teremos a opção de escolher operacional - no nosso caso, por exemplo, trabalharemos com o Windows. Continuando, encontraremos indicações de como usar o SDK do Flutter, editar variáveis de ambiente e assim por diante.

Nos exercícios da aula você encontrará um passo a passo com orientações para preparar o ambiente.

Um ponto importante para ser abordado é o uso de editores de código. Não há uma ferramenta própria do Flutter para o desenvolvimento de aplicativos, mas existem ferramentas que atualmente são muito utilizadas pela maioria dos desenvolvedores, como o Android Studio, IntelliJ ou Visual Studio Code. Fique a vontade para optar pela IDE de sua preferência.

Ao longo deste treinamento usaremos o IntelliJ, que apresenta recursos interessantes em relação ao uso do Flutter. Recomendamos que você também a utilize para acompanhar as aulas de modo a aproveitar o mesmo visual e as possibilidades do programa.

Depois de seguir as instruções do exercício, acessaremos o Prompt de Comando ou o Terminal. Quando estivermos trabalhando, deveremos escolher um diretório para execução dos comandos, pois nessa primeira abordagem utilizaremos a linha de comando. Começaremos executando o flutter, que nos retorna diversos parâmetros e argumentos que poderemos utilizar para fazermos algumas execuções, como verificar se tudo foi instalado corretamente (como é o caso do flutter doctor), ou ainda criar projetos ou rodar emuladores, e assim por diante. Essa será uma ferramenta importante para darmos nossos primeiros passos.

O flutter doctor faz uma análise no computador, verifica o que está instalado ou não e nos passa algumas informações, apresentando flags coloridas em verde (quando tudo está instalado corretamente) ou amarelo (com um sinal de alerta, representando que algum componente ou plugin está faltando).



No exemplo acima, ele indica que o Flutter está instalado corretamente, assim como o Android toolchain. Já o Android Studio aparece marcado em amarelo, pois, mesmo tendo sido instalado, não possui alguns plugins.

Após essa breve introdução, começaremos com a criação do projeto, que também pode ser feita com o auxílio do aplicativo do Flutter. Para criarmos o projeto no Prompt, executaremos flutter create seguido de um espaço e do nome do projeto - no caso, flutter create bytebank. Durante o curso, trabalharemos com um aplicativo chamado Bytebank, um banco digital capaz de executar grande parte das funcionalidades bancárias.

Com a execução do comando, o Flutter executará diversas tarefas para gerar nosso projeto. Em seguida, é recomendável entrar no diretório do projeto criado (a pasta "bytebank", que pode ser acessada com cd bytebank) e chamar o comando** flutter run** para executá-lo. O Flutter verificará se existe um dispotivo para executar o aplicativo, seja um dispotivo Android ou IOS.

No nosso caso, será apresentada uma mensagem de que não há nenhum dispositivo conectado. Veremos como o aplicativo do Flutter poderá nos ajudar a identificar um dispositivo ou até mesmo subir um emulador.

Se tivéssemos conectado um dispositivo corretamente utilizando o modo debugging, digitaríamos flutter devices no Prompt para exibir os dispositivos disponíveis. Como não temos nenhum no momento, será mostrada a mensagem informando que não foi possível encontrá-los, além da sugestão do comando flutter emulators, que lista os emuladores disponíveis.

Ao executá-lo, será identificado um emulador gerado anteriormente em nosso computador, e cuja criação é detalhada no exercício de preparação de ambiente. Copiaremos o ID desse emulador, por exemplo Pixel_API_28, e executaremos flutter emulators --launch <emulator id>, preenchendo o espaço adequado com o ID, para subirmos o emulador. Também é possível criar um emulador com o comando flutter emulators --create [ --name xyz], mas essa opção faz algumas configurações automáticas que podem não ser interessantes no momento.

Seguindo com a execução, pode ser que a tarefa de subir o emulador demore mais ou menos a depender do seu computador, porque é uma ação que exige bastante da máquina. Por isso, antes de começar o curso, é importante conferir se o computador atende a alguns pré-requisitos e ter certeza de que será possível realizar as atividades necessárias.

Com o emulador rodando, executaremos flutter run no Prompt. Agora, será indicado que ele estará rodando dentro do dispositivo Android e o ambiente será preparado para executar todas as tarefas dentro do ambiente Android (da mesma forma que aconteceria para rodar em um ambiente iOS). Isso também pode demorar um pouco, a depender da sua conexão de internet e do seu computador, pois podem existir algumas pendências para baixar ou resolver.

Algum tempo depois da execução, o Flutter conseguirá nos mostrar dentro do emulador o aplicativo inicial gerado, intitulado "Flutter Demo Home Page". O aplicativo possui um botão + e um contador que indica quantas vezes ele foi pressionado. Terminada essa etapa, já podemos acessar o nosso projeto utilizando algum tipo de editor.

Esses foram os primeiros passos com o Flutter, e é dessa maneira que criamos o projeto e executamos o Flutter utilizando o aplicativo do Prompt de Comando. Nossa próxima etapa será abrir o projeto em um editor (ou IDE), no caso o IntelliJ, para executarmos e começarmos a alterar o código.







Nesta aula, aprendemos:

O que é o Flutter;
Como instalar e preparar o ambiente para o Flutter;
Criar e executar o primeiro projeto;
Abrir o projeto no IntelliJ, editar o código e executá-lo;
O que são Widgets e como funciona a estrutura para criar layouts no Flutter.