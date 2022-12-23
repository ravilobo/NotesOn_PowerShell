# read XML
<#
--This code reads a XML file

--<params>
--<path>C:\TFS_Local\DataServices\Mainline\System\Claim\Acclaim\R2\Deployment\Archive\201301\</path>
--<server>DIX-T-ACCDBS-01\test</server>
--<db>Acclaim_training</db>
--</params>


#>


[xml]$lv = Get-Content C:\deploy_TFS\Input_params.xml

$lv.params.path
$lv.params.server
$lv.params.db

