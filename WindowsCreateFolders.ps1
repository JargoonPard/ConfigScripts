$data = Get-Content "C:\AzureData\CustomData.bin"

foreach ($line in $data)
{
    mkdir -Path "c:\customconfig\$line"
}