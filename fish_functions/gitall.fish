function gitall
    git add .
    git commit -m $argv
    git push origin HEAD
end