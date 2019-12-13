*** Settings ***
Resource          resources/search.robot
Suite Setup       ไปยังหน้าค้นหา
Suite Teardown    Close Browser

*** Test Cases ***
Search data success
    [Template]   Flow ของการค้นหาที่ google
    ATDD     ATDD
    BNK48    BNK

*** Keywords ***
Flow ของการค้นหาที่ google
    [Arguments]   ${keyword}   ${expected_result}
    ค้นหาคำว่า    ${keyword}
    ต้องเจอผลการค้นหาของคำว่า   ${expected_result}
    กลับไปยังหน้าค้นหา