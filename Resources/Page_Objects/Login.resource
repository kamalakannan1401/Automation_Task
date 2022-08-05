*** Settings ***
Documentation   Page Object file for Form Authentication page
Library     SeleniumLibrary

*** Variables ***
${login_info_header} =     class:subheader
${txtbox_username} =   id:username
${txtbox_password} =   id:password
${button_login} =   xpath://*[contains(@class,'sign-in')]//parent::button
${message} =   xpath://*[contains(@id,'messages')]//child::*[@data-alert]

*** Keywords ***
Get Login Info Text
    [Documentation]     Keyword to get login info from header
    ${login_info_text} =     Get Text    ${login_info_header}
    [Return]    ${login_info_text}

Set Username
    [Documentation]     Keyword to set username
    [Arguments]     ${username}
    Input Text    ${txtbox_username}    ${username}

Set Password
    [Documentation]     Keyword to set password
    [Arguments]     ${password}
    Input Password     ${txtbox_password}    ${password}
    
Click Login Button
    [Documentation]     Keyword to click Login button
    Click Button    ${button_login}