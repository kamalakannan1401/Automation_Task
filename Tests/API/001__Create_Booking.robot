*** Settings ***
Documentation   Suite file for Create Booking API
Resource    ../../Resources/Business_Components/API/Common.resource
Library   RequestsLibrary
Library    Collections
Library     ../../Libraries/ExcelLibrary.py
Test Setup  Test Setup API
Test Teardown   Test Teardown API

*** Test Cases ***
Create Booking
    [Documentation]     Test case to verify create booking API
    Set Excel File Path    ${data_file_path}
    ${request_body} =   Get Data    ${excel_sheet_name}    Request_Body
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_body_json_object} =  Convert JSON string To JSON Object    ${request_body}
    ${request_headers_json_object} =  Convert JSON string To JSON Object    ${request_headers}
    ${response} =   POST On Session    alias=${session}     url=/booking     headers=${request_headers_json_object}
    ...     json=${request_body_json_object}    expected_status=200
    Should Be Equal    ${response.json()}[booking]    ${request_body_json_object}
       ...  msg=Booking information is not received as expected.
    Log    Booking information is received as expected. Expected : ${request_body_json_object}, Actual : ${response.json()}[booking]
    Dictionary Should Contain Key   ${response.json()}  bookingid
    Log    bookingid is received in the response
    ${booking_id} =     Get From Dictionary    ${response.json()}    bookingid
    Put Data    ${excel_sheet_name}    Booking_ID    ${booking_id}
    Log    Created booking ID is ${booking_id}
    Log    Received headers - ${response.headers}
    Log    Status Code text - ${response.reason}
    Log    Received response - ${response.text}

Create Booking With Invalid Date Format
    [Documentation]     Test case to verify create booking API with invalid date format
    Set Excel File Path    ${data_file_path}
    ${request_body} =   Get Data    ${excel_sheet_name}    Request_Body
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_body_json_object} =  Convert JSON String To JSON Object    ${request_body}
    ${request_headers_json_object} =  Convert JSON String To JSON Object    ${request_headers}
    ${response} =   POST On Session    alias=${session}     url=/booking     headers=${request_headers_json_object}
    ...     json=${request_body_json_object}    expected_status=200
    Should Be Equal As Strings    ${response.text}    Invalid date
      ...   msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Invalid date, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}

Create Booking Without Mandatory Data
    [Documentation]     Test case to verify create booking API without filling mandatory data
    Set Excel File Path    ${data_file_path}
    ${request_body} =   Get Data    ${excel_sheet_name}    Request_Body
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_body_json_object} =  Convert JSON String To JSON Object    ${request_body}
    ${request_headers_json_object} =  Convert JSON String To JSON Object    ${request_headers}
    ${response} =   POST On Session    alias=${session}     url=/booking     headers=${request_headers_json_object}
    ...     json=${request_body_json_object}    expected_status=500
    Should Be Equal As Strings    ${response.text}    Internal Server Error
      ...   msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Internal Server Error, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}