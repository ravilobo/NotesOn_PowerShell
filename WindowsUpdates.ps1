# runs from the local box 
$server = 'MyServer'
$updatesession = [activator]::CreateInstance([type]::GetTypeFromProgID("Microsoft.Update.Session", $Server))
$updatesearcher = $updatesession.CreateUpdateSearcher()
$searchresult = $updatesearcher.Search("IsInstalled=0")
$PatchCount = $searchresult.Updates.Count
$PatchCount

# remote invoke 
$server = 'MyServer'
$PatchCount = invoke-command -ComputerName $server  -ScriptBlock {
 [Int]$Count = 0
 $Searcher = new-object -com "Microsoft.Update.Searcher"
 $Searcher.Search("IsAssigned=1 and IsHidden=0 and IsInstalled=0").Updates | ForEach-Object { $Count++ }
 $Count
}
$PatchCount

