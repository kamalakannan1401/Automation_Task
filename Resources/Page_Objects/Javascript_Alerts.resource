*** Settings ***
Documentation   Page Object file for Javascript Alerts page
Library    SeleniumLibrary

*** Variables ***
${button_js_confirm} =     xpath://button[text()='Click for JS Confirm']
${result} =     id:result

*** Keywords ***
Click JS Confirm Button
    [Documentation]     Keyword to click JS Confirm button
    Click Button    ${button_js_confirm}