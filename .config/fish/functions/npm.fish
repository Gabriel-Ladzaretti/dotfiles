function npm
    if test (count $argv) -gt 0
        switch $argv[1]
            case install ci
                set -lx NODE_OPTIONS "--max-old-space-size=4096"
        end
    end
    command npm $argv
end
