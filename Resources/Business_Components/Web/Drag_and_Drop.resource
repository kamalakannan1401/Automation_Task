*** Settings ***
Documentation   Resource file hold keywords related to Drag and Drop functionality
Resource    ../../Page_Objects/Drag_and_Drop.resource
Library   SeleniumLibrary
Library    OperatingSystem
Variables   ../../../Variables/global_config_web.py

*** Variables ***
${js_file_path} =   ${EXECDIR}${/}Libraries${/}drag_and_drop_helper.js

*** Keywords ***
Drag and Drop Column A to Column B
    [Documentation]     Keyword to drag and drop column-a to column-b
    ${src} =     Get WebElement    ${column_a}
    ${target} =     Get WebElement    ${column_b}
    ${js} =  Get File    ${js_file_path}
    Execute Javascript    ${js};return DragNDrop(arguments[0], arguments[1]);
         ...    ARGUMENTS   ${src}  ${target}

Verify Drop
    [Documentation]     Keyword to verify success of drag and drop
    Wait Until Keyword Succeeds    ${OBJECT_SYNC_MAX_TIMEOUT}
        ...     1    Element Text Should Be    ${column_a_header}    B
    Wait Until Keyword Succeeds    ${OBJECT_SYNC_MAX_TIMEOUT}
        ...     1    Element Text Should Be    ${column_b_header}    A