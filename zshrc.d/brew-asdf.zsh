if command -v brew >/dev/null 2>&1; then
    if brew list asdf >/dev/null 2>&1; then
        . $(brew --prefix asdf)/libexec/asdf.sh
    fi
fi
  
