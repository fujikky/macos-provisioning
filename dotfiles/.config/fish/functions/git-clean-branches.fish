function git-clean-branches --no-scope-shadowing --description="Delete all fully merged local and remote branches"
    argparse -n git-clean-branches 'd/dry-run' 'b/branch=' -- $argv
    or return 1

    set ROOT_BRANCH (gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name')
    echo -e "\e[2m> git switch $ROOT_BRANCH\e[0m"
    git switch $ROOT_BRANCH

    # Make sure we're working with the most up-to-date version of main.
    git fetch
    echo -e "\e[2m> git fetch\e[0m"

    git pull
    echo -e "\e[2m> git pull\e[0m"

    # Prune obsolete remote tracking branches. These are branches that we
    # once tracked, but have since been deleted on the remote.
    git remote prune origin
    echo -e "\e[2m> git remote prune origin\e[0m"

    # List all the branches that have been merged fully into main, and
    # then delete them. We use the remote main here, just in case our
    # local main is out of date.
    # echo -e "\e[2m> gh poi\e[0m"
    # gh poi

    if set -lq _flag_b
      if git rev-parse --verify $_flag_b &> /dev/null || git rev-parse --verify origin/$_flag_b &> /dev/null
        echo -e "\e[2m> git switch $_flag_b\e[0m"
        git switch $_flag_b
      else
        echo -e "\e[2m> git switch -c $_flag_b\e[0m"
        git switch -c $_flag_b
      end
    end

    echo -e "\e[92mDone!\e[0m"
end
