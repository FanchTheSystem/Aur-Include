# Aur-Include
Shell Function To Manage Aur(ArchLinux) Package Update

You must have an accound on aur : https://aur.archlinux.org/login/

You must have your ssh key authorized, see : https://wiki.archlinux.org/index.php/Arch_User_Repository#Authentication

This script will create an ~/AUR directory where clone of your aur package are stored.

You should add this alias in your .bashrc :

```shell
alias aur_source='. ~/Aur-Include/aur.include.sh'
```


# Example
Clone a package :
```
aur_clone x-tile-git
```

Make a package :
```
aur_make x-tile-git
```

Clone and Make Package :
```
aur_clone_make x-tile-git
```

Go in clonned directory :
```
aur_go x-tile-git
```

Add a file (adding x-tile-git.install for x-tile-git package (it should exist before)
```
aur_git_add x-tile-git x-tile-git.install
```

Remove a file :
```
aur_git_rm x-tile-git x-tile-git.install
```

Add PKGBUILD and  .SRCINFO (Mandatory for any aur package)
```
aur_git_add_pkg x-tile-git
```

Commit your change
```
aur_git_commit x-tile-git
#or
aur_git_commit x-tile-git 'new Version'
```

Clean your ~/AUR directory :
```
aur_clean
```
