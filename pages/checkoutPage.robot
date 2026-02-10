*** Settings ***
Library    SeleniumLibrary
Resource    ../vars/vars.robot

*** Keywords ***
Remplir Informations Client
    [Arguments]    ${prenom}    ${nom}    ${cp}
    Input Text     ${champ_prenom}     ${prenom}
    Input Text     ${champ_nom}      ${nom}
    Input Text     ${champ_cp}    ${cp}
    Click Button   ${continue-btn}

Finaliser Et Vérifier Confirmation
    Click Button              ${finish-btn}
    Wait Until Page Contains  Thank you for your order!
    Element Should Be Visible  ${ty4yourorder}    
