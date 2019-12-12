*** Settings ***
Library    SeleniumLibrary
    
*** Variables ***

*** Test Cases ***
ค้นหาโดยใช้คำว่า ATDD
    ไปยังหน้าค้นหา
    ค้นหาคำว่า ATDD
    ต้องเจอผลการค้นหาของคำว่า ATDD

*** Keywords ***
ต้องเจอผลการค้นหาของคำว่า ATDD
    SeleniumLibrary.Wait Until Element Contains   id:resultStats   
    ...   ผลการค้นหาประมาณ
    SeleniumLibrary.Wait Until Element Contains   id:resultStats   รายการ

    ${result}=  Get Text  id:resultStats
    BuiltIn.Log To Console   ${result}

ค้นหาคำว่า ATDD
    Input Text    name:q   ATDD
    Press Keys	  name:q   RETURN

ไปยังหน้าค้นหา
    Open Browser   url=http://www.google.com   
    ...  browser=gc
    Maximize Browser Window