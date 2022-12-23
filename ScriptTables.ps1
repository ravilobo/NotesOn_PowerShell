$DestinationServer='MyServer'
$DestinationDatabase='Serverops'
$DestinationSchema='perf'
$DestinationTable ='counter'

$TableWithSchema = "$($DestinationSchema).$($DestinationTable)"
$options = New-DbaScriptingOption
$options.DriAllConstraints =$false
$options.DriAllKeys = $false
$options.NonClusteredIndexes= $false
$options.IncludeIfNotExists = $false
$options.nocollation = $true
$options.NoFileGroup = $true 
$options.AnsiPadding = $false
$TableScript = get-dbadbtable -SqlInstance $DestinationServer  -Database $DestinationDatabase -Table $TableWithSchema |Export-DbaScript -Passthru -ScriptingOptionsObject $options
$TableScript = $TableScript -replace 'NOT NULL|NULL',''
$TableScript