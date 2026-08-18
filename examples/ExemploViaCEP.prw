#Include "TOTVS.ch"

/*/{Protheus.doc} ExViaCEP
Exemplo de utilizacao da integracao com a API ViaCEP.

Demonstra como chamar U_ZViaCEP() e interpretar
o retorno estruturado da consulta.

@author Jhonatan Carvalho
@since 17/08/2026
/*/

User Function ExViaCEP()

    Local aRetorno  := {}
    Local aEndereco := {}
    Local cCEP      := "01001000"

    // Realiza a consulta
    aRetorno := U_ZViaCEP(cCEP)

    // Verifica se a consulta foi realizada com sucesso
    If !aRetorno[1]
        MsgStop(aRetorno[2], "Consulta ViaCEP")
        Return
    EndIf

    // Recupera os dados do endereco
    aEndereco := aRetorno[3]

    MsgInfo(;
        "CEP: "        + aEndereco[1][2] + CRLF +;
        "Logradouro: " + aEndereco[2][2] + CRLF +;
        "Bairro: "     + aEndereco[3][2] + CRLF +;
        "Cidade: "     + aEndereco[4][2] + CRLF +;
        "UF: "         + aEndereco[5][2],;
        "Endereco encontrado";
    )

Return