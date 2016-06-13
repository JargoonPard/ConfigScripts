#load the CustomData file provided by Azure
$customDataPath = $env:SystemDrive + "\AzureData\CustomData.bin"
$jsonData = Get-content -path $customDataPath | Out-String | ConvertFrom-Json
$newConnString = $jsonData.database.connectionString

#load the configuration file that needs to be updated using the custom data
$appConfigPath = $env:SystemDrive + "\Sandbox\WebApplication1\WebApplication1\Web.config"
$configData = New-Object XML
$configData.Load($appConfigPath)

#modify the configuration values
$configData.configuration.connectionStrings.add.Attributes["connectionString"].Value = $newConnString

#save the updated config file
$configData.Save($appConfigPath)