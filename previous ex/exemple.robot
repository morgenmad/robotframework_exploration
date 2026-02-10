*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL1}    https://www.saucedemo.com/



*** Test Cases ***
Test de connexion OK
    connexion    standard_user    secret-sauce
    vérifier que la page 'Product' s'affiche après la connexion
    


*** Keywords ***
connexion
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL1}    chrome
    Input Text    id:user-name    ${username}
    Input Text    id:password    ${password}
    Click Element    id:login-button
    
       

vérifier que la page 'Product' s'affiche après la connexion
    Page Should Contain    Swag Labs
    
