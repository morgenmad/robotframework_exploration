*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL1}    https://www.saucedemo.com/



*** Test Cases ***
Exemple Test
    Open Browser    ${URL1}    chrome


*** Keywords ***
