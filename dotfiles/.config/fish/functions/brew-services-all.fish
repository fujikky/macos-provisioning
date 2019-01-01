function brew-services-all --argument-names command services --description "All brew services command wrapper"
  echo "command: $command"
  echo "services: $services"
  if count $services > /dev/null
    for service in $services
      brew services $command $service
    end
  else
    brew services list | tail -n +2 | awk '{print $1}' | xargs -n 1 brew services $command
  end
end
