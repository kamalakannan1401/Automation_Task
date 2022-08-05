pushd %~dp0

REM Below command is to install the required dependencies using pip
call pip install -r Requirements.txt

REM Below command is to download the required webdriver using webdrivermanager
call webdrivermanager chrome:103.0.5060.134 gecko:v0.31.0 --linkpath "%CD%"

REM Below command is to execute API tests and web tests on chrome browser
call robot --variable BROWSER:chrome --argumentfile Arguments.robot "Tests"

REM Below command is to execute web tests on firefox browser
call robot --variable BROWSER:firefox --argumentfile Arguments.robot "Tests\Web"