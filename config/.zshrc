# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alejandro/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#PROMPT="$fg[green]%}$USER@%{$fg[blue]%}%m ${PROMPT}"
alias r="/usr/bin/bash ~/.config/i3/save_layouts.sh && sudo reboot now"
alias s="/usr/bin/python3 /home/alejandro/projects/linkedin_bot/regio.py && /usr/bin/bash ~/.config/i3/save_layouts.sh && sudo shutdown now"
alias i3c="nano .config/i3/config"
alias gcp="cd /home/alejandro/Documents/lost_data && git add . && git commit -m '1' && git push origin master && cd -"

alias php_composer='docker exec -it shopify_app_php composer' 
alias php_migrate='docker exec --user $(id -u):$(id -g) -it shopify_app_php php vendor/bin/phinx' 
alias php_style='docker exec -it php-taxiserv.ddk php vendor/bin/phpcs' 
alias php_unit='docker exec -it php-taxiserv.ddk php vendor/bin/phpunit -c unittests/phpunit.xml --log-junit phpunit_junit.xml --verbose'
alias php_psalm='docker exec -it php-taxiserv.ddk php vendor/vimeo/psalm/psalm'
alias dphp='docker exec -it shopify_app_php php'

#/usr/bin/bash ~/.config/i3/keepassxc.sh


#--------
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
#-----------
#source $HOME/.config/i3/ssh.sh

alias tnt='docker exec -it tarantool_ccp.ddk console'
alias tnt_res='docker stop tarantool_ccp.ddk && docker start tarantool_ccp.ddk'
alias ssh_tunnel='ssh -N -D 5005 personal_jesus'
alias virtual='sudo modprobe vboxdrv && sudo /sbin/virtualbox'
alias trio='datagrip & phpstorm & goland'
alias city='stop_d || ./projects/taxiserv-docker/run.sh'

function stop_d {
	docker container ls -q | awk '{print $1}' | xargs -o docker container stop
}

alias docker_stop="stop_d"

#eval $(thefuck --alias)

export GO_PATH=~/go
export PATH=$PATH:/$GO_PATH/bin
