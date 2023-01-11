
                                                                    $global:terminalWindowStyle = 'normal'
                                                                    [string]$uniqueId = [guid]::NewGuid().Guid
                                                                    $command = (
@'
                                                                    $transcriptFileName = 'uniqueid'+'-'+"$PID"+'.txt'
                                                                    $global:TerminalProcessId = 'uniqueid'
                                                                    Start-Transcript -Path ("transcriptFilePath"+"$transcriptFileName") -Append
                                                                    $global:RootAppDirectory   = 'importrootappdirectory'
                                                                    $global:RootControllerType = 'importrootcontrollertype'                                                                    
                                                                    ."importterminalscriptpath"
                                                                    Stop-Transcript
'@ -replace 'importterminalscriptpath','d:\PSUCA\engine\controller\dev\modules\taskcenter\scripts\terminal.ps1' -replace 'transcriptFilePath','d:\PSUCA\database\dev\modules\taskcenter\transcript\terminal\' -replace 'importrootappdirectory','d:\PSUCA\' -replace 'importrootcontrollertype','dev') -replace 'uniqueid',"$uniqueId"
                                                                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                                                                    $encodedCommand = [Convert]::ToBase64String($bytes)
                                                                    $arg = "-NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                                                                    $proc = Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -argumentlist $arg -PassThru
                                                                    $procPID = $proc.Id
                                                                    $TerminalProcessId = $uniqueId
                                                                    $uniqueId = $null
                                                                    $terminalProcessDetail = {
                                                                        $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'"
                                                                        $dataTranscriptFilePath = 'd:\PSUCA\database\dev\modules\taskcenter\transcript\runspace\'
                                                                        foreach ($item in $items) {
                                                                            #get owner
                                                                            $owner = Invoke-CimMethod -InputObject $item -MethodName GetOwner
                                                                            $parent = Get-Process -Id $item.ParentprocessID
                                                                            if((gci $dataTranscriptFilePath -Filter ("$TerminalProcessId"+'*') -Recurse).Length -gt 0){
                                                                                $status = 'Completed'
                                                                                $lastAccessTime = (gci $dataTranscriptFilePath -Filter ("$TerminalProcessId"+'*') -Recurse).LastAccessTime
                                                                            }
                                                                            else{
                                                                                $status = 'Running'
                                                                            }
                                                                            $processDetail = [PSCustomObject]@{
                                                                                PSTypename      = "PowerShellProcess"
                                                                                ProcessID       = $item.ProcessID
                                                                                Name            = $item.Name
                                                                                ScriptName      = 'analysisexchangeinfo'
                                                                                Status          = $status
                                                                                Handles         = $item.HandleCount
                                                                                WorkingSet      = $item.WorkingSetSize
                                                                                ParentProcessID = $item.ParentProcessID
                                                                                ParentProcess   = $parent.Name
                                                                                ParentPath      = $parent.Path
                                                                                Started         = $item.CreationDate
                                                                                Ended           = $lastAccessTime
                                                                                Owner           = "$($owner.Domain)\$($owner.user)"
                                                                                CommandLine     = $item.Commandline
                                                                            }
                                                                        }
                                                                    }
                                                                    $terminalProcessDetail|iex

                                                                    $dataTaskCenterRunspaceTerminalFilePath = 'd:\PSUCA\database\dev\modules\taskcenter\runspace\terminal\'
                                                            
                                                                    if($dataTaskCenterRunspaceTerminalFilePath){
                                                                        $dataTaskCenterRunspaceTerminalFilePathJsonString = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$TerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                                                                        $Save = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal'+'.json') -Value $dataTaskCenterRunspaceTerminalFilePathJsonString -Force
                                                                        $processDetailToJson = $processDetail | ConvertTo-Json
                                                                        if(Test-Path ("$dataTaskCenterRunspaceTerminalFilePath"+'terminalProcessDetails'+'.json')){
                                                                            $Save = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminalProcessDetails'+'.json') -Value $processDetailToJson -Force
                                                                        }
                                                                        else{
                                                                            $New = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminalProcessDetails'+'.json') -Value $processDetailToJson -Force
                                                                        }
                                                                    }
                                                                