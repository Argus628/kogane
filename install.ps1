# Definir rutas
$path = "$env:APPDATA\KoganeIA"
if (!(Test-Path $path)) { New-Item -ItemType Directory -Path $path -Force }

# Descargar el agente y el archivo de API Key
Invoke-WebRequest "https://raw.githubusercontent.com/Argus628/kogane/main/agent.py" -OutFile "$path\agent.py"
Invoke-WebRequest "https://raw.githubusercontent.com/Argus628/kogane/main/api.key" -OutFile "$path\api.key"

# Instalar dependencias necesarias
pip install pyserial google-generativeai pyautogui speechrecognition pyaudio

# Crear tarea programada para que inicie con Windows silenciosamente
$trigger = New-ScheduledTaskTrigger -AtLogOn
$action = New-ScheduledTaskAction -Execute 'python' -Argument "$path\agent.py"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "KoganeIA_Agent" -Force
Start-Process python "$path\agent.py" -WindowStyle Hidden

