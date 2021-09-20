O que aprendemos nesta aula:

Implementar feedback de envio ao enviar transferências;
Realizar pós execução ao finalizar o Future.




Parabéns, chegamos ao final de mais um treinamento de Flutter com Web API! Durante esse curso, aprendemos novas técnicas relacionadas a uma comunicação entre um aplicativo e um serviço externo. Aproveitaremos esse momento de conclusão para revermos o que foi feito nesse processo.

Iniciamos com um aplicativo já implementado e fazendo a comunicação com a Web API. Porém, a solução inicial para a funcionalidade de enviar transferências era bastante crua, ou seja, não mantinha cuidados comuns no dia a dia, como solicitar uma autenticação.

Sendo assim, nosso primeiro objetivo foi justamente adicionar uma lógica de autenticação, algo que fizemos por meio de um dialog que solicita ao usuário uma senha. Com isso, ganhamos a capacidade de utilizar algum tipo de dialog sempre que desejarmos exibir uma nova tela sem sobrepor totalmente a tela principal.

Também aprendemos a fazer as configurações principais de um dialog, personalizando o campo de texto e os botões de modo a torná-lo mais compatível com o comportamento desejado. Durante a implementação, nos deparamos com diversas situações problemáticas que envolvem o fluxo de navegação do usuário, como a inserção de uma senha inválida.

Nesse cenário, percebemos a importância de tratar esses possíveis problemas, sejam eles específicos ou genéricos. Com base na interface do Future, tivemos acesso ao método catchError(), que nos permitiu coletar os erros na aplicação e elaborar maneiras de agir e notificar o usuário adequadamente. No caso da falha de autenticação, por exemplo, utilizamos um dialog para enviarmos a mensagem "authentication failed".

Por fim, incluímos também na criação de transferências um componente de progresso, notificando o usuário de que uma ação está sendo executada, e uma mensagem de sucesso que indica a finalização desse processo. Assim, construímos um fluxo bastante natural para esse tipo de aplicativo.

Foram diversos conteúdos relacionados ao tratamento que é feito após a implementação de uma comunicação externa, e esperamos que você tire proveito das técnicas aproveitas. Bons estudos e até a próxima!