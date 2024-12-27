#!/usr/bin/env fish

set root (ghq root)
for repo in (ghq list)
    set repo "$root/$repo"
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
