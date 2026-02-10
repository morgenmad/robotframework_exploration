*** Settings ***
Library    SeleniumLibrary
Resource    ../vars/vars.robot

*** Keywords ***

Vérifier Page Produits Affiche
    Element Text Should Be    ${product_title}    Products

Cliquer Sur Add To Cart
    Click Button    ${add_to_cart_btn}

Vérifier Panier Contient
    [Arguments]    ${quantite}
    Element Text Should Be    ${cart_badge}    ${quantite}        