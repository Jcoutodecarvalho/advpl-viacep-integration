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
- Padronização de códigos de retorno
- Exemplo de utilização da integração
- Documentação de casos de teste

## Fluxo da aplicação

```text
CEP informado
     ↓
Formatação do CEP
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
Conversão do JSON
     ↓
Tratamento dos dados
     ↓
Retorno estruturado
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
│   └── casos-de-teste.md
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

O retorno segue o contrato:

```text
{
    status,
    codigo,
    dados
}
```

Onde:

```text
[1] status -> .T. para sucesso ou .F. para erro
[2] codigo -> código que identifica o resultado da operação
[3] dados  -> dados retornados pela consulta
```

### Retorno de sucesso

```text
{
    .T.,
    "OK",
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

Exemplo de CEP inexistente:

```text
{
    .F.,
    "CEP_NAO_ENCONTRADO",
    {}
}
```

## Códigos de retorno

A integração utiliza códigos padronizados para facilitar o tratamento das respostas.

```text
OK
CEP_VAZIO
CEP_TAMANHO_INVALIDO
CEP_DEVE_CONTER_APENAS_NUMEROS
CEP_NAO_ENCONTRADO
ERRO_JSON
```

## Casos de Teste

Os principais cenários funcionais da integração estão documentados em:

```text
docs/casos-de-teste.md
```

Entre os cenários cobertos estão:

- CEP vazio
- CEP com tamanho inválido
- CEP contendo caracteres não numéricos
- CEP inexistente
- CEP válido

## Aprendizados

Durante o desenvolvimento deste projeto foram praticados conceitos de:

- ADVPL
- Consumo de APIs REST
- Tratamento de respostas JSON
- Validação de dados
- Arrays e estruturas de retorno
- Padronização de códigos de erro
- Estruturação e refatoração de funções
- Tratamento de erros
- Integração entre sistemas
- Testes funcionais
- Criação de casos de teste
- Git
- GitHub
- Documentação técnica

## Autor

Jhonatan Carvalho

- Analista de Sistemas Pleno
- QA Manual
- Estudante de Automação de Testes
- Desenvolvedor ADVPL em evolução