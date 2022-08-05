*** Settings ***
Documentation   Page Object file for Home page

*** Variables ***
${button_logout} =   xpath://*[normalize-space(text())='Logout']//parent::a[contains(@class,'button')]