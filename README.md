# ADVPL ViaCEP Integration

Projeto de portfólio desenvolvido em ADVPL para demonstrar habilidades em integração de sistemas, consumo de APIs REST, tratamento de respostas JSON e validação de dados no ecossistema TOTVS Protheus.

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

## Funcionalidades

- Validação de CEP informado pelo usuário
- Consumo da API pública ViaCEP
- Conversão de resposta JSON para estrutura ADVPL
- Tratamento de CEP inexistente
- Tratamento de erros de conversão JSON
- Exemplo de utilização da integração

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
## Estrutura do projeto

```text
advpl-viacep-integration
│
├── src
│   └── ZViaCEP.prw
│
├── examples
│   └── ExemploViaCEP.prw
│
├── docs
│
├── .gitignore
│
└── README.md
```

## Exemplo de utilização

A função principal pode ser chamada através de `U_ZViaCEP()`.

```advpl
aRetorno := U_ZViaCEP("01001000")
```

O retorno segue a estrutura:

```text
{
    sucesso,
    mensagem,
    dados
}
```

### Retorno de sucesso

```text
{
    .T.,
    "",
    {
        {"cep", "01001-000"},
        {"logradouro", "Praça da Sé"},
        {"bairro", "Sé"},
        {"cidade", "São Paulo"},
        {"uf", "SP"}
    }
}
```

### Retorno de erro

```text
{
    .F.,
    "CEP nao encontrado.",
    {}
}
```

## Aprendizados

Durante o desenvolvimento deste projeto foram praticados conceitos de:

- ADVPL
- Consumo de APIs REST
- Tratamento de respostas JSON
- Validação de dados
- Estruturação e refatoração de funções
- Tratamento de erros
- Git
- GitHub
- Documentação técnica

## Autor

Jhonatan Carvalho

- Analista de Sistemas Pleno
- QA Manual
- Estudante de Automação de Testes
- Desenvolvedor ADVPL em evolução