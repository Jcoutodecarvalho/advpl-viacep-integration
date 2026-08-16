# ADVPL ViaCEP Integration

Projeto de portfólio desenvolvido em ADVPL para demonstrar experiência com integrações entre sistemas, consumo de APIs REST, tratamento de respostas JSON e validação de dados no ambiente TOTVS Protheus.

A solução realiza consultas de CEP através da API pública ViaCEP, retornando informações de endereço para utilização em processos cadastrais.

Os conceitos aplicados neste projeto são inspirados em situações reais encontradas durante minha atuação com ERP TOTVS Protheus.

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
