*** Settings ***
Resource    ../../Resources/api/JSONPlaceholderKeywords.robot
Suite Setup    Create Session For JSONPlaceholder

*** Test Cases ***
Test Get All Posts
    ${response}=    Get All Posts
    Should Not Be Empty    ${response.json()}

Test Get Single Post
    ${response}=    Get Post By Id    1
    Should Be Equal As Strings    ${response.json()}[id]    1

Test Create New Post
    ${response}=    Create New Post    Test Title    Test Body    1
    Should Be Equal As Strings    ${response.json()}[title]    Test Title
    Should Be Equal As Strings    ${response.json()}[body]    Test Body

Test Update Post
    ${response}=    Update Post    1    Updated Title    Updated Body    1
    Should Be Equal As Strings    ${response.json()}[title]    Updated Title
    Should Be Equal As Strings    ${response.json()}[body]    Updated Body

Test Delete Post
    ${response}=    Delete Post    1
    Should Be Equal As Strings    ${response.status_code}    200