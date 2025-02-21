*** Settings ***
Resource    ../../Resources/web/LoginPage.robot
Test Setup    Open Login Page
Test Teardown    Close Browser Page

*** Test Cases ***
Test Successful Login
    Input Username    tomsmith
    Input Password    SuperSecretPassword!
    Click Login Button
    Verify Login Success

Test Failed Login
    Input Username    invalid_user
    Input Password    invalid_password
    Click Login Button
    Verify Login Failed