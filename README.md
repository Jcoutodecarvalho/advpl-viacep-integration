# ADVPL ViaCEP Integration

Projeto de portfólio desenvolvido em ADVPL para demonstrar conhecimentos em integração de sistemas, consumo de APIs REST, tratamento de respostas JSON e validação de dados no ecossistema TOTVS Protheus.

A solução realiza consultas de CEP por meio da API pública ViaCEP, retornando informações de endereço que podem ser utilizadas em processos de cadastro e atualização de dados.

Os conceitos aplicados neste projeto foram inspirados em experiências práticas adquiridas durante minha atuação com ERP TOTVS Protheus, sendo adaptados e reconstruídos para fins de estudo, demonstração técnica e portfólio.

## Objetivo

Realizar consultas de endereço a partir de um CEP informado pelo usuário, consumindo a API pública ViaCEP e tratando os dados retornados em formato JSON.

## Tecnologias

- ADVPL
- TOTVS Protheus
- API REST
- ViaCEP
- JSON
- Git
- GitHub

## Fluxo da aplicação

```text
CEP informado
     ↓
Validação do CEP
     ↓
Montagem da URL
     ↓
Requisição HTTP GET
     ↓
API ViaCEP
     ↓
Resposta JSON
     ↓
Tratamento dos dados
     ↓
Dados do endereço
```
