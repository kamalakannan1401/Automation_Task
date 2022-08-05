*** Settings ***
Documentation   Resource file to hold common keywords related to API tests
Variables   ../../../Variables/global_config_web.py
Library   SeleniumLibrary   implicit_wait=${OBJECT_SYNC_MAX_TIMEOUT}
    ...     screenshot_root_directory=${EXECDIR}${/}Results${/}Screenshots
    ...     run_on_failure=None

*** Keywords ***
Navigate to App Url
    [Documentation]     Keyword to navigate to the web application
    Go To    url=${APP_URL}

Test Setup Web
    [Documentation]     Test Setup keyword for web tests
    Open Browser    browser=${BROWSER}  service_log_path=${{os.path.devnull}}
    Maximize Browser Window

Test Teardown Web
    [Documentation]     Test Teardown keyword for web test cases
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Browsers