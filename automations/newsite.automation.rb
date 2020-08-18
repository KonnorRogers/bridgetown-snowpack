def pull(name, url)
  say "Adding #{name}", :blue
  run "bundle exec bridgetown apply #{url}"
end

automations = {
  Tailwind: "",
  Stimulus: "https://github.com/ParamagicDev/bridgetown-automation-stimulus",
  Turbolinks: "https://github.com/ParamagicDev/bridgetown-automation-turbolinks",
  Docker: "https://github.com/ParamagicDev/bridgetown-automation-docker-compose",
  Cypress: "https://github.com/ParamagicDev/bridgetown-automation-cypress",
}

automations.each do |name, url|
  pull(name.to_s, url)
end
