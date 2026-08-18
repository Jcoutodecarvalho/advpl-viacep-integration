#Include "TOTVS.ch"

/*/{Protheus.doc} ExViaCEP
Exemplo de utilizacao da integracao com a API ViaCEP.

Demonstra como chamar U_ZViaCEP(), interpretar
o retorno estruturado da consulta e apresentar
mensagens amigaveis ao usuario.

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
        MsgStop(MensagemErro(aRetorno[2]), "Consulta ViaCEP")
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


// Converte os codigos tecnicos em mensagens amigaveis ao usuario
Static Function MensagemErro(cCodigo)

    Local cMensagem := ""

    Do Case

        Case cCodigo == "CEP_VAZIO"
            cMensagem := "Informe um CEP para realizar a consulta."

        Case cCodigo == "CEP_TAMANHO_INVALIDO"
            cMensagem := "O CEP deve possuir exatamente 8 digitos."

        Case cCodigo == "CEP_DEVE_CONTER_APENAS_NUMEROS"
            cMensagem := "O CEP deve conter apenas numeros."

        Case cCodigo == "CEP_NAO_ENCONTRADO"
            cMensagem := "CEP nao encontrado. Verifique o numero informado."

        Case cCodigo == "ERRO_JSON"
            cMensagem := "Nao foi possivel processar a resposta da API ViaCEP."

        Otherwise
            cMensagem := "Ocorreu um erro nao identificado durante a consulta."

    EndCase

Return cMensagem