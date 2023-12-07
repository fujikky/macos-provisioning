#!/usr/bin/env fish

for repo in (find $argv[1] -name ".git" -maxdepth 4 | xargs dirname)
    pushd $repo > /dev/null ^&1

    set changes (git status -uno | grep 'Your branch is ahead of')
    set branches (git branch -vv | grep -v '\[origin' | awk '{print $1}')

    if test -n "$changes"
        echo ""
        echo ""
        echo "Unpushed changes in $repo"
        echo $changes
    else if test -n "$branches"
        echo ""
        echo ""
        echo "Unpushed branches in $repo"
        echo $branches
    end

    popd > /dev/null ^&1
end
