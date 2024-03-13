*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC_1
    Open Browser    http://35.213.187.172:30800/swagger/index.html    
    Wait Until Element Is Visible    //div[@class="opblock-summary opblock-summary-get"]    timeout=10s
    Click Element   //div[@class="opblock-summary opblock-summary-get"]
    Click Button    Try it out 
    FOR    ${i}    IN RANGE    3000
       Click Button    Execute
    END
    Close Browser
    