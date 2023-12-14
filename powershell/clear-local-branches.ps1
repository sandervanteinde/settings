git fetch
$currentBranch = git branch --show-current
$localBranches = git branch | ForEach-Object { $_.Trim() -replace '^\* ', '' }
$remoteBranches = git branch -r | ForEach-Object { $_.Trim() -replace '^origin/', '' }

$localBranches | ForEach-Object {
    $localBranch = $_
    
    $matchFound = $false
    $remoteBranches | ForEach-Object {
        $remoteBranch = $_
        if ($localBranch -eq $remoteBranch) {
            $matchFound = $true
        }
    }

    if (-not $matchFound) {
        if($localBranch -eq $currentBranch) {
            Write-Host "Skipping deletion of the currently checked out branch $localBranch. It is active branch"
            continue
        }
        Write-Host "Branch to delete: $localBranch. Are you sure? (Y/N)"
        $response = Read-Host
        if ($response -eq "Y") {
            git branch -D $localBranch
        } else {
            Write-Host "Skipping deletion of $localBranch"
        }
    }
}
