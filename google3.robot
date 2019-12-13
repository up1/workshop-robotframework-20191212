*** Settings ***
Resource          resources/search.robot
Suite Setup       ไปยังหน้าค้นหา
Suite Teardown    Close Browser
Test Teardown     กลับไปยังหน้าค้นหา
Test Template     Flow ของการค้นหาที่ google

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