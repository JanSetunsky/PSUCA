$GetGlobalFilePaths = {

    
    <# PROCESS WINDOW STYLE REQUIREMENT FILEPATH #>
    $global:PUCollectorDataFilePath = "d:\BinBot\taskcenter\server\collector_data\"
    <# PROCESS WINDOW STYLE REQUIREMENT FILEPATH CREATE #>
    if(test-path $PUCollectorDataFilePath){

    }
    else{
        new-item -ItemType Directory $PUCollectorDataFilePath
    }              


    <# PROCESS WINDOW STYLE REQUIREMENT FILEPATH #>
    $global:dataProcessWindowStyleRequirementFilePath = "d:\BinBot\taskcenter\windowstyle\requirement\"
    <# PROCESS WINDOW STYLE REQUIREMENT FILEPATH CREATE #>
    if(test-path $dataProcessWindowStyleRequirementFilePath){

    }
    else{
        new-item -ItemType Directory $dataProcessWindowStyleRequirementFilePath
    }              


    <# TRANSCRIPT TERMINAL FILEPATH #>
    $global:dataTranscriptTerminalFilePath = "d:\BinBot\transcript\terminal\"
    <# TRANSCRIPT TERMINAL FILEPATH CEATE #>
    if(test-path $dataTranscriptTerminalFilePath){

    }
    else{
        new-item -ItemType Directory $dataTranscriptTerminalFilePath
    }      


    <# DATA TASK CENTER FILEPATH #>
    $global:dataTaskCenterFilePath = "d:\BinBot\taskcenter\"
    <# DATA TASK CENTER FILEPATH CREATE #>
    if(test-path $dataTaskCenterFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterFilePath
    }


    <# DATA TASK CENTER RUNSPACE FILEPATH #>
    $global:dataTaskCenterRunspaceFilePath = "d:\BinBot\taskcenter\runspace\"
    <# DATA TASK CENTER RUNSPACE FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceFilePath
    }


    <# DATA TASK CENTER RUNSPACE CONTROLLER FILEPATH #>
    $global:dataTaskCenterRunspaceControllerFilePath = "d:\BinBot\taskcenter\runspace\controller\"
    <# DATA TASK CENTER RUNSPACE CONTROLLER FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceControllerFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceControllerFilePath
    }    


    <# DATA TASK CENTER RUNSPACE DENIED FILEPATH #>
    $global:dataTaskCenterRunspaceDeniedFilePath = "d:\BinBot\taskcenter\runspace\denied\"
    <# DATA TASK CENTER RUNSPACE DENIED FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceDeniedFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceDeniedFilePath
    }
    
    
    <# DATA TASK CENTER RUNSPACE HISTORY FILEPATH #>
    $global:dataTaskCenterRunspaceHistoryFilePath = "d:\BinBot\taskcenter\runspace\history\"
    <# DATA TASK CENTER RUNSPACE HISTORY FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceHistoryFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceHistoryFilePath
    }
    
    
    <# DATA TASK CENTER RUNSPACE PROCESSING FILEPATH #>
    $global:dataTaskCenterRunspaceProcessingFilePath = "d:\BinBot\taskcenter\runspace\processing\"
    <# DATA TASK CENTER RUNSPACE PROCESSING FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceProcessingFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceProcessingFilePath
    }


    <# DATA TASK CENTER RUNSPACE QUEUE FILEPATH #>
    $global:dataTaskCenterRunspaceQueueFilePath = "d:\BinBot\taskcenter\runspace\queue\"
    <# DATA TASK CENTER RUNSPACE QUEUE FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceQueueFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceQueueFilePath
    }   
    
    
    <# DATA TASK CENTER RUNSPACE TERMINAL FILEPATH #>
    $global:dataTaskCenterRunspaceTerminalFilePath = "d:\BinBot\taskcenter\runspace\terminal\"
    <# DATA TASK CENTER RUNSPACE TERMINAL FILEPATH CREATE #>
    if(test-path $dataTaskCenterRunspaceTerminalFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterRunspaceTerminalFilePath
    }        


    <# DATA TASK CENTER TASK LIST FILEPATH #>
    $global:dataTaskCenterTaskListFilePath = "d:\BinBot\taskcenter\tasklist\"
    <# DATA TASK CENTER TASK LIST FILEPATH CREATE #>
    if(test-path $dataTaskCenterTaskListFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterTaskListFilePath
    }    


    <# DATA TASK CENTER DEFAULT PROCESS FILEPATH #>
    $global:dataTaskCenterDefaultProcessFilePath = "d:\BinBot\taskcenter\defaultprocess\"
    <# DATA TASK CENTER DEFAULT PROCESS FILEPATH CREATE #>
    if(test-path $dataTaskCenterDefaultProcessFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterDefaultProcessFilePath
    }
    
    
    <# DATA TASK CENTER SCRIPTS FILEPATH #>
    $global:dataTaskCenterScriptsFilePath = "d:\BinBot\taskcenter\scripts\"
    <# DATA TASK CENTER SCRIPTS FILEPATH CREATE #>
    if(test-path $dataTaskCenterScriptsFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterScriptsFilePath
    } 
    
    
    <# DATA TASK CENTER WINDOW STYLE FILEPATH #>
    $global:dataTaskCenterWindowStyleFilePath = "d:\BinBot\taskcenter\windowstyle\"
    <# DATA TASK CENTER WINDOW STYLE FILEPATH CREATE #>
    if(test-path $dataTaskCenterWindowStyleFilePath){

    }
    else{
        new-item -ItemType Directory $dataTaskCenterWindowStyleFilePath
    }         


    <# DATA RESULTS FILEPATH #>
    $global:dataResultsFilePath = "d:\BinBot\data\results\"
    <# DATA RESULTS FILEPATH CREATE #>
    if(test-path $dataResultsFilePath){

    }
    else{
        new-item -ItemType Directory $dataResultsFilePath
    }        


    <# TANSCRIPT FILEPATH #>
    $global:dataTranscriptFilePath = "d:\BinBot\transcript\"
    <# TANSCRIPT FILEPATH CREATE #>
    if(test-path $dataTranscriptFilePath){

    }
    else{
        new-item -ItemType Directory $dataTranscriptFilePath
    }        


    <# EXCHANGE INFO TANSCRIPT FILEPATH #>
    $global:dataExchangeInfoTranscriptFilePath = "d:\BinBot\transcript\exchangeInfoProcess\"
    <# EXCHANGE INFO TANSCRIPT FILEPATH CREATE #>
    if(test-path $dataExchangeInfoTranscriptFilePath){

    }
    else{
        new-item -ItemType Directory $dataExchangeInfoTranscriptFilePath
    }   
    
    
    <# WALLET TANSCRIPT FILEPATH #>
    $global:dataWalletTranscriptFilePath = "d:\BinBot\transcript\walletProcess\"
    <# WALLET TANSCRIPT FILEPATH CREATE #>
    if(test-path $dataWalletTranscriptFilePath){

    }
    else{
        new-item -ItemType Directory $dataWalletTranscriptFilePath
    }        


    <# PWSH TANSCRIPT FILEPATH #>
    $global:dataPwshTranscriptFilePath = "d:\BinBot\transcript\pwshProcess\"
    <# PWSH TANSCRIPT FILEPATH CREATE #>
    if(test-path $dataPwshTranscriptFilePath){

    }
    else{
        new-item -ItemType Directory $dataPwshTranscriptFilePath
    }    


    <# PS1 RS JOBS FILEPATH #>
    $global:dataPs1RsJobFilePath = "d:\BinBot\scripts\"
    <# PS1 RS JOBS FILEPATH CREATE #>
    if(test-path $dataPs1RsJobFilePath){

    }
    else{
        new-item -ItemType Directory $dataPs1RsJobFilePath
    }
 

    <# CURRENCY REAL WALLET FILE FILEPATH #>
    $global:dataRealCurrencyWalletFilePath = "d:\BinBot\data\currencyRealWallet\"
    <# MAIN REAL WALLET DIRECTORY CREATE #>
    if(test-path $dataRealCurrencyWalletFilePath){

    }
    else{
        new-item -ItemType Directory $dataRealCurrencyWalletFilePath
    }


    <# EXCHANGE INFO FILEPATH #>
    $global:dataExchangeInfoFilePath = "d:\BinBot\data\exchangeInfo\"
    <# EXCHANGE INFO FILEPATH CREATE #>
    if(test-path $dataExchangeInfoFilePath){

    }
    else{
        new-item -ItemType Directory $dataExchangeInfoFilePath
    }


    <# WALLET FILEPATH #>
    $global:dataWalletFilePath = "d:\BinBot\data\wallets\"
    <# WALLET FILEPATH CEATE #>
    if(test-path $dataWalletFilePath){

    }
    else{
        new-item -ItemType Directory $dataWalletFilePath
    }      
    
}

$DataRunspacePath        = 'd:\PSUCA\database\dev\modules\taskcenter\runspace\data-runspace.json'
$DataNotificationPath    = 'd:\PSUCA\database\dev\modules\taskcenter\runspace\data-notification.json'



$GetGlobalFilePaths|iex
