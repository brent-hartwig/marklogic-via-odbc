
function Get-URL {
  Param ($name, $url, $toFile)
  Write-Output "$($MyInvocation.InvocationName): Downloading '$url' to '$toFile'..."
  $stepStartTime = Get-Date
  (New-Object System.Net.WebClient).DownloadFile($url, $toFile)
  Complete-Process $? $MyInvocation.InvocationName $stepStartTime
}

function Invoke-MSI {
  Param ($name, $msiFile)
  Write-Output "$($MyInvocation.InvocationName): Running '$msiFile'..."
  $stepStartTime = Get-Date
  $dataStamp = Get-Date -Format yyyyMMddTHHmmss
  $logFile = '{0}-{1}.log' -f $msiFile.fullname,$dataStamp
  $msiArguments = @(
      "/i"
      ('"{0}"' -f $msiFile.fullname)
      "/qn"
      "/norestart"
      "/L*v"
      $logFile
  )
  Start-Process "msiexec.exe" -ArgumentList $msiArguments -Wait -NoNewWindow 
  Complete-Process $? $MyInvocation.InvocationName $stepStartTime
}

# Add support for arguments once needed.
function Invoke-EXE {
  Param ($name, $exeFile)
  Write-Output "$($MyInvocation.InvocationName): Running '$exeFile'..."
  $stepStartTime = Get-Date
  & "$exeFile"
  Complete-Process $? $MyInvocation.InvocationName $stepStartTime
}

function Complete-Process {
  Param ($successful, $opName, $startTime)
  if ($successful) {
    Write-Output "Successfully completed '$opName' in $((Get-Date).Subtract($startTime).Seconds) second(s)"
  } else {
    Write-Output "Failed to complete '$opName'"
    exit 1
  }
}

Export-ModuleMember -Function Get-URL, Invoke-MSI, Invoke-EXE
