#Include "TOTVS.ch"

/*/{Protheus.doc} ZViaCEP
Consulta informações de endereço através da API ViaCEP.

@param cCEP, Character, CEP que será consultado
@return Array, Dados do endereço encontrado

@author Jhonatan Carvalho
@since 16/08/2026
/*/

User Function ZViaCEP(cCEP)

    Local cURL     := ""
    Local cRetorno := ""
    Local cErroJson := ""
    Local oJson    := JsonObject():New()
   
    // Remove caracteres desnecessarios
    cCEP := StrTran(cCEP, "-", "")
    cCEP := StrTran(cCEP, " ", "")

    // Valida quantidade de caracteres
    If Len(cCEP) <> 8
        Return "ERRO: CEP deve possuir 8 caracteres."
    EndIf

    // Valida se o CEP possui apenas numeros
    If !IsDigit(cCEP)
        Return "ERRO: CEP deve conter apenas numeros."
    EndIf

    // Monta a URL da API
    cURL := "https://viacep.com.br/ws/" + cCEP + "/json/"

    // Realiza a requisição HTTP GET
    cRetorno := HttpGet(cURL)

    // Converte a resposta da API para um objeto JSON
    cErroJson := oJson:FromJson(cRetorno)

    If !Empty(cErroJson)
        Return "ERRO: Não foi possível interpretar a resposta da API."
    EndIf

    Return cRetorno
