# migu

Migu é uma plataforma que usa AI para ajudar a equipe de People & Culture a criar um programa de buddies para acolher e integrar novos funcionários.

![image](asset/logo2.png)

## Funcionalidades no Protótipo

O protótipo possui como principal função mostrar como seria a visão do uso da ferramenta e demonstrar algumas funcionalidades. Atualmente são executadas as seguintes funcionalidades:

- Visualização dos funcionários que ainda não responderam o formulário
- Visualização das monitorias ativas
- Visualização das melhores sugestões para mentor (mockado)
- Adicionar novo funcionário na empresa (mockado)

<img width="1785" alt="image" src="https://user-images.githubusercontent.com/37855969/178153025-3c50178b-0869-4393-be9c-21f9eeb8f1a6.png">

## Implementação e Próximos Passos

O projeto foi implementado com o framework flutter e integrado com o banco de dados a partir do serviço Firestore. Para os próximos passos estão mapeados os seguintes pontos:

- Envio de arquivo .csv pela plataforma
  - Já existe a lógica presente no cliente, necessitando apenas a criação da interface do usuário e a integração com o backend
- Integração com o modelo de aprendizado de máquina
  - O modelo já está criado, sendo necessário apenas subir uma api simples utilizando o framework Flask
- Desenvolvimento do dashboard (não priorizado para o protótipo durante o hackathon)

<img width="1263" alt="image" src="https://user-images.githubusercontent.com/37855969/178153596-766c9c58-6609-4811-9b29-c952dfdbe932.png">


## Exploração dos Dados e Geração do Modelo

Para a exploração dos dados e geração do modelo de ML, nós utilizamos um dataset público e, para fins de teste, construímos um dataset anonimizado a partir dos participantes do Hackathon Virada ODS 2022.

<img width="823" alt="image" src="https://user-images.githubusercontent.com/37855969/178153302-9b8a662b-76c1-4ecf-84cc-b403e542fa70.png">


É possível ver a análise dos dados a partir dos notebooks:

https://github.com/AlexandreOkita/migu-ods/blob/main/experimental_kmeans.ipynb
https://github.com/AlexandreOkita/migu-ods/blob/main/migo.ipynb

Como resultado final  nós conseguimos um Silhouette Coefficient de *0.708*, valor que julgamos muito bom para um base de dados de 50 entradas.

![image](https://user-images.githubusercontent.com/37855969/178153185-738e6837-b354-4046-a716-2694727b7bad.png)



## Como rodar?

Para executar o projeto pode ser executado os seguintes comandos em uma instância com o framework flutter já configurado:
- flutter pub get
- flutter run

Outra alternativa é acessar o link: https://migu-ods.web.app

Observação: como ainda não foi implementado o envio de arquivo .csv pela plataforma, não há muita possibilidade de interação com o site (sendo possível editar os dados apenas pelo banco de dados diretamente), desse modo, o protótipo age como uma demonstração da visão do operador.
