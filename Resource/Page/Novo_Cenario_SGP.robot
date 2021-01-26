*** Settings ***
Library     SeleniumLibrary
Resource    Login_SGP.robot

*** Variables ***
${NOVO_CENARIO}          xpath=//*[contains(text(), "Novo Cenário")]
${ABA_DEPARTAMENTO}      xpath=//*[@id="ui-tabpanel-2-label"]/span
${SELECT_DEPARTAMENTO}   xpath=//*[@id="ui-tabpanel-2"]/p-dataview/div/div[1]/p-header/div/div/div/div/input
${CLICK_DEPARTAMENTO}    xpath=//*[@class="ui-g-1"]
${ABA_FILTRO}            xpath=//html/body/app-root/div/div/app-novo-cenario/p-tabview/div/ul/li[3]
${ABA_SIMULAÇÃO}         xpath=//*[contains(text(), "Simulação")]
                                     
*** Keywords ***
Dado que estou na tela de novo cenário
    Login_SGP.Dado que estou na pagina de login
    Login_SGP.Quando preencho os campos de login e senha
    Login_SGP.Então é exibido o usuario "sgp1", nivel "NIVEL_1" e cabecalho "RCHLO SGP (Sistema de Gestão de Preços)"
    Click Element   ${NOVO_CENARIO}
    Capture Page Screenshot

Quando seleciono as informações do departamento
    Click Element   ${ABA_DEPARTAMENTO}
    Input Text      ${SELECT_DEPARTAMENTO}          220
    Click Element   ${CLICK_DEPARTAMENTO}
    Capture Page Screenshot

E seleciono as informações de filtros
    Set Browser Implicit Wait     30 
    Click Element   ${ABA_FILTRO} 
    Capture Page Screenshot

E executo a simulação
    Sleep      20   
    Click Element   ${ABA_SIMULAÇÃO}
    Capture Page Screenshot

#Então o cenário é criado


