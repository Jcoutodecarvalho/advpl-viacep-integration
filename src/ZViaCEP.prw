#Include "TOTVS.ch"

/*/{Protheus.doc} ZViaCEP
Consulta informacoes de endereco atraves da API ViaCEP.

@param cCEP, Character, CEP que sera consultado
@return Array, Status da consulta, mensagem e dados do endereco

@author Jhonatan Carvalho
@since 16/08/2026
/*/

User Function ZViaCEP(cCEP)

    Local aRetorno := {}

    cCEP := FormataCEP(cCEP)

    If !ValidaCEP(cCEP)
        Return {.F., "CEP invalido.", {}}
    EndIf

    aRetorno := ConsultaViaCEP(cCEP)

Return aRetorno


Static Function FormataCEP(cCEP)

    cCEP := StrTran(cCEP, "-", "")
    cCEP := StrTran(cCEP, " ", "")

Return cCEP

Static Function ValidaCEP(cCEP)

    If Empty(cCEP)
        Return .F.
    EndIf

    If Len(cCEP) <> 8
        Return .F.
    EndIf

    If !IsDigit(cCEP)
        Return .F.
    EndIf

Return .T.

Static Function ConsultaViaCEP(cCEP)

    Local cURL      := ""
    Local cRetorno  := ""
    Local cErroJson := ""
    Local oJson     := JsonObject():New()
    Local aEndereco := {}

    // Monta a URL da API
    cURL := "https://viacep.com.br/ws/" + cCEP + "/json/"

    // Realiza a requisicao HTTP GET
    cRetorno := HttpGet(cURL)

    // Converte a resposta da API para objeto JSON
    cErroJson := oJson:FromJson(cRetorno)

    If !Empty(cErroJson)
        Return {.F., "Nao foi possivel interpretar a resposta da API.", {}}
    EndIf

    // Verifica se o CEP foi encontrado
    If oJson:GetJsonObject("erro") == .T.
        Return {.F., "CEP nao encontrado.", {}}
    EndIf

    // Monta os dados do endereco
    AAdd(aEndereco, {"cep",        oJson:GetJsonObject("cep")})
    AAdd(aEndereco, {"logradouro", oJson:GetJsonObject("logradouro")})
    AAdd(aEndereco, {"bairro",     oJson:GetJsonObject("bairro")})
    AAdd(aEndereco, {"cidade",     oJson:GetJsonObject("localidade")})
    AAdd(aEndereco, {"uf",         oJson:GetJsonObject("uf")})

Return {.T., "", aEndereco}