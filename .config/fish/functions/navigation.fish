function ..
  if test -z $argv[1]
    set n 1
  else
    set n $argv[1]
  end
  for i in (seq $n)
    cd ..
  end
end

function mkcd
  mkdir $argv[1] -p
  if test -d "$argv[1]"
    cd $argv[1]
  end
end