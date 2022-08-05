*** Settings ***
Documentation   Page Object file for Windows page
Library     SeleniumLibrary

*** Variables ***
${link_click_here} =   link:Click Here

*** Keywords ***
Click Link Click Here
    [Documentation]     Keyword to click link Click Here
    Click Link    ${link_click_here}