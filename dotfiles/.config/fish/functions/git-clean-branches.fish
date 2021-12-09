function git-clean-branches --no-scope-shadowing --description="Delete all fully merged local and remote branches"
    argparse -n git-clean-branches 'd/dry-run' 'b/branch=' -- $argv
    or return 1

    if git checkout develop &> /dev/null
      set ROOT_BRANCH "develop"
      echo -e "\e[2m> git checkout develop\e[0m"
    else if git checkout main &> /dev/null
      set ROOT_BRANCH "main"
      echo -e "\e[2m> git checkout main\e[0m"
    else if git checkout master &> /dev/null
      set ROOT_BRANCH "master"
      echo -e "\e[2m> git checkout master\e[0m"
    else
      echo -e "\e[31;1mError: git has uncommitted changes\e[m"
      return 1
    end

    # Make sure we're working with the most up-to-date version of main.
    git pull
    echo -e "\e[2m> git pull\e[0m"

    # Prune obsolete remote tracking branches. These are branches that we
    # once tracked, but have since been deleted on the remote.
    git remote prune origin
    echo -e "\e[2m> git remote prune origin\e[0m"

    # List all the branches that have been merged fully into master, and
    # then delete them. We use the remote master here, just in case our
    # local master is out of date.
    set -l MERGED_LOCAL (git branch --merged origin/$ROOT_BRANCH | grep -v 'main$' | grep -v 'master$' | grep -v 'develop$' | string trim)
    if test -n "$MERGED_LOCAL"
      echo
      echo "The following local branches are fully merged and will be removed:"
      echo $MERGED_LOCAL
      read --local --prompt-str "Continue (y/N)? " REPLY
      if test "$REPLY" = "y"
        for branch in $MERGED_LOCAL
          if set -lq _flag_d
            echo "Would delete local branch: '$branch'"
          else
            echo "Deleting local branch: '$branch'"
            git branch --quiet --delete $branch
          end
        end
      end
    end

    if set -lq _flag_b
      if git rev-parse --verify $_flag_b &> /dev/null
        echo -e "\e[2m> git switch $_flag_b\e[0m"
        git switch $_flag_b
      else
        echo -e "\e[2m> git switch -c $_flag_b\e[0m"
        git switch -c $_flag_b
      end
    end

    echo -e "\e[92mDone!\e[0m"
end
