

aur_go () {
    mkdir -p ~/AUR
    cd ~/AUR

    echo "Go To:" "$1"
    echo "Current:" $(pwd)
    
    res="ok"
    if [ -n "$1" ]
    then
	res="ko"
	if [ -d "$1" ]
	then
	    cd "$1"
            echo "Current:" $(pwd)
	    res="ok"
	fi
    fi

    echo "Res:" $res
    echo "Current:" $(pwd)
    
    if [ res == "ko" ]
    then
	kill -INT $$
        #exit 42
    fi
}

aur_clean () {
    rm -rf ~/AUR
}

aur_clone_make () {
    aur_clone $1
    aur_make $1
}

aur_clone () {
    aur_go
    echo "Clone:" "$1"
    git clone ssh+git://aur@aur.archlinux.org/"$1".git
}

aur_make () {
    aur_go "$1"
    echo "Make:" "$1"
    updpkgsums
    makepkg -c -f
    makepkg --printsrcinfo > .SRCINFO
    #    mksrcinfo
}



aur_git_commit () {
    aur_go "$1"
    
    msg="Update Version"
    if [ -n "$2" ]
    then
	msg="$2"
    fi
    echo "Commit:" "$1" "$msg"
    git commit -a -m "$msg"
    git push
}

aur_git_add () {
    aur_go "$1"
    if [ -e "$2" ] 
    then
	echo "Add:" "$2"
	git add "$2"
    fi
    
}

aur_git_add_pkg () {
    aur_go "$1"
    aur_git_add "$1" PKGBUILD 
    aur_git_add "$1" .SRCINFO
}


aur_git_rm () {
    aur_go "$1"
    
    if [ -e "$2" ] 
    then
	echo "Remove:" "$2"
	git rm "$2"
    fi
}



