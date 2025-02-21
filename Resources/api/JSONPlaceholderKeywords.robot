*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Keywords ***
Create Session For JSONPlaceholder
    Create Session    jsonplaceholder    ${BASE_URL}    verify=True

Get All Posts
    ${response}=    GET On Session    jsonplaceholder    /posts
    Status Should Be    200    ${response}
    [Return]    ${response}

Get Post By Id
    [Arguments]    ${post_id}
    ${response}=    GET On Session    jsonplaceholder    /posts/${post_id}
    Status Should Be    200    ${response}
    [Return]    ${response}

Create New Post
    [Arguments]    ${title}    ${body}    ${user_id}
    ${data}=    Create Dictionary    title=${title}    body=${body}    userId=${user_id}
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${data}
    Status Should Be    201    ${response}
    [Return]    ${response}

Update Post
    [Arguments]    ${post_id}    ${title}    ${body}    ${user_id}
    ${data}=    Create Dictionary    title=${title}    body=${body}    userId=${user_id}    id=${post_id}
    ${response}=    PUT On Session    jsonplaceholder    /posts/${post_id}    json=${data}
    Status Should Be    200    ${response}
    [Return]    ${response}

Delete Post
    [Arguments]    ${post_id}
    ${response}=    DELETE On Session    jsonplaceholder    /posts/${post_id}
    Status Should Be    200    ${response}
    [Return]    ${response}