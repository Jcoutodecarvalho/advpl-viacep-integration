#Include "TOTVS.ch"

/*/{Protheus.doc} ZViaCEP
Consulta informações de endereço através da API ViaCEP.

@param cCEP, Character, CEP que será consultado
@return Array, Dados do endereço encontrado

@author Jhonatan Carvalho
@since 16/08/2026
/*/

User Function ZViaCEP(cCEP)

    Local aEndereco := {}

    
    cCEP := StrTran(cCEP, "-", "")                          // Remove caracteres que não precisamos
    cCEP := StrTran(cCEP, " ", "")                          // Remove caracteres que não precisamos

    
    If Len(cCEP) <> 8                                          // Valida quantidade de caracteres
        Return {"ERRO", "CEP deve possuir 8 caracteres."}
    EndIf

    If !IsDigit(cCEP)                                          // Valida se o CEP possui apenas números
        Return {"ERRO", "CEP deve conter apenas números."}
    EndIf

    Return aEndereco