winget install JanDeDobbeleer.OhMyPosh -s winget

## Restart to refresh PATH

mkdir C:\oh-my-posh

curl -o C:\oh-my-posh\style.json https://www.keycdn.com/img/example.jpg

Add-Content $PROFILE "oh-my-posh init pwsh --config 'C:\oh-my-posh\style.json' | Invoke-Expression"
