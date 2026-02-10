*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://the-internet.herokuapp.com/dynamic_loading/1
${url2}    https://the-internet.herokuapp.com/iframe
${url3}    https://the-internet.herokuapp.com/login
${valid_user}    tomsmith
${valid_pwd}    SuperSecretPassword!


*** Keywords ***
Ouvrir nav sur LoginPage
    Open Browser    ${url2}
Login Avec Jeu De Donnees
    [Arguments]    ${username}    ${password}    ${rt_attendu}
    Input Text       id:username    ${username}
    Input Text       id:password    ${password}
    Click Button     class:radius
    
    IF    "${rt_attendu}" == "Pass"
        Page Should Contain    You logged into a secure area!
    ELSE
        Page Should Contain    Your username is invalid!
    END


*** Test Cases ***
TP robotframework
# Spinner de chargement OK
    Open Browser    ${url}    chrome
    Click Button    //*[@id="start"]/button
    Page Should Contain Element    //*[@id="finish"]/h4
# Interaction avec les iframes / récupération et vérification d'un texte
    Open Browser    ${url2}
# Je ne peux pas faire le frame donc je vais changer d'exercice
# Exécuter un test de login avec plusieurs jeux de données
    Open Browser    ${url3}
    Maximize Browser Window

# Tests du Login    username        password        rt
    Login valide    ${valid_user}    ${valid_pwd}    Pass
    Login invalide    invalid_us    ${valid_pwd}    Fail
    Pwd invalide    ${valid_user}    invalid_pwd    Fail
    [Template]    Login Avec Jeu De Donnees




