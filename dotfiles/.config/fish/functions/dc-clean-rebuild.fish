function dc-clean-rebuild --description "Clean docker container, then rebuild with docker-compose"
  docker container prune -f
  docker image prune -f
  docker-compose up -d --force-recreate --build $argv
end
