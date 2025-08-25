#Linux (WSL)
## Configurar Bash y .dotfiles
Instalar Homebrew.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Instalar Fish.
```bash
which fish
echo /path/to/fish | sudo tee -a /etc/shells
chsh -s /path/to/fish
```
Poner los enlaces simbólicos en el WSL .
```bash
#Borrar los archivos default
rm ~/.config/fish/config.fish
rm ~/.config/fastfetch/config.jsonc
rm ~/.vscode-server/extensions/extensions.json
rm ~/.config/.vscode/settings.json
rm ~/.config/typioca/typioca.conf

#Enlaces simbolicos
ln -s /mnt/c/.dotfiles ~/
ln -s /mnt/c/.dotfiles/config.fish ~/.config/fish/
ln -s /mnt/c/.dotfiles/config.jsonc ~/.config/fastfetch/
ln -s /mnt/c/.dotfiles/extensions.json ~/.vscode-server/extensions/
ln -s /mnt/c/.dotfiles/settings.json ~/.config/.vscode/
ln -s /mnt/c/.dotfiles/typioca.conf ~/.config/typioca
```
---
#Windows
## Configurar PowerShell
Instalar desde la tienda la app PowerShell y ejecutar el comando.
```PowerShell
$PROFILE
```
Para tener la ruta del archivos y crear el acceso directo con el comando.
```PowerShell
#Si existe utilizar
Remove-Item -Path C:\Users\info\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
Remove-Item -Path C:\ProgramData\fastfetch\config.jsonc

#Si no existe directamente hacer el link
New-Item -ItemType SymbolicLink -Path "Ruta\del\archivo\Microsoft.PowerShell_profile.ps1" -Value "C:\.dotfiles\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink -Path "C:\ProgramData\fastfetch\config.jsonc" -Value "C:\.dotfiles\config.jsonc"

#Quiza requiera ejecutarse como administrador
start-Process powershell -Verb runas 
```