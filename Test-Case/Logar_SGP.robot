*** Settings ***

Library         SeleniumLibrary
Resource        ../resource/resource.robot
Resource        ../resource/page/Login_SGP.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Case ***
Cenário 1: Logar na aplicação SGP
    Dado que estou na pagina de login
    Quando preencho os campos de login e senha
    Então é exibido o usuario "sgp1", nivel "NIVEL_1" e cabecalho "RCHLO SGP (Sistema de Gestão de Preços)"
