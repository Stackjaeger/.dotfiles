set -g fish_greeting ''

# --- Si es sesión interactiva ---
if status is-interactive
    # Puedes añadir más comandos interactivos aquí
end

# --- Inicializar Homebrew (Linuxbrew) ---
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# --- Inicializar Oh My Posh ---
oh-my-posh init fish --config /home/stackjaeger/.atomic.omp.json | source

# --- Mostrar fastfetch --
fastfetch