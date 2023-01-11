
                                                                    $global:terminalWindowStyle = 'normal'
                                                                    [string]$uniqueId = [guid]::NewGuid().Guid
                                                                    $command = (
@'
                                                                    $transcriptFileName = 'uniqueid'+'-'+"$PID"+'.txt'
                                                                    $global:TerminalProcessId = 'uniqueid'
                                                                    $host.ui.RawUI.WindowTitle = 'uniqueid'
                                                                    Start-Transcript -Path ("transcriptFilePath"+"$transcriptFileName") -Append
                                                                    $global:RootAppDirectory   = 'importrootappdirectory'
                                                                    $global:RootControllerType = 'importrootcontrollertype'                                                                    
                                                                    ."importterminalscriptpath"
                                                                    Stop-Transcript
'@ -replace 'importterminalscriptpath','d:\PSUCA\engine\controller\dev\modules\taskcenter\scripts\main-terminal.ps1' -replace 'transcriptFilePath','d:\PSUCA\database\dev\modules\taskcenter\transcript\terminal\' -replace 'importrootappdirectory','d:\PSUCA\' -replace 'importrootcontrollertype','dev') -replace 'uniqueid',"$uniqueId"
                                                                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                                                                    $encodedCommand = [Convert]::ToBase64String($bytes)
                                                                    $arg = "/c pwsh.exe -NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                                                                    $proc = Start-Process cmd.exe -argumentlist $arg -PassThru
                                                                    $procPID = $proc.Id
                                                                    
                                                                    $TerminalProcessId = $uniqueId
                                                                    
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
                                                                                ScriptName      = 'MainRunspaceProcess'
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

                                                                    $dataTaskCenterRunspaceTerminalFilePath = 'd:\PSUCA\database\dev\modules\taskcenter\runspace\'+"$uniqueId"+'\'
                                                                    $uniqueId = $null
                                                                    if($dataTaskCenterRunspaceTerminalFilePath){
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'controller\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'denied\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'history\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'processing\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'queue\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'windowstyle\requirement\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'windowstyle\result\') -Force

                                                                        $TerminalJson = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$TerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                                                                        $ProcessJson  = $processDetail | ConvertTo-Json
                                                                        $NewFile      = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminal'+'.json') -Force
                                                                        $SaveContent  = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminal'+'.json') -Value $TerminalJson -Force
                                                                        $NewFile      = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminalProcessDetails'+'.json') -Force
                                                                        $SaveContent  = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminalProcessDetails'+'.json') -Value $ProcessJson -Force
                                                                    }
                                                                