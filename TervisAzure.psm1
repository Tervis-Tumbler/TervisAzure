function Install-TervisAzure {
    param(
        [System.Management.Automation.PSCredential]$AzureCredential = $(get-credential -message "Please supply the credentials to access Azure. Username must be in the form UserName@Domain.com")
    )
    if (-NOT (Get-Module AzureRM)) {
        Install-Module AzureRM
    }
    $AzureCredential | Export-Clixml $env:USERPROFILE\AzureCredential.txt    
}

function Connect-ToAzure {
    param(
        [ValidateSet("Delta","Epsilon","Production/Infrastructure")][String]$Subscription
    )
    Import-Module AzureRM
    $AzureCredential = Import-Clixml $env:USERPROFILE\AzureCredential.txt
    if ($Subscription -eq "Delta") {
        Login-AzureRmAccount -Credential $AzureCredential -SubscriptionId "fccc35a6-20b8-4c85-9fe7-94e7f5fd7c37"
    } elseif ($Subscription -eq "Epsilon") {
        Login-AzureRmAccount -Credential $AzureCredential -SubscriptionId "58e88142-ab4b-42aa-9c31-5e68f0a5390f"
    } elseif ($Subscription -eq "Production/Infrastructure") {
        Login-AzureRmAccount -Credential $AzureCredential -SubscriptionId "8b3835b7-ddd8-41fc-9ee1-297bfe67e2a3"
    }
}
