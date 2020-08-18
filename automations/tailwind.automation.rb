def add_packages
  system("yarn add -D tailwindcss postcss-import")
end

def add_tailwind_config
  system("yarn tailwindcss init")
end

def add_postcss
  create_file "postcss.config.js" do
    <<~JS
      module.exports = {
        plugins: [
          require('postcss-import'),
          require('tailwindcss'),
          require('autoprefixer'),
        ]
      }
    JS
  end
end

def add_snowpack_config
  create_file "snowpack.config.json" do
    <<~JSON
    {
      "extends": "bridgetown-snowpack-base",
      "plugins": [
        [
          "@snowpack/plugin-build-script",
          {
            "cmd": "postcss",
            "input": [".css"],
            "output": [".css"]
          }
        ]
      ]
    }
    JSON
  end
end

def add_index_css
  create_file File.join("frontend", "styles", "index.css") do
    <<~CSS
      @import "tailwindcss/base";
      @import "tailwindcss/components";
      @import "tailwindcss/utilities";
    CSS
  end
end

def import_in_index_js
  javascript_import do
    <<~JS
      import "../styles"
    JS
  end
end

add_packages
add_tailwind_config
add_snowpack_config
add_postcss
add_index_css
import_in_index_js
