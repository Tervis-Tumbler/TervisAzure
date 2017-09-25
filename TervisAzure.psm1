function Install-TervisAzure {
    param(
        [System.Management.Automation.PSCredential]$AzureCredential = $(get-credential -message "Please supply the credentials to access Azure. Username must be in the form UserName@Domain.com")
    )
    if (-NOT (Get-Module AzureRM)) {
        Install-Module AzureRM
    }
    $AzureCredential | Export-Clixml $env:USERPROFILE\AzureCredential.txt    
}

