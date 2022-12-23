#region function parameter prompt
function Show-PromptInfo {
 param
 (
  [string]
  $Name,

  [int]
  $ID
 )
 if ($PSBoundParameters.Count -eq 0) {
  Show-Command -Name Show-PromptInfo
  return
 }

 "Your name is $name, and the id is $id."
}
Show-PromptInfo
#endregion
