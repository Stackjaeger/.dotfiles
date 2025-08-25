if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
oh-my-posh init fish --config /home/stackjaeger/.dotfiles/atomic.omp.json | source
fastfetch