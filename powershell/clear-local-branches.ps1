param (
    [Parameter(Mandatory=$false, Position=0)]
    [string]$Path
)

if ($PSBoundParameters.ContainsKey('Path')) {
    Set-Location -Path $Path
}


git fetch
$currentBranch = git branch --show-current
$localBranches = git branch | ForEach-Object { $_.Trim() -replace '^\* ', '' }
$remoteBranches = git branch -r | ForEach-Object { $_.Trim() -replace '^origin/', '' }

$branchesToDelete = @()

$localBranches | ForEach-Object {
$localBranch = $_
    $matchFound = $false
    $remoteBranches | ForEach-Object {
        $remoteBranch = $_
        if ($localBranch -eq $remoteBranch) {
            $matchFound = $true
        }
    }
    if (-not $matchFound -and $localBranch -ne $currentBranch) {
        $branchesToDelete += $localBranch
    }
}

if ($branchesToDelete.Length -gt 0) {
    Write-Host "Branches to delete:"
    $branchesToDelete | ForEach-Object { Write-Host $_ }
    Write-Host "Are you sure? (Y/N)"
    $response = Read-Host   
    if ($response -eq "Y") {
        $branchesToDelete | ForEach-Object {
            git branch -D $_
        }
    } else {
        Write-Host "Skipping deletion of the listed branches"
    }
} else {
    Write-Host "No branches to delete found."
}
