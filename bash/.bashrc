# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=



# User specific aliases and functions ---------------------------------------------------------

alias cslim="cd $HOME/test_centre/cslim"
alias dev="cd $HOME/test_centre/fitnesse/FitNesseRoot/TestCentre/Tests/DevelopmentTesting"
alias fat="cd $HOME/test_centre/fitnesse/FitNesseRoot/TestCentre/Tests/FAT"
alias fitnesse="cd $HOME/test_centre/fitnesse"
alias hgc="hg commit -u Dan -m"
alias master="cd $HOME/test_centre/fitnesse/FitNesseRoot/TestCentre/MasterCode"

alias killcslim="pgrep cslim | xargs kill -9"

# Makes vim load with custom configuration file by default
alias vim="vim -u ~/.danvimrc"

# tmux loads in a 256 colour supported, UTF-8 supported mode by default
alias tmux="tmux -u"
alias t="tmux -2 -u a"

# Allows increased ATF testing speed using PhantomJS rather than Firefox
PATH="$HOME/bin:$PATH:$HOME/test_centre/fitnesse/selenium/phantomjs-1.9.2-linux-x86_64/bin/"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


shopt -s histappend
PROMPT_COMMAND="history -a;history -n"
