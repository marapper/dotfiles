Для красивой командной строки в ~/.bashrc

PS1='\[\033[0;31m\]\w\[\033[0;33m\]$(__git_ps1)\[\e[0m\]$ '


Станет

/srv/my-ru (PAMMSIX-113)$ 

Т.е без юзера и т.п, только прямой путь, если есть гит то будет ветка