*** Keywords ***
Verify result
    [Arguments]   ${expected_result}
    Wait Until Element Contains   id:resultStats   
    ...   ผลการค้นหาประมาณ
    Wait Until Element Contains   id:resultStats   รายการ

    ${result}=  Get Text  id:resultStats
    BuiltIn.Log To Console   ${result}

    Wait Until Page Contains   ${expected_result}