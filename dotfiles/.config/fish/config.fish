
if test -e ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

switch (uname)
case Darwin
    if test -e ~/.config/fish/os/osx.fish
        source ~/.config/fish/os/osx.fish
    end
case Linux
    if test -e ~/.config/fish/os/linux.fish
        source ~/.config/fish/os/linux.fish
    end
end
