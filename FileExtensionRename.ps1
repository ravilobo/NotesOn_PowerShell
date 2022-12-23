<#
This script ranames extentions in a folder. 
E.g. rename all .ps1 to .txt
#>




$fold_loc    = C:\Users\username\Desktop\Hiren\
$old_fil_ext = '.ps1'
$new_fil_ext = '.txt'


clear-host 
$file_list = get-childitem C:\Users\username\Desktop\Hiren

foreach ($i in $file_list)
  {
    $old_file_nm = $fold_loc + $i.name
    $new_file_nm = $fold_loc + ($i.name).replace($old_fil_ext,$new_fil_ext)

    rename-item $old_file_nm $new_file_nm  -force 

    }

