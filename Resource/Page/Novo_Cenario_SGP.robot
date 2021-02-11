*** Settings ***
Library     SeleniumLibrary
Resource    Login_SGP.robot

*** Variables ***
${NOVO_CENARIO}          xpath=//*[contains(text(), "Novo Cenário")]
${ABA_DEPARTAMENTO}      xpath=//*[@id="ui-tabpanel-2-label"]/span
${SELECT_DEPARTAMENTO}   xpath=//*[@id="ui-tabpanel-2"]/p-dataview/div/div[1]/p-header/div/div/div/div/input
${CLICK_DEPARTAMENTO}    xpath=//*[@class="ui-g-1"]
${ABA_FILTRO}            xpath=//html/body/app-root/div/div/app-novo-cenario/p-tabview/div/ul/li[3]
${FILTRO_PAGINACAO}      xpath=(//*[@type="search"])[2]
${ABA_SIMULAÇÃO}         xpath=//*[contains(text(), "Simulação")]
${ABA_PROPRIEDADE}       xpath=//*[contains(text(), "Propriedades")]
${NOME_CENÁRIO}          xpath=//*[@formcontrolname="nomeCenario"]
${BOX_DROPDOWNN}         xpath=(//*[@class="ui-dropdown-trigger-icon ui-clickable pi pi-chevron-down"])[5]
${FAIXA1}                xpath=(//*[text()="Faixa 1"])[2]
${BOTAO_SALVAR}          xpath=(//*[contains(text(),"Salvar")])[2]

                                     
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
    Set Browser Implicit Wait     20 
    Capture Page Screenshot

E seleciono as informações de filtros
    Click Element   ${ABA_FILTRO} 
    Set Browser Implicit Wait     10 
    Capture Page Screenshot

E executo a simulação
    #Wait Until Element Is Visible     ${FILTRO_PAGINACAO}    10
    sleep    10 
    Click Element                     ${ABA_SIMULAÇÃO}
    Wait Until Element Is Visible     ${BOX_DROPDOWNN}       10   
    Capture Page Screenshot

Então o cenário é criado
    Click Element                    ${ABA_PROPRIEDADE}
    Input Text                       ${NOME_CENÁRIO}      LUIGI_TESTE_DEMARCAÇÃO
    Scroll Element Into View         ${BOTAO_SALVAR} 
    Click Element                    ${BOX_DROPDOWNN}
    Wait Until Element Is Visible    ${FAIXA1}        10 
    Click Element                    ${FAIXA1}     
    
    
