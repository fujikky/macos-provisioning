# git-clean-branches
#
# * Will delete all fully merged local branches
#   and any closed remote branches.
# * User is prompted to continue before deleting.
# * Pass in -d or --dry-run to see what would happen without changing anything
#
# Credit to Rob Miller <rob@bigfish.co.uk>
# Adapted from the original by Yorick Sijsling
# See: https://gist.github.com/robmiller/5133264
# Author John Schank
# Errors are mine, use at your own risk.

function git-clean-branches --description="Delete all fully merged local and remote branches"
    for option in $argv
        switch "$option"
            case -d --dry-run
                set DRY_RUN true
            case \*
                printf "Error: unknown option %s\n" $option
        end
    end

    #  Make sure we're on master first
    git checkout develop > /dev/null ^&1
    if test $status -eq 0
      set ROOT_BRANCH "develop"
      echo -e "\e[2m> git checkout develop\e[0m"
    else
      git checkout master > /dev/null ^&1
      set ROOT_BRANCH "master"
      echo -e "\e[2m> git checkout master\e[0m"
    end

    # Make sure we're working with the most up-to-date version of master.
    git fetch
    echo -e "\e[2m> git fetch\e[0m"

    git pull
    echo -e "\e[2m> git pull\e[0m"

    # Prune obsolete remote tracking branches. These are branches that we
    # once tracked, but have since been deleted on the remote.
    git remote prune origin
    echo -e "\e[2m> git remote prune origin\e[0m"

    # List all the branches that have been merged fully into master, and
    # then delete them. We use the remote master here, just in case our
    # local master is out of date.
    set -l MERGED_LOCAL (git branch --merged origin/$ROOT_BRANCH | grep -v 'master$' | grep -v 'develop$' | string trim)
    if test -n "$MERGED_LOCAL"
        echo
        echo "The following local branches are fully merged and will be removed:"
        echo $MERGED_LOCAL
        read --local --prompt-str "Continue (y/N)? " REPLY
        if test "$REPLY" = "y"
            for branch in $MERGED_LOCAL
                if test $DRY_RUN
                    echo "Would delete local branch: '$branch'"
                else
                    echo "Deleting local branch: '$branch'"
                    git branch --quiet --delete $branch
                end
            end
        end
    end

    echo -e "\e[92mDone!\e[0m"
end
