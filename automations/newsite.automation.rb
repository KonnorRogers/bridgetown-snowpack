require "fileutils"

def pull(name, url)
  say "Adding #{name}", :blue
  run "bundle exec bridgetown apply #{url}"
end

automations = {
  Snowpack: "https://github.com/ParamagicDev/bridgetown-snowpack/blob/master/automations/snowpack.automation.rb",
  Tailwind: "https://github.com/ParamagicDev/bridgetown-snowpack/blob/master/automations/tailwind.automation.rb",
  Stimulus: "https://github.com/ParamagicDev/bridgetown-automation-stimulus",
  Turbolinks: "https://github.com/ParamagicDev/bridgetown-automation-turbolinks",
  Docker: "https://github.com/ParamagicDev/bridgetown-automation-docker-compose",
  Cypress: "https://github.com/ParamagicDev/bridgetown-automation-cypress",
}

automations.each do |name, url|
  pull(name.to_s, url)
end

def remove_index_scss
  FileUtils.rm_rf(File.join("frontend", "styles", "index.scss"))
end

remove_index_scss
