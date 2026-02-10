*** Settings ***
Library          SeleniumLibrary
Test Setup       Ouvrir Navigateur Et Aller Sur Saucedemo
Test Teardown    Close Browser

*** Variables ***
${URL}                  https://www.saucedemo.com 
${bw}              chrome
${user_valide}           standard_user
${pwd_valide}            secret_sauce

${champ_username}       id:user-name
${champ_pwd}       id:password
${login-btn}         id:login-button
${product_title}        class:title
${msg_err}        xpath://h3[@data-test='error']
${add_to_cart_btn}      id:add-to-cart-sauce-labs-backpack
${cart_badge}           class:shopping_cart_badge
${cart_link}            class:shopping_cart_link
${checkout-btn}         id:checkout
${champ_prenom}     id:first-name
${champ_nom}      id:last-name
${champ_cp}    id:postal-code
${continue-btn}         id:continue
${finish-btn}           id:finish
${ty4yourorder}       class:complete-header

*** Test Cases ***
Scénario 1 : Connexion Valide
    Saisir Identifiants    ${user_valide}    ${pwd_valide}
    Vérifier Page Produits Affiche

Scénario 2 : Connexion Invalide
    Saisir Identifiants    ${user_valide}    mauvais_mdp
    Vérifier Message Erreur Affiche

Scénario 3 : Ajout d'un Produit Au Panier
    Saisir Identifiants    ${user_valide}    ${pwd_valide} 
    Cliquer Sur Add To Cart
    Vérifier Panier Contient    1

Scénario 4 : Finalisation de Commande
    Saisir Identifiants    ${user_valide}    ${pwd_valide}
    Cliquer Sur Add To Cart
    Aller Au Checkout
    Remplir Informations Client    Test    Test    75000
    Finaliser Et Vérifier Confirmation

*** Keywords ***
Ouvrir Navigateur Et Aller Sur SauceDemo
    Open Browser    ${URL}    ${bw}
    Maximize Browser Window

Saisir Identifiants
    [Arguments]    ${username}    ${password}
    Input Text     ${champ_username}    ${username}
    Input Text     ${champ_pwd}    ${password}
    Click Button   ${login-btn}

Vérifier Page Produits Affiche
    Element Text Should Be    ${product_title}    Products

Vérifier Message Erreur Affiche
    Element Should Be Visible    ${msg_err}

Cliquer Sur Add To Cart
    Click Button    ${add_to_cart_btn}

Vérifier Panier Contient
    [Arguments]    ${quantite}
    Element Text Should Be    ${cart_badge}    ${quantite}

Aller Au Checkout
    Click Element    ${cart_link}
    Click Button     ${checkout-btn}

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