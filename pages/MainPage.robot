*** Keywords ***
Open
    Open Browser   url=${URL}   browser=${BROWSER}
    Maximize Browser Window

Back
    Go To    ${URL} 

Search
    [Arguments]   ${keyword}
    Input Text    name:q   ${keyword}
    Press Keys	  name:q   RETURN