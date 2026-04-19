function bb
    if contains -- -c $argv; or contains -- -lc $argv
        env NO_FISH=1 bash $argv
    else
        env NO_FISH=1 bash -i $argv
    end
end
