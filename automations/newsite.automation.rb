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
  Cypress: "https://github.com/ParamagicDev/bridgetown-automation-cypress",
}

automations.each do |name, url|
  pull(name.to_s, url)
end

def remove_webpack_files
  files = [
    File.join("frontend", "styles", "index.scss"),
    "sync.js",
    "start.js",
    "webpack.config.js"
  ]
  files.each { |file| FileUtils.rm_rf(file) }
end

def remove_webpack_packages
  packages = [
    "@babel/core",
    "@babel/plugin-proposal-class-properties",
    "@babel/plugin-proposal-decorators",
    "@babel/plugin-transform-runtime",
    "@babel/preset-env",
    "babel-loader",
    "browser-sync",
    "concurrently",
    "css-loader",
    "file-loader",
    "mini-css-extract-plugin",
    "node-sass",
    "sass-loader",
    "style-loader",
    "webpack",
    "webpack-cli",
    "webpack-manifest-plugin"
  ]
  run "yarn remove #{packages.join(' ')}"
end

remove_index_scss
remove_webpack_files
remove_webpack_packages
