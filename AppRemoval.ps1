$apps = @(
    "Microsoft.StorePurchaseApp",
    "Microsoft.WindowsCalculator",
    "Microsoft.WindowsStore",
    "Microsoft.Windows.Photos",
    "Microsoft.MSPaint"
)
Get-AppxProvisionedPackage -online | ForEach-Object {
            $toKeep = $FALSE

                ForEach($app in $apps) {
                    if(($app -match $_.DisplayName)) {
                        Write-Host "Preserving App because " $app " = " $_.DisplayName
                        $toKeep = $TRUE
                } else {
            }
        }
                if ($toKeep -eq $FALSE) {
                    write-host "Removing" $_.displayname
                    remove-appxprovisionedpackage -online -packagename $_.PackageName
                                    }
                        }