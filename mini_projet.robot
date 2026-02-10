*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com
${bw}    chrome
${input_user}    id:user-name
${input_pwd}    id:password
${btn_login}    id:login-button
${error_msg}    xpath://h3[@data-test='error']
${title_products}    class:title

*** Keywords ***
Ouvrir Saucedemo
    Open Browser    ${url}    ${bw}
    Maximize Browser Window

Login Saucedemo
    [Arguments]    ${username}    ${password}
    Input Text    ${input_user}    ${username}
    Input Text    ${input_pwd}    ${password}
    Click Button    ${btn_login}

Verif Connexion réussie
    Element Text Should Be    ${title_products} Products

Verif Message Erreur
    Element Should Be Visible    ${error_msg}


*** Test Cases ***
Ouvrir Saucedemo    