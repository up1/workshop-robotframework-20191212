*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
    
*** Variables ***

*** Test Cases ***
ค้นหาโดยใช้คำว่า ATDD
    [Tags]   done   feature01   sprint01
    ไปยังหน้าค้นหา
    ค้นหาคำว่า    ATDD
    ต้องเจอผลการค้นหาของคำว่า   ATDD

ค้นหาโดยใช้คำว่า BNK48
    [Tags]   testing
    ไปยังหน้าค้นหา
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


ไปยังหน้าค้นหา
    Open Browser   url=http://www.google.com   
    ...  browser=chrome
    # ...  remote_url=http://10.2.33.245:4444/wd/hub
    # ...  desired_capabilities=browserName:chrome
    Maximize Browser Window