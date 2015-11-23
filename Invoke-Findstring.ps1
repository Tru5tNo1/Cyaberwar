function Invoke-FindString
{

<#
.Synopsis

Author: Vito De Laurentis (AKA Trust_No_1) (@Trust_No_001)
License: GNU GPL v2
Version: v1.0

.Example




#>
Param (
            [string]$percorso = "$null",
            [string]$text = $null
            
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
 

                          
#$text = "password"
#$percorso = "C:\Users\Vito\AppData\Local\Temp"                                                
Write-Host -foregroundcolor green "`n[+] Scanning  $percorso "
$KPDFiles = Get-ChildItem -Path "$percorso" -recurse -filter *.*
if ($KPDFiles -ne $null)
{
                        [int] $filecount = $KPDFiles.Count
                        $pcount = 0
                        Write-host -foregroundcolor green "`n[info] Found $filecount KPD files of interest in $percorso" 
                        
                        foreach($KPDs in $KPDFiles)
                        
                          {
                        
                        $uninstalldata = ""
                        $Filename = $KPDs.Name
                        $FPath = $KPDs.VersionInfo.Filename
                        #Write-host -foregroundcolor green "`n[info] $fpath" 
                        
                                               if ($FPath -ne $null)
                                                                {
                                                  foreach($Line in gc $FPath){
                                                                                       
                                                         if($line -match "$text") {      
                                                                                    Write-host -foregroundcolor green "`n[info] $fpath"
                                                                                    $pcount = $pcount + 1 
                                                                                    Write-host -foregroundcolor yellow "[+] Found $line in $fpath"                                                                               
                                                                                    #[array] $pwarray = Decrypt-Password $KUpassword
                                                                                    $pcount2 = $pcount - 1
                                                                                    } 
                                                                              } 
                                                               }                                 
                          }

}                     
                 
}
