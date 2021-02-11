*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}      Chrome

*** Keywords ***
Abrir navegador
        Open browser            url: blank  ${BROWSER}   
        Maximize browser window 

Fechar navegador
        Capture Page Screenshot
        Close browser


