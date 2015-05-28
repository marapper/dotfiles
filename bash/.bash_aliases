alias vvcd="cd vendor_composer/"
alias pamm_install="sudo rm -rf app/var/cache/* && sudo setfacl -dR -m u:www-data:rwx -m u:sbondar:rwx app/var && sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX app/var && composer install"

alias assetsWatch="sudo rm -rf app/var/cache/* web/compiled/* && symfony assets:install --symlink web && sudo chmod -R 777 app/var && symfony assetic:dump --force -v --watch"
alias assets="sudo rm -rf app/var/cache/* web/compiled/* && symfony assets:install --symlink web && sudo chmod -R 777 app/var && symfony assetic:dump --force -v"

alias reload='source ~/.bashrc'

#Personal Help
alias a?='cat /home/will/.alias.help'
alias f?='cat /home/will/.function.help'

#show most popular commands
alias top-commands='history | awk "{print $2}" | awk "BEGIN {FS="|"} {print $1}" |sort|uniq -c | sort -rn | head -10'

alias gitbran='echo -e "\e[91mContains current branch\e[0m" && git br -v --contains && echo -e "\e[91mNo merged\e[0m" && git br -v --no-merged && echo -e "\e[91mMerged\e[0m" && git br --merged| tail -n +2 | sort -V | tr -d "\n"  && echo ""'

#remove all merged branches
alias gitclean='git branch -r --merged | grep PAMM- | sed 's/origin\///' | xargs -I# git push origin :#'

#what most people want from od (hexdump)
alias hd='od -Ax -tx1z -v'

alias bye='logout'
alias q="exit"

alias where="which"
alias what="apropos"
alias apr="apropos"
alias ff="find . -type f -name"

alias clip='xclip -sel clip'

alias coffee='(sleep 270 && zenity --info --title="coffee" --text="Coffee ready\!") &'


alias numfiles="echo $(ls -1 | wc -l)"

alias scr='screen -r'

alias line='sed -n '\''\!:1 p'\'' \!:2' # line 5 file => show line 5 of file

alias h='history'

alias grep='grep --color=auto'

alias ls='ls -G -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'
#alias l='ls -lGaph'
#alias ll='ls -lagG \!* | more'

alias zipru='convmv --notest -r -f cp-1252 -t cp-850 . | convmv --notest -r -f cp-866 -t utf-8 .'

alias gtree='git log --graph --full-history --all --color --pretty=format:"%x1b[33m%h%x09%x09%x1b[32m%d%x1b[0m %x1b[34m%an%x1b[0m %s" "$@"'

alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias which="type -path"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

alias apache-restart='sudo service httpd reload'

#alias geeknote='python ~/soft/geeknote/geeknote.py'
#alias geeknote-find='geeknote find -cn 200 -s '
#alias note='geeknote show '
#alias notefind='geeknote-find'

alias symfony='php app/console'

# Bash Directory Bookmarks                                                                                                                                              
alias m1='alias g1="cd `pwd`"'                                                                                                                                          
alias m2='alias g2="cd `pwd`"'                                                                                                                                          
alias m3='alias g3="cd `pwd`"'                                                                                                                                          
alias m4='alias g4="cd `pwd`"'                                                                                                                                          
alias m5='alias g5="cd `pwd`"'                                                                                                                                          
alias m6='alias g6="cd `pwd`"'                                                                                                                                          
alias m7='alias g7="cd `pwd`"'                                                                                                                                          
alias m8='alias g8="cd `pwd`"'                                                                                                                                          
alias m9='alias g9="cd `pwd`"'                                                                                                                                          
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'                                                                                             
alias ah='(echo;alias | grep  "g[0-9]" | grep -v "m[0-9]" | cut -d" " -f "2,3"| sed "s/=/   /" | sed "s/cd //";echo)'

alias a='fasd -a'        # any
#alias s='fasd -si'       # show / search / select
#alias d='fasd -d'        # directory
#alias f='fasd -f'        # file
#alias sd='fasd -sid'     # interactive directory selection
#alias sf='fasd -sif'     # interactive file selection
#alias j='fasd_cd -d'     # cd, same functionality as j in autojump
#alias jj='fasd_cd -d -i'

alias edit='nano'
alias nano='nano -W -m'
alias wget='wget -c'
alias n='f -e nano'
alias sn='sudo f -e nano'
