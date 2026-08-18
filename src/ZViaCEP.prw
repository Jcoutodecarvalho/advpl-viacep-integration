#Include "TOTVS.ch"

/*/{Protheus.doc} ZViaCEP
Consulta informações de endereço através da API ViaCEP.

@param cCEP, Character, CEP que será consultado
@return Character, Resposta JSON retornada pela API ViaCEP

@author Jhonatan Carvalho
@since 16/08/2026
/*/

User Function ZViaCEP(cCEP)

    Local cRetorno := ""

    cCEP := FormataCEP(cCEP)

    If !ValidaCEP(cCEP)
        Return "ERRO: CEP invalido."
    EndIf

    cRetorno := ConsultaViaCEP(cCEP)

Return cRetorno


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

    // Monta a URL da API
    cURL := "https://viacep.com.br/ws/" + cCEP + "/json/"

    // Realiza a requisicao HTTP GET
    cRetorno := HttpGet(cURL)

    // Converte a resposta da API para um objeto JSON
    cErroJson := oJson:FromJson(cRetorno)

    If !Empty(cErroJson)
        Return "ERRO: Nao foi possivel interpretar a resposta da API."
    EndIf

    // Verifica se o ViaCEP informou que o CEP nao existe
    If oJson:GetJsonObject("erro") == .T.
        Return "ERRO: CEP nao encontrado."
    EndIf

Return cRetorno
