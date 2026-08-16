# ADVPL ViaCEP Integration

Projeto de estudo e portfólio desenvolvido em ADVPL para demonstrar o consumo de uma API REST pública de consulta de CEP.

## Objetivo

Realizar uma consulta de endereço utilizando um CEP informado pelo usuário, consumindo a API pública ViaCEP e tratando a resposta retornada em JSON.

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