*** Settings ***
Library   SeleniumLibrary

*** Variables ***

*** Test Cases ***
ทำการ upload file จำนวน 3 file
    ไปยังหน้า upload
    เลือกไฟล์ image_01.png
    เลือกไฟล์ image_02.png
    เลือกไฟล์ image_03.png
    ทำการ upload file ที่ 1 สำเร็จ
    ทำการ upload file ที่ 2 สำเร็จ
    ทำการ upload file ที่ 3 สำเร็จ

*** Keywords ***
ทำการ upload file ที่ 1 สำเร็จ
    Click Element   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/button[1]
    Upload progress 33%
    ตรวจสอบ uploaded status
    Capture Page Screenshot

Upload progress 33%
    Wait Until Page Contains Element
    ...  xpath://div[@style="width: 33%;"]

ตรวจสอบ uploaded status
    Wait Until Element Is Visible
    ...   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[4]/span[3]/i

ทำการ upload file ที่ 2 สำเร็จ
    Click Element   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element
    ...  xpath://div[@style="width: 67%;"]
    Capture Page Screenshot

ทำการ upload file ที่ 3 สำเร็จ
    Click Element   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element
    ...  xpath://div[@style="width: 100%;"]
    Capture Page Screenshot

เลือกไฟล์ image_01.png
    Choose File   xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    ...   ${CURDIR}/files/image_01.png
    Wait Until Element Contains   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/p
    ...   Queue length: 1
    Wait Until Element Contains   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[1]
    ...    image_01.png 
    
เลือกไฟล์ image_02.png
    Choose File   xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    ...   ${CURDIR}/files/image_02.png
    Wait Until Element Contains   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/p
    ...   Queue length: 2
    Wait Until Element Contains   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[1]
    ...    image_02.png 

เลือกไฟล์ image_03.png
    Choose File   xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    ...   ${CURDIR}/files/image_03.png
    Wait Until Element Contains   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/p
    ...   Queue length: 3
    Wait Until Element Contains   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[1]
    ...    image_03.png 

ไปยังหน้า upload
    Open Browser   url=http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...  browser=gc
    Maximize Browser Window

