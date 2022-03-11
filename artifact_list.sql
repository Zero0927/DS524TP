/* Name, Status, owner first last name, approver first last name 
NAME from table1 , FIRST_NAME LAST_NAME from table 2 FIRST_NAME LAST_NAME
*/

SELECT 
NAME as 'Document Name',
STATUS as 'Document Status',
`table 2 (owner)`.FIRST_NAME as 'Owner First Name',
`table 2 (owner)`.LAST_NAME as 'Owner Last Name',
`table 3 (approver)`.FIRST_NAME as 'Approver First Name',
`table 3 (approver)`.LAST_NAME AS 'Approver Last Name'
FROM `table 1 (governance_document)`
INNER JOIN `table 2 (owner)`
ON `table 1 (governance_document)`.OWNER_ID = `table 2 (owner)`.OWNER_ID
INNER JOIN `table 3 (approver)`
ON `table 1 (governance_document)`.APPROVER_ID = `table 3 (approver)`.APPROVER_ID
INNER JOIN `table 4 (status)`
ON `table 1 (governance_document)`.STATUS_ID = `table 4 (status)`.STATUS_ID
INTO OUTFILE '/Downloads/DataGovernanceArtifacts.txt'


