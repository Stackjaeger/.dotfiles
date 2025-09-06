# Linux (WSL)
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
Instalar stow
```bash
homebrew install stow
```
Copiar el repositorio local preferiblemente en el $HOME/.dotfiles 
*En caso de estar en WSL agregar el symlink y poner la carpeta .dotfiles en C:* 
```bash
ln -s /mnt/c/.dotfiles ~/
``` 
Ejecutar stow para crear los enlaces simbolicos 
```bash
cd ~/.dotfiles
stow -t ~ linux #en caso de error agregar --adopt
stow -t ~ comun #en caso de error agregar --adopt
```
---
# Windows
## Configurar PowerShell
Instalar desde la tienda la app PowerShell y ejecutar el comando.
```PowerShell
$PROFILE
```
Para tener la ruta del archivos y crear el acceso directo con el comando.
```PowerShell
#Si existe utilizar
Remove-Item -Path $($env:USERPROFILE)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
Remove-Item -Path $($env:USERPROFILE)\.config\fastfetch\config.jsonc
Remove-Item -Path $($env:USERPROFILE)\.gitconfig

#Si no existe directamente hacer el link
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\.config\fastfetch\config.jsonc" -Value "C:\.dotfiles\linux\.config\fastfetch\config.jsonc"
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "C:\.dotfiles\windows\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink -Path "$($env:USERPROFILE)\.gitconfig" -Value "C:\.dotfiles\comun\.gitconfig"

#Quiza requiera ejecutarse como administrador
start-Process powershell -Verb runas 
```