# Include this; file in .bash_profile with:
# [[ -r ~/.profile ]] && . ~/.profile
# Write installation path info in .bash_profile 

clear; echo
hour=`date +%H`
if [ "$hour" -lt 7 ]; then echo -n "Good Early Morning, "
elif [ "$hour" -lt 12 ]; then echo -n "Good Morning, "
elif [ "$hour" -lt 18 ]; then echo -n "Good Afternoot, "
else echo -n "Good Evening, "; fi 
echo -n "sir. "
# # use case instead of elif later
let rand=$RANDOM%12
if [ $rand -le 1 ]; then echo "How can I help you? "
elif [ $rand -le 2 ]; then echo "Welcome back. "
elif [ $rand -le 3 ]; then echo "What can I do for you? "
elif [ $rand -le 4 ]; then echo "Can I help you?"
elif [ $rand -le 5 ]; then echo "Everything's going well, I hope. "
elif [ $rand -le 6 ]; then echo "Such a lovely day, isn't it! "
elif [ $rand -le 7 ]; then echo "Pleasant day, isn't it! "
elif [ $rand -le 8 ]; then echo "What a pleasant day it is! "
elif [ $rand -le 9 ]; then echo "Good to have you back. "
elif [ $rand -le 10 ]; then echo "Glad to see you back. "
else echo "Frederic at you service. "; fi
echo
# s/^.*if .* \(\d\) .* then/\1)/
let rand=($RANDOM*$RANDOM)%12
if [ $rand -le 1 ]; then face="^_^"
elif [ $rand -le 2 ]; then face="^-^"
elif [ $rand -le 3 ]; then face="\(n_n\)/~"
elif [ $rand -le 4 ]; then face="p\( ^ O ^ \)q "
elif [ $rand -le 5 ]; then face="↖\(^ω^\)↗ "
elif [ $rand -le 6 ]; then face="O\(∩_∩\)O~~"
elif [ $rand -le 7 ]; then face="\(￣▽￣\)"
elif [ $rand -le 8 ]; then face="\(^_^\)"
elif [ $rand -le 9 ]; then face="\(＾▽＾\)"
elif [ $rand -le 10 ]; then face="~~~^_^~~~ "
else face="Y^o^Y "; fi
alias itis="echo $face; echo"


alias goto=cd
alias ls="echo; ls"

#export PATH=/usr/local/bin:~/bin:$PATH
PS1="I want to "
