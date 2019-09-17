alias emacs="emacs -nw"
alias emacsq="emacs -nw -q"

alias sshfs_ads_6955='sudo sshfs -o reconnect -C  -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa akshdorw@sjc-ads-6955:/nobackup/akshdorw/ /Users/akshdorw/Desktop/sjc-ads-6955'
alias sshfs_ads_6551='sudo sshfs -o reconnect -C -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa akshdorw@sjc-ads-6551:/nobackup/akshdorw/ /Users/akshdorw/Desktop/sjc-ads-6551'
alias sshfs_ads_3571='sudo sshfs -o reconnect -C -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa akshdorw@sjc-ads-3517:/nobackup/mayc/ /Users/akshdorw/Desktop/sjc-ads-3571'


alias umount_ads_6955='sudo hdiutil eject -force Desktop/sjc-ads-6955'
alias umount_ads_6551='sudo hdiutil eject -force Desktop/sjc-ads-6551'

alias mosh_6955='mosh --server="/ws/damferna-sjc/share/mosh-server" sjc-ads-6955'
alias mosh_6551='mosh --server="/ws/damferna-sjc/share/mosh-server" sjc-ads-6551'
alias mosh_vtp='mosh vcat9k@172.20.50.17'
