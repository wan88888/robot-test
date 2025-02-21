*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://the-internet.herokuapp.com/login
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${SUBMIT_BUTTON}    css=button[type='submit']
${SUCCESS_MESSAGE}    css=.flash.success
${ERROR_MESSAGE}    css=.flash.error

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN_URL}    chrome    options=add_argument('--headless');add_argument('--disable-gpu')
    Maximize Browser Window

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Button    ${SUBMIT_BUTTON}

Verify Login Success
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}
    Element Should Contain    ${SUCCESS_MESSAGE}    You logged into a secure area!

Verify Login Failed
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
    Element Should Contain    ${ERROR_MESSAGE}    Your username is invalid!

Close Browser Page
    Close Browser