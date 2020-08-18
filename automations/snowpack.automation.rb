SCRIPT_REGEX = /"scripts": {(\s+".*,?)*/

def add_snowpack_config
  create_file "snowpack.config.json" do
    <<~JSON
      {
        "extends": "bridgetown-snowpack-base",
        "plugins": [
          [
            "@snowpack/plugin-run-script",
            {
              "cmd": "sass src/css:public/css --no-source-map",
              "watch": "$1 --watch"
            }
          ]
        ]
      }
    JSON
  end
end

def add_scripts
  inject_into_file("package.json", after: SCRIPT_REGEX) do
    <<~JSON
      ,
      "serve": "bundle exec bridgetown serve",
      "snowpack-dev": "NODE_ENV=development snowpack dev",
      "bridgetown-build": "BRIDGETOWN_ENV=production bundle exec bridgetown build",
      "snowpack-build": "BRIDGETOWN_ENV=production NODE_ENV=production snowpack build",
      "deploy": "yarn snowpack-build",
      "start": "yarn snowpack-dev"
    JSON
  end
end

def add_packages
  packages = "snowpack bridgetown-snowpack-base"
  system("yarn add -D #{packages}")
end

add_snowpack_config
add_scripts
add_packages
