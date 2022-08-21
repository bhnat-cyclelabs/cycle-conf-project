Feature: My Feature

Background:
If I verify file "conf/local.conf" exists
Then I assign values from config file "conf/local.conf" to variables
Else I assign values from config file "conf/default.conf" to variables
EndIf
Then I echo $myarray
Then I echo $foo
Then I echo $bar
Then I increase variable "foo"
Then I increase variable "bar"
Then I echo $foo
Then I echo $bar

After Scenario:
If I close web browser
EndIf

Scenario: Read value
When I echo $pw_sql_db
When I open "Chrome" web browser
 And I navigate to $url in web browser within 30 seconds
 And I see element "id:email" in web browser within 30 seconds
 And I type $cycle_username in element "id:email" in web browser
 And I type $cycle_password in element "id:password" in web browser
 And I click element "id:next" in web browser
Then I see element "id:navUser-toggle" in web browser within 30 seconds 