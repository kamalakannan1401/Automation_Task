*** Settings ***
Documentation   Page Object file for Landing page
Library     SeleniumLibrary

*** Variables ***
${link_form_authentication} =   link:Form Authentication
${link_dynamic_loading} =   link:Dynamic Loading
${link_multiple_windows} =   link:Multiple Windows
${link_drag_and_drop} =   link:Drag and Drop
${link_frames} =   link:Frames
${link_javascript_alerts} =   link:JavaScript Alerts

*** Keywords ***
Navigate to Form Authentication
    [Documentation]     Keyword to click Form Authentication link in Landing page
    Click Link  ${link_form_authentication}

Navigate to Dynamic Loading
    [Documentation]     Keyword to click Dynamic Loading link in Landing page
    Click Link  ${link_dynamic_loading}

Navigate to Multiple Windows
    [Documentation]     Keyword to click Multiple Windows link in Landing page
    Click Link  ${link_multiple_windows}

Navigate to Drag and Drop
    [Documentation]     Keyword to click Drag and Drop link in Landing page
    Click Link  ${link_drag_and_drop}

Navigate to Frames
    [Documentation]     Keyword to click Frames link in Landing page
    Click Link  ${link_frames}

Navigate to Javascript Alerts
    [Documentation]     Keyword to click Javascript Alerts link in Landing page
    Click Link  ${link_javascript_alerts}