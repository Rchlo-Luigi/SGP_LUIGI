*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${HOME_URL}                   http://gestaopreco.riachuelo.net/rchlo-demarcacao-angular/static/
${HOME_TITLE_TEXT}            Demarcação
${LOGIN_FIELD_USUARIO}        xpath=//*[@id="user"]          
${LOGIN_FIELD_SENHA}          xpath=//*[@name="pass"]
${LOGIN_BOTTON_ENTER}         xpath=//*[@class="btn rounded-btn"]  
${LOGIN_NUMERO_USUARIO}       xpath=//*[@id="user-display"]/span[1]
${LOGIN_NIVEL_USUARIO}        xpath=//*[@id="user-display"]/span[2]
${HOME_CABECALHO_SGP}         xpath=//*[@class="hidden-sm-up"]

*** Keywords ***
#PRE_CONDIÇÃO
Dado que estou na pagina de login
      Go To        ${HOME_URL}
      Set Browser Implicit Wait     30       
      Title Should Be    ${HOME_TITLE_TEXT}

#ACESSO COM USUÁRIO VÁLIDO
Quando preencho os campos de login e senha
      Input Text        ${LOGIN_FIELD_USUARIO}     sgp1
      Input Password    ${LOGIN_FIELD_SENHA}       @Riachu01
      Click Button      ${LOGIN_BOTTON_ENTER}   

#CONFIRMAÇÃO USUÁRIO, NÍVEL E DADOS DE CABEÇALHO
Então é exibido o usuario "${user}", nivel "${nivel}" e cabecalho "${titulo}"
      Set Browser Implicit Wait       30
      Element Should Be Visible       ${LOGIN_NUMERO_USUARIO}     ${user}
      Element Should Be Visible       ${LOGIN_NIVEL_USUARIO}      ${nivel}
      Element Should Be Visible       ${HOME_CABECALHO_SGP}       ${titulo}