# Setup oh-my-posh

winget install JanDeDobbeleer.OhMyPosh -s winget

# Restart to refresh PATH then run the next part.

oh-my-posh font install Meslo

mkdir C:\oh-my-posh

curl -o C:\oh-my-posh\style.json https://raw.githubusercontent.com/sandervanteinde/settings/main/powershell/style.json

Add-Content $PROFILE "`noh-my-posh init pwsh --config 'C:\oh-my-posh\style.json' | Invoke-Expression"

Install-Module -Name Terminal-Icons -Repository PSGallery
Add-Content $PROFILE "`nImport-Module -Name Terminal-Icons"
