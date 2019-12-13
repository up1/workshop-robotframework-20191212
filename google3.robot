*** Settings ***
Library           SeleniumLibrary
Suite Setup       ไปยังหน้าค้นหา
Suite Teardown    Close Browser
Test Teardown     กลับไปยังหน้าค้นหา
Test Template     Flow ของการค้นหาที่ google
    
*** Variables ***
${URL}       http://www.google.com
${BROWSER}   chrome

*** Test Cases ***
#-----------------------------------------------
#  Test name   |  Keyword   |  Expected results |
#-----------------------------------------------
TC001             ATDD         ATDD
TC002             BNK48        BNK

*** Keywords ***
Flow ของการค้นหาที่ google
    [Arguments]   ${keyword}   ${expected_result}
    ค้นหาคำว่า    ${keyword}
    ต้องเจอผลการค้นหาของคำว่า   ${expected_result}

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