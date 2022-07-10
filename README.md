# migu

Migu é uma plataforma que usa AI para ajudar a equipe de People & Culture a criar um programa de buddies para acolher e integrar novos funcionários.

![image](asset/logobranca.png)

## Funcionalidades no Protótipo

O protótipo possui como principal função mostrar como seria a visão do uso da ferramenta e demonstrar algumas funcionalidades. Atualmente são executadas as seguintes funcionalidades:

- Visualização dos funcionários que ainda não responderam o formulário
- Visualização das monitorias ativas
- Visualização das melhores sugestões para mentor (mockado)
- Adicionar novo funcionário na empresa (mockado)

## Implementação e Próximos Passos

O projeto foi implementado com o framework flutter e integrado com o banco de dados a partir do serviço Firestore. Para os próximos passos estão mapeados os seguintes pontos:

- Envio de arquivo .csv pela plataforma
  - Já existe a lógica presente no cliente, necessitando apenas a criação da interface do usuário e a integração com o backend
- Integração com o modelo de aprendizado de máquina
  - O modelo já está criado, sendo necessário apenas subir uma api simples utilizando o framework Flask
- Desenvolvimento do dashboard (não priorizado para o protótipo durante o hackathon)

## Exploração dos Dados e Geração do Modelo

## Como rodar?

Para executar o projeto pode ser executado os seguintes comandos em uma instância com o framework flutter já configurado:
- flutter pub get
- flutter run

Outra alternativa é acessar o link: https://migu-ods.web.app

Observação: como ainda não foi implementado o envio de arquivo .csv pela plataforma, não há muita possibilidade de interação com o site (sendo possível editar os dados apenas pelo banco de dados diretamente), desse modo, o protótipo age como uma demonstração da visão do operador.