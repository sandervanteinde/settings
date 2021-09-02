# Install the meta-module in the scope of the current user.
Install-Module posh-cli -Scope CurrentUser

# This looks for locally installed CLIs for which tab-completion
# modules are available, installs them, and adds
# Import-Module commands to your $PROFILE file.
Install-TabCompletion

Add-Content $PROFILE "`nSet-PSReadlineKeyHandler -Key Tab -Function MenuComplete `nSet-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward `nSet-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward"
