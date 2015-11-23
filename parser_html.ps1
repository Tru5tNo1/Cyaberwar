

<#
.Synopsis

Author: Vito De Laurentis (AKA Trust_No_1) (@Trust_No_001)
License: GNU GPL v2
Version: v1.0

.Example




#>
Param (
            [string]$percorso = "$null"
            
       )


    
#####################################################################
#####################################################################           
#####################################################################
#####################################################################


Write-Host ""
Write-Host "    ╔-------------------- Invoke-FindString --------------------╗"
Write-Host "    ║  Find Sting                                               ║"
Write-Host "    ║                                                           ║"
Write-Host "    ║  ON-Line Version                                          ║"
Write-Host "    ║  Author:  Vito De Laurentis (@Trust_No_001)               ║"
Write-Host "    ║  Email:  delaurentis@live.it                              ║"
Write-Host "    ║  Version: v1.0 ()                                         ║"
Write-Host "    ║  Network Security Tester                                  ║"
Write-Host "    ║  New options: -percorso [es: C:\user\]  -text TESTO       ║"
Write-Host "    ║                                                           ║"
Write-Host "    ╚-----------------------------------------------------------╝"
Write-Host ""
#####
Start-Sleep -s 2
 

                          
$text = "user.php?id"
$percorso = "C:\Users\Vito\Desktop\stringprova"                                                
Write-Host -foregroundcolor green "`n[+] Scanning  $percorso "
$KPDFiles = Get-ChildItem -Path "$percorso" -recurse -filter *.*
if ($KPDFiles -ne $null)
{
    [int] $filecount = $KPDFiles.Count
    $pcount = 0
    Write-host -foregroundcolor green "`n[info] Found $filecount KPD files of interest in $percorso" 
    Write-host -foregroundcolor green "`n[info] $fpath" 
    foreach($KPDs in $KPDFiles)            
        {
            $uninstalldata = ""
            $Filename = $KPDs.Name
            $FPath = $KPDs.VersionInfo.Filename
            Write-host -foregroundcolor green "`n[info] $fpath" 
                if ($FPath -ne $null)
                    {
                        foreach($Line in gc $FPath)
                            {
                            [array] $mio = ([regex]'user.php[?]id=[0-9]+').matches($line)
                            #clsWrite-host -foregroundcolor green "`n[info] $fpath"
                            if ($mio -ne "")
                                {
                                for ($i=0; $i -le $mio.Length -1;$i++)
                                    { 
                                    $mio2 = $mio[$i]
                                    if ($mio2 -ne $null)
                                                {
                                                Write-host -foregroundcolor yellow "`n[+] Found $mio2" 
                                                }
                                    }
                                }
                            } 
                    }                                 
        }
}      
