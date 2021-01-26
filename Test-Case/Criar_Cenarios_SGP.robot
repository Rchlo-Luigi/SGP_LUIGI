*** Settings ***

Library         SeleniumLibrary
Resource        ../resource/resource.robot
Resource        ../resource/page/Novo_Cenario_SGP.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Case ***
Cenário 1: Criar Cenário por Departamento
    Dado que estou na tela de novo cenário
    Quando seleciono as informações do departamento
    E seleciono as informações de filtros
    E executo a simulação

    
#Então o cenário é criado

