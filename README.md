#Flutter Introduction

### Reference Documentation

* [Objetivos](#Objetivos)


* [Grooming](#Grooming)


* [Sistema](#Sistema)


* [Premissas](#Premissas)


* [Estrutura de Packages / Padrão nomeclatura arquivos](#)


* [Padrão de logs](#Padrãodelogs)


* [Link's reference](#Link'sreference)

* [Final Component's](#FinalComponents)


## Objetivos


Abordar os conteudos: Flutter e Design Pattern's na prática


## Grooming


O termo se refere à preparação de backlog  (que são os requisitos ou lista de pendências) e é mais adequadamente conhecido como refinamento. É o ato de detalhar, entender mais profundamente, adicionar características, estimar, priorizar e manter o backlog do produto vivo.


##### Sistema

                    FluterApp

    [Linguagem]                  Dart

    [Kit Deployment]             Flutter

    [Components]                 Material


###### Premissas


    Criar formulários;

    Implementar navegação;

    Dashboard;

    Integrar com API REST; [GET, POST, PUT, DELETE]



###### Ações


    1. Criar usuario                    POST localhost:8080/v1/user        
    2. Buscar usuario                   GET  localhost:8080/v1/user
    3. Alterar dados usuario            PUT  localhost:8080/v1/user
    4. Bloquear / Desbloquear usuario   PUT  localhost:8080/v1/user



###### Cenarios

###### Integrações 

    CleanArchitectureExample



#### Banco de Dados

        N/A



#### Estrutura de Packages / Padrão nomeclatura arquivos


        Router:
            Factory:
                RouterFactory -> Classe responsável por agrupar as navegações;
            Config
                RouterAssetConfig -> Bean responsavel pela config do Router;


        Components:            
                AbstractGridView -> Componente abstratos de GridView;            
                AbstractListAllImage -> Componente abstratos de List;   
                AbstractFieldInput -> Componente abstratos de input;   
                Loading -> Componente de Loading;   
                ButtonSelected -> Componente para botão de seleção;   
                ButtonSelectedDomain -> Componente para botão de seleção através de dominio;   
                CenteredMessage -> Componente para exibição de mensagem;   


        Screen:
                ScreenUserListAllStateful -> Classe responsável por renderizar a tela;
                ScreenUserDetailStateful -> Classe responsável por renderizar a tela;


        Models: 
            Domain:
                User -> Objeto de entidade;                
            
            DTO:
                RequestPostUserEntity -> Objeto de request para integrações
                ResponseGetUserEntity -> Objeto de retorno de request para integrações


        Http:
            Helper:
                AbstractWebClient -> Abstração para webclient's
                LoggingInterceptor -> Interceptor de requisições;

            Webclient's:
                WebClientUser -> Classe responsável realizar requisição HTTP



   



#### Padrão de logs

        HTTP

        @override
        Future<RequestData> interceptRequest({required RequestData data}) async {
        print("Request");
        print("url: ${data.url}");
        print("headers: ${data.headers}");
        print("body: ${data.body}");
        return data;
        }
        
        @override
        Future<ResponseData> interceptResponse({required ResponseData data}) async {
        print("Response");
        print("status code: ${data.statusCode}");
        print("body: ${data.body}");
        return data;
        }


#### Link's reference

        Flutter                 

        Componentens            

        Dashboard               

        GridView               

        Settings               


#### Personas






### Final Components


#### Form


#### Dashboard


#### List


#### GridView


#### Button


#### Input


#### Dialog


#### Loading


#### 





