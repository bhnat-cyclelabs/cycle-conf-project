Feature: Data Extract

Background:
If I verify file "extract/local.conf" exists
Then I assign values from config file "extract/local.conf" to variables
Else I assign values from config file "extract/extract.conf" to variables
EndIf
#Then I echo $queries
And I replace first "^\[" in $queries with "" as variable "queries"
And I replace first "\]$" in $queries with "" as variable "queries"
And I split string $queries on delimiter "," into list $queries
# Then I echo $queries
Then I connect to MOCA at $url logged in as $username with password $password
 And I assign $wh_id to MOCA environment variable "wh_id"
 
After Scenario:
If I close MOCA connection
EndIf

Scenario: Read value
While I assign next element in list $queries to variable "query"
# And I echo $query
Then I execute MOCA command $query
Then I echo $row_count
# Then I verify MOCA status is 0
# If I verify 0 rows in result set
# EndIf
EndWhile
