*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/cartPage.robot
Resource    ../pages/checkoutPage.robot
Resource    ../pages/loginPage.robot
Resource    ../pages/productPage.robot
Resource    ../vars/vars.robot
Test Setup       Ouvrir Navigateur Et Aller Sur Saucedemo
Test Teardown    Close Browser

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