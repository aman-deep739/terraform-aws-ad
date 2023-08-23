<<EOF
<powershell>
$interfaceIndex = (Get-NetAdapter | Where-Object {$_.Status -eq 'Up'}).ifIndex
$dnsServers = '172.31.26.21', '172.31.37.178'
Set-DnsClientServerAddress -InterfaceIndex $interfaceIndex -ServerAddresses $dnsServers
$securePassword = ConvertTo-SecureString -String 'P7BQFF&b5%Z3' -AsPlainText -Force
$credential = New-Object -TypeName PSCredential -ArgumentList "Admin", $securePassword
Add-Computer -DomainName 'amandevops.xyz' -Credential $credential -Restart
</powershell>
EOF