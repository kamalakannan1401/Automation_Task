*** Settings ***
Documentation   Resource file hold keywords related to Multiple Windows
Resource    ../../Page_Objects/Windows.resource
Library   SeleniumLibrary
Variables   ../../../Variables/global_config_web.py

*** Keywords ***
Switch Window and Log Url
    [Documentation]     Keyword to switch to new window and log url of the new window
    Switch Window   NEW     timeout=${PAGE_LOAD_MAX_TIMEOUT}
    ${url} =    Get Location
    Log    Url of the new window is - ${url}

Switch Window and Log Title
    [Documentation]     Keyword to switch to main window and log title
    Switch Window   MAIN
    ${title} =  Get Title
    Log    Title of the main window is - ${title}

