# Casos de Teste - ADVPL ViaCEP Integration

## Objetivo

Validar os principais cenários da integração com a API ViaCEP, garantindo o correto tratamento das entradas, validações e retornos da função `U_ZViaCEP()`.

---

## Escopo

Os casos de teste documentados neste arquivo validam as principais regras implementadas na função `U_ZViaCEP()`, incluindo validações de entrada, tratamento de erros e retorno de sucesso da integração com a API ViaCEP.

---

## Ambiente de Testes

- Linguagem: ADVPL
- Plataforma: TOTVS Protheus
- API utilizada: ViaCEP
- Método HTTP: GET

---

## CT001 - CEP vazio

### Pré-condição

Função `U_ZViaCEP()` disponível para execução.

### Dados de entrada

```text
""
```

### Passos

1. Executar `U_ZViaCEP("")`
2. Capturar o retorno da função

### Resultado esperado

A consulta deve ser rejeitada antes da chamada à API.

### Código esperado

```text
CEP_VAZIO
```

---

## CT002 - CEP com tamanho inválido

### Pré-condição

Função `U_ZViaCEP()` disponível para execução.

### Dados de entrada

```text
1234567
```

### Passos

1. Executar `U_ZViaCEP("1234567")`
2. Capturar o retorno da função

### Resultado esperado

A consulta deve ser rejeitada antes da chamada à API.

### Código esperado

```text
CEP_TAMANHO_INVALIDO
```

---

## CT003 - CEP contendo caracteres não numéricos

### Pré-condição

Função `U_ZViaCEP()` disponível para execução.

### Dados de entrada

```text
ABCD1234
```

### Passos

1. Executar `U_ZViaCEP("ABCD1234")`
2. Capturar o retorno da função

### Resultado esperado

A consulta deve ser rejeitada antes da chamada à API.

### Código esperado

```text
CEP_DEVE_CONTER_APENAS_NUMEROS
```

---

## CT004 - CEP inexistente

### Pré-condição

- Função `U_ZViaCEP()` disponível.
- API ViaCEP acessível.

### Dados de entrada

```text
00000000
```

### Passos

1. Executar `U_ZViaCEP("00000000")`
2. Capturar o retorno da função

### Resultado esperado

A validação local deve ser aprovada.
A API ViaCEP deve ser consultada.
O sistema deve retornar que o CEP não foi encontrado.

### Código esperado

```text
CEP_NAO_ENCONTRADO
```

---

## CT005 - Consulta com CEP válido

### Pré-condição

- Função `U_ZViaCEP()` disponível.
- API ViaCEP acessível.

### Dados de entrada

```text
01001000
```

### Passos

1. Executar `U_ZViaCEP("01001000")`
2. Capturar o retorno da função

### Resultado esperado

A validação deve ser aprovada.
A API ViaCEP deve ser consultada.
Os dados do endereço devem ser retornados com sucesso.

### Código esperado

```text
OK
```

---

## Cobertura dos Testes

Os cenários contemplam:

- Validação de CEP vazio
- Validação de tamanho do CEP
- Validação de caracteres inválidos
- Tratamento de CEP inexistente
- Consulta com retorno de sucesso
- Validação das regras de negócio implementadas na função
- Validação da integração com a API ViaCEP

---

## Considerações

Os testes foram elaborados com foco na validação funcional da integração, cobrindo os principais fluxos positivos e negativos implementados na função `U_ZViaCEP()`.

---

## Versão

Documento criado para a versão **1.0** do projeto **ADVPL ViaCEP Integration**.