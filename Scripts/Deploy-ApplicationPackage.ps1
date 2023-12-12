
$msdeploy = "C:\Program Files (x86)\IIS\Microsoft Web Deploy V3\msdeploy.exe";

$source        = $args[0] #source-path
$destination   = $args[1] #target-path
$recycleApp    = $args[2] #website-name
$computerName  = $args[3] #server-computer-name
$username      = $args[4] #server-username
$password      = $args[5] #server-password
$delete        = $args[6] #target-delete
$skipDirectory = $args[7] #skip-directory-path

$computerNameArgument = $computerName + '/MsDeploy.axd?site=' + $recycleApp

$directory = Split-Path -Path (Get-Location) -Parent
$baseName = (Get-Item $directory).BaseName
$contentPath = Join-Path(Join-Path $directory $baseName) $source

$targetPath = $recycleApp + $destination

[System.Collections.ArrayList]$msdeployArguments = 
    "-verb:sync",
    "-allowUntrusted",
    "-enableRule:AppOffline",
    "-disableLink:AppPoolExtension",
    "-disableLink:ContentExtension",
    "-disableLink:CertificateExtension",
    "-source:contentPath=${contentPath}," +
    ("-dest:" + 
        "contentPath=${targetPath}," +
        "computerName=${computerNameArgument}," + 
        "username=${username}," +
        "password=${password}," +
        "IncludeAcls='False'," +
        "AuthType='Basic'"
    )

if ($delete -NotMatch "true")
{
    $msdeployArguments.Add("-enableRule:DoNotDeleteRule")
}

if ($skipDirectory)
{
    $msdeployArguments.Add("-skip:Directory=${skipDirectory}")
}

& $msdeploy $msdeployArguments