function vlt_login_ls
    set -l output 
    set output (vlt ls -P 2>/dev/null)

    if test $status -ne 0
        vlt login
        or return 1

        set output (vlt ls -P)
        or return 1
    end

    printf "%s\n" $output | fzf --header-lines=1 | awk '{print $1}' | xargs -r vlt show -c --id
end

function vlt
    if test "$argv[1]" = "lls"
        vlt_login_ls 
        return
    end

    command vlt $argv
end

