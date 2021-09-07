Caso você precise do projeto com todas as alterações realizadas na aula passada, você pode baixá-lo por meio deste link.

Refatore o código do formulário, extraia o Widget para o editor aplicando técnicas para torná-lo genérico.

Nesta extração, considere o uso de parâmetros nomeados e opcionais para entregar uma experiência de uso similar aos Widgets prontos do Flutter. Dessa forma, permita que quem utilizar esse Widget seja capaz de mandar de maneira opcional os atributos para:

Controlador;
Rótulo;
Dica;
Ícone.
Em seguida, utilize o novo Widget enviando os parâmetros esperados com base no campo.

Lembre-se de tratar o ícone para devolver o Widget Icon apenas quando ele não for nulo e devolver null quando ele for. Você pode usar o operador ternário para isso.

Por fim, extraia o código dentro do onPressed para uma função que indica a criação de uma transferência. Então teste o App e veja se apresenta o mesmo aspecto visual de antes.







Integre a lista de transferência com o formulário de transferência. Para isso, modifique a propriedade home do MaterialApp para que abra a lista de transferência.

Em seguida, implemente o onPressed do FloatingActionButton para quando ele for clicado aconteça a navegação para a tela de formulário de transferência.

Para a navegação, utilize a função push() do Navigator enviando como argumento um BuildContext e o Route<T>. Para o Route<T> considere o MaterialPageRoute que é uma implementação do Material Components com o objetivo de facilitar o uso e aplicar algumas propriedades comum no Material Design, como é o caso da transição com animação.

Para o MaterialPageRoute envie o argumento builder que espera um callback que recebe um BuildContext e devolve um Widget. Então, dentro do lambda, retorne o Widget do formulário.

Então, atribua o retorno do push() para a variável do tipo Future<Transferencia>. Com acesso ao future, utilize a função then() que espera um callback que recebe a transferência criada via parâmetro. No escopo da expressão lambda imprima a transferência recebida para testar o comportamento de criação.

No formulário, no momento que a transferência é criada, utilize a função pop() do Navigator enviando o BuildContext e a transferência criada via argumento respectivamente.

Por fim, teste o App e veja se a transferência criada é recebida na lista de transferências.





Modifique o Widget ListaTransferencia para que utilize o ListView ao invés do Column.

Para essa implementação considere o uso da função builder() do ListView que exige a implementação das propriedades:

itemCount: que espera um int para determinar a quantidade de elementos na lista;
itemBuilder: que espera um callback que recebe um BuildContext e int como argumento e devolve um Widget via expressão lambda.
Para implementar ambas as propriedades, primeiro crie a lista de transferências e a use para determinar o tamanho da lista (itemCount) e enviar a transferência, com base no índice do callback do itemBuilder, para o ItemTransferencia.

Por fim, ajuste o código do then() para que no final do seu escopo, a transferência recebida seja adicionar à lista de transferências.

Para testar se a lista dinâmica com o ListView está funcionando, adicione algumas transferências à lista antes de retornar a árvore de Widgets.


Além da navegação que vimos durante o curso que utiliza o push(), é possível também configurar rotas diretamente no MaterialApp e navegar por meio do pushNamed() que recebe a rota como String e entra na tela configurada. Caso tenha interesse em realizar esse tipo de configuração, confira esse tutorial da documentação.







#Nesta aula, aprendemos:

Refatorar Widget para receber argumentos opcionais nomeados;
Navegar entre páginas por meio do Navigator;
Receber informações ao realizar o pop durante a navegação;
Como lidar com o operações assíncronas usando o Future;
Implementar o ListView com o builder;