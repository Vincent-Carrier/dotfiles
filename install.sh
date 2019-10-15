sudo apt-get install build-essential curl file git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc
brew install lf hub ruby-full nvim tmux fzf stow zplug
git clone https://github.com/Vincent-Carrier/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd dotfiles
stow main
source ~/.zshrc
