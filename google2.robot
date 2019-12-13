*** Settings ***
Library           SeleniumLibrary
Suite Setup       ไปยังหน้าค้นหา
Suite Teardown    Close Browser
Test Teardown     กลับไปยังหน้าค้นหา
    
*** Variables ***
${URL}       http://www.google.com
${BROWSER}   chrome

*** Test Cases ***
ค้นหาโดยใช้คำว่า ATDD
    [Tags]   done   feature01   sprint01
    ค้นหาคำว่า    ATDD
    ต้องเจอผลการค้นหาของคำว่า   ATDD

ค้นหาโดยใช้คำว่า BNK48
    [Tags]   testing
    ค้นหาคำว่า    BNK48
    ต้องเจอผลการค้นหาของคำว่า    BNK48

*** Keywords ***
ค้นหาคำว่า "${keyword}" นะ
    Input Text    name:q   ${keyword}
    Press Keys	  name:q   RETURN

ค้นหาคำว่า
    [Arguments]    ${keyword}
    Input Text    name:q   ${keyword}
    Press Keys	  name:q   RETURN

ต้องเจอผลการค้นหาของคำว่า
    [Arguments]   ${expected_result}
    Wait Until Element Contains   id:resultStats   
    ...   ผลการค้นหาประมาณ
    Wait Until Element Contains   id:resultStats   รายการ

    ${result}=  Get Text  id:resultStats
    BuiltIn.Log To Console   ${result}

    Wait Until Page Contains   ${expected_result}

กลับไปยังหน้าค้นหา
    Go To    ${URL}   

ไปยังหน้าค้นหา
    Open Browser   url=${URL}   browser=${BROWSER}
    Maximize Browser Window