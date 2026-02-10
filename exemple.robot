*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL1}    https://www.saucedemo.com/



*** Test Cases ***
Test de connexion OK
    connexion    standard_user    secret-sauce
    


*** Keywords ***
connexion
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL1}    chrome
    Input Text    id:user-name    ${username}
    Input Text    id:password    ${password}
    Click Button    id=login-button    