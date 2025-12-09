# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Load aliases
if [[ -f \/workspaces/web/profile ]]; then
  . \/workspaces/web/profile
fi

# NVM loading
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Write AWS Saml Credentials from Github Secret
function write_aws_saml_credentials {
    if [[ ! -z "${ROVER_AWS_SAML_HELPER_CREDENTIALS:-}" ]]; then
        mkdir -p $HOME/.aws
        echo $ROVER_AWS_SAML_HELPER_CREDENTIALS | base64 -d > $HOME/.aws/credentials
    fi
}
# Write credentials on load if possible
write_aws_saml_credentials

# Personal SSH key sync (used for replica access)
if [ -n "${PERSONAL_SSH_KEY}" ]
then
   printenv PERSONAL_SSH_KEY > ~/.ssh/id_rsa
fi

# In case it wasn't created before, for syncing AWS creds
mkdir -p $HOME/.aws