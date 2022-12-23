#updating profile 
notepad $profile 

# loading the profile 
. $profile
& $profile

# global profile locations 

$PROFILE # Current User, Current Host
$PROFILE.CurrentUserCurrentHost # Current User, Current Host
$PROFILE.CurrentUserAllHosts # Current User, All Hosts
$PROFILE.AllUsersCurrentHost # All Users, Current Host
$PROFILE.AllUsersAllHosts # All Users, All Hosts

# place common commands for everyone here 
# this profile is shared across ISE and VS Code 
$PROFILE.AllUsersAllHosts

