*** Settings ***
Library    SeleniumLibrary
Resource    ../vars/vars.robot

*** Keywords ***
Aller Au Checkout
    Click Element    ${cart_link}
    Click Button     ${checkout-btn}
