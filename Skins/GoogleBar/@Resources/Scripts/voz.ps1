# GoogleBar: abre Google en Chrome y activa la busqueda por voz (Ctrl + Mayus + .)
# Si tu PC tarda en cargar Chrome, sube este valor (milisegundos):
$Espera = 2500

Add-Type -Namespace GB -Name Win -MemberDefinition @'
[DllImport("user32.dll")] public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
[DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);
'@

# google.com (no la Nueva pestana): asi el foco queda en la caja de busqueda
# de la pagina y no en la barra de direcciones, que era lo que fallaba
Start-Process "chrome.exe" "https://www.google.com/?hl=es"
Start-Sleep -Milliseconds $Espera

# Asegura que Chrome esta en primer plano antes de pulsar el atajo
$chrome = Get-Process chrome -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowHandle -ne 0 } | Select-Object -First 1
if ($chrome) { [GB.Win]::SetForegroundWindow($chrome.MainWindowHandle) | Out-Null; Start-Sleep -Milliseconds 200 }

$CTRL = 0x11; $SHIFT = 0x10; $DOT = 0xBE; $UP = 2
[GB.Win]::keybd_event($CTRL,  0, 0,   [UIntPtr]::Zero)
[GB.Win]::keybd_event($SHIFT, 0, 0,   [UIntPtr]::Zero)
[GB.Win]::keybd_event($DOT,   0, 0,   [UIntPtr]::Zero)
Start-Sleep -Milliseconds 50
[GB.Win]::keybd_event($DOT,   0, $UP, [UIntPtr]::Zero)
[GB.Win]::keybd_event($SHIFT, 0, $UP, [UIntPtr]::Zero)
[GB.Win]::keybd_event($CTRL,  0, $UP, [UIntPtr]::Zero)
