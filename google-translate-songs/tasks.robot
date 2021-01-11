*** Settings ***
Documentation     Google Translate song
...               Save the original and the translated lyrics as text files.
Library           RPA.Browser
#Library          SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.wp.pl/
${BROWSER}        Chrome

*** Keywords ***
Get lyrics
    ${ChromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${ChromeOptions}    add_extension    ublock.crx
    ${Options}=    Call Method    ${ChromeOptions}    to_capabilities
    Open Browser    ${LOGIN URL}    ${BROWSER}    desired_capabilities=${Options}

*** Tasks ***
Google Translate song lyrics from source to target language
    Get lyrics
