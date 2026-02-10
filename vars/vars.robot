*** Settings ***
Library    SeleniumLibrary

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
${finish-btn}    //*[@id="finish"]
${ty4yourorder}       class:complete-header