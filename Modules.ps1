# add this line at the top of the script, if a particular module is needed 
#requires -modules dolphin, cc

Find-Module iseremotetab #searches ps gallery
Find-command -module jira #lists commands from the module from ps gallery, even without installing it 
Install-Module

$env:PSModulePath
($env:PSModulePath).split(';')
$env:PSModulePath -split ';'

# although not needed, use explicit path when 2 modules have same name
# you can also prefix the module name with the function 
Get-Module # current loaded modules in the session 
Get-Module -ListAvailable
import-module c:\myCustomPath\myNotOnPathModule.psm1

#handling common functions across module 
import-module dolphin -Prefix AAN
start-AANjob -name 'FormatCdrive'

#discovering commands 
Get-Command -module BitsTransfer 
(Get-Module BitsTransfer).ExportedCommands
(Get-Module dolphin).ExportedCommands
(Get-Module dolphin).ExportedAliases
(Get-Module dolphin).ExportedFunctions

Get-Command -module dolphin -verb test
Get-Command -module dolphin -verb tes*
Get-Command -module dolphin *wsus*
Get-Command -name Get-ServerInfo
Get-Command *wsus*

<#
   - Package manager 
   - PowerShellGet is the package manager for PS
   - by defauly source is PowerShell gallery
   - PowerShellGet module has commands like Find-Module. install-module, update-module 

#>
get-command -module PowerShellGet
get-command -module packagemanagement
Get-PackageProvider
Get-PSRepository

# creating private ps repo 
New-Item -Path C:\localRepo -ItemType Directory
New-SmbShare -Name c:\localRepoShare -Path c:\localRepo
Register-PSRepository -name LocalPSRepo -SourceLocation \\localhost\localRepoShare\ -ScriptSourceLocation \\localhost\localRepoShare -InstallationPolicy Trusted
Set-PSRepository -Name localpsrepo -InstallationPolicy Trusted

<#
  - Update Module 
  - upadating module won't remove the older version! (but import module will load the latest)
  - udate module will only updates the ones installed with install-module (since they use the same package manager!)
#>
Get-InstalledModule  # all modules installed with PowerShellGet package manager
(Get-InstalledModule).count 

<#
    - Uninstall 
    - remove-module will only remove from the memory; it's the opposite of import-module     
    - uninstall will remove only the latest version!     
    - use uninstall-module to completely uninstall 
#>
Uninstall-Module posh-ssh -AllVersions #removes all versions 


<#
  - when there's not n/w
#>
save-module # can be used for offline installation 
save-module -name psslack -Path C:\Scratchpad
Get-ChildItem C:\Scratchpad