#Include "TOTVS.ch"

/*/{Protheus.doc} ZViaCEP
Consulta informações de endereço através da API ViaCEP.

@param cCEP, Character, CEP que será consultado
@return Array, Dados do endereço encontrado

@author Jhonatan Carvalho
@since 16/08/2026
/*/

User Function ZViaCEP(cCEP)

    Local cURL     := "",0
    Local cRetorno := ""
    Local oJson    := JsonObject():New()

    // Remove caracteres desnecessários
    cCEP := StrTran(cCEP, "-", "")
    cCEP := StrTran(cCEP, " ", "")

    // Valida quantidade de caracteres
    If Len(cCEP) <> 8
        Return "ERRO: CEP deve possuir 8 caracteres."
    EndIf

    // Valida se o CEP possui apenas números
    If !IsDigit(cCEP)
        Return "ERRO: CEP deve conter apenas números."
    EndIf

    // Monta a URL da API
    cURL := "https://viacep.com.br/ws/" + cCEP + "/json/"

    // Realiza a requisição HTTP GET
    cRetorno := HttpGet(cURL)

    // Próximo passo: converter o retorno JSON para objeto

    Return cRetorno
