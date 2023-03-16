# Setup oh-my-posh

winget install JanDeDobbeleer.OhMyPosh -s winget

# Restart to refresh PATH then run the next part.

oh-my-posh font install Meslo

mkdir C:\oh-my-posh

curl -o C:\oh-my-posh\style.json https://raw.githubusercontent.com/sandervanteinde/settings/main/powershell/style.json

Add-Content $PROFILE "`nif(!`$env:WT_SESSION) {`n  return`n}"

Add-Content $PROFILE "`noh-my-posh init pwsh --config 'C:\oh-my-posh\style.json' | Invoke-Expression"

Install-Module -Name Terminal-Icons -Repository PSGallery
Add-Content $PROFILE "`nImport-Module -Name Terminal-Icons"

Install-Module posh-git
Add-Content $PROFILE "`nImport-Module posh-git"


# Add unix like tab completion
Add-Content $PROFILE "`nSet-PSReadlineKeyHandler -Key Tab -Function MenuComplete"
