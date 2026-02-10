*** Settings ***
Library    SeleniumLibrary
Resource    ../vars/vars.robot

*** Keywords ***
Ouvrir Navigateur Et Aller Sur SauceDemo
    Open Browser    ${URL}    ${bw}
    Maximize Browser Window

Saisir Identifiants
    [Arguments]    ${username}    ${password}
    Input Text     ${champ_username}    ${username}
    Input Text     ${champ_pwd}    ${password}
    Click Button   ${login-btn}

Vérifier Message Erreur Affiche
    Element Should Be Visible    ${msg_err}    