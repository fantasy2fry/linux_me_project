# linux_me_project

## How have we gathered the data?

### System installed packages:
For debian based linux distros:
```bash
apt list --installed > installed_packages.txt
```
or
```bash
dpkg -l > installed_packages.txt
```

For arch linux based linux distros:
```bash
pacman -Q > installed_packages.txt
```

### Commands history:
```bash
history > file.txt
```

### Python packages:
```bash
pip freeze > file.txt
```
