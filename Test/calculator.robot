*** Settings ***
Library    SeleniumLibrary
Test Setup    Open WebLocalhost
Test Teardown    Close Browser

*** Variables ***
${url}    http://localhost:5173/
${browser}    chrome
${locator_2}    id=button-2
${locator_4}    id=button-4
${locator_plus}    id=button-+
${locator_minus}    id=button--
${locator_multi}    id=button-*
${locator_divide}    id=button-/
${locator_equal}    id=button-=
${locator_result}    class=result
# list
@{cal}    calculator_plus     ${locator_4}    ${locator_plus}    ${locator_2}    6
@{cal}    calculator_minus    ${locator_4}    ${locator_minus}    ${locator_2}    2  
@{cal}    calculator_multi    ${locator_4}    ${locator_multi}    ${locator_2}    8
@{cal}    calculator_minus    ${locator_4}    ${locator_divide}    ${locator_2}    2      

*** Keywords ***
Open WebLocalhost
    [Documentation]    ทำการเปิดเว็บlocalhost
    [Tags]    open web browser
    # เรียกใช้คำสั่งเพื่อเปิดbrowser ที่ localhost โดยส่ง url และ browser
    Open Browser    ${url}    ${browser}
    # ทำการขยายหน้าจอ
    Maximize Browser Window
Click number for calculate-plus
    [Documentation]    ใช้สำหรับการบวก
    Click Element    ${locator_4}
    Click Element    ${locator_plus}
    Click Element    ${locator_2}
    Click Element    ${locator_equal}
    ${ans}    Get Text    ${locator_result}
    Should Be Equal As Integers    6    ${ans}
    
Click number for calculate-minus
    [Documentation]    ใช้สำหรับการลบ
    Click Element    ${locator_4}
    Click Element    ${locator_minus}
    Click Element    ${locator_2}
    Click Element    ${locator_equal}
    ${ans}    Get Text    ${locator_result}
    Should Be Equal As Integers    2    ${ans}
       
Click number for calculate-multi
    [Documentation]    ใช้สำหรับการคูณ
    Click Element    ${locator_4}
    Click Element    ${locator_multi}
    Click Element    ${locator_2}
    Click Element    ${locator_equal}
    ${ans}    Get Text    ${locator_result}
    Should Be Equal As Integers    8    ${ans}
    
Click number for calculate-divi
    [Documentation]    ใช้สำหรับการหาร
    Click Element    ${locator_4}
    Click Element    ${locator_divide}
    Click Element    ${locator_2}
    Click Element    ${locator_equal}
    ${ans}    Get Text    ${locator_result}
    Should Be Equal As Integers    2    ${ans}
    

*** Test Cases ***
Verify check result -plus
    Open WebLocalhost
    Click number for calculate-plus
Verify check result -minus
    Click number for calculate-minus
Verify check result -multi
    Click number for calculate-multi
Verify check result -divi
    Click number for calculate-divi       
