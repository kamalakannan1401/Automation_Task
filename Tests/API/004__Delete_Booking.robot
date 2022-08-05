*** Settings ***
Documentation   Suite file for Delete Booking API
Resource    ../../Resources/Business_Components/API/Common.resource
Library   RequestsLibrary
Library    Collections
Library     ../../Libraries/ExcelLibrary.py
Test Setup  Test Setup API
Test Teardown   Test Teardown API

*** Test Cases ***
Delete Booking
    [Documentation]     Test case to verify delete booking API with valid data
    Set Excel File Path    ${data_file_path}
    ${booking_id} =     Get Data From Cell    ${excel_sheet_name}    D2
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_headers_json_object} =  Convert JSON String To JSON Object    ${request_headers}
    ${response} =   DELETE On Session    alias=${session}     url=/booking/${booking_id}     headers=${request_headers_json_object}
    ...     expected_status=201
    Should Be Equal As Strings    ${response.text}    Created
    ...     msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Created, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}
    ${response} =   GET On Session    alias=${session}     url=/booking/${booking_id}   expected_status=404
    Should Be Equal As Strings    ${response.text}    Not Found
    ...     msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Not Found, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}

Delete Booking with Invalid ID
    [Documentation]     Test case to verify delete booking API with invalid data
    Set Excel File Path    ${data_file_path}
    ${booking_id} =     Get Data From Cell    ${excel_sheet_name}    D2
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_headers_json_object} =  Convert JSON String To JSON Object    ${request_headers}
    ${response} =   DELETE On Session    alias=${session}     url=/booking/${booking_id}     headers=${request_headers_json_object}
    ...     expected_status=405
    Should Be Equal As Strings    ${response.text}    Method Not Allowed
    ...     msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Method Not Allowed, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}