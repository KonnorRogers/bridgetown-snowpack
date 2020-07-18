const fs = require("fs");
const path = require("path");

const cwd = process.cwd();

const scripts = {
  "mount:frontend": "mount frontend --to /_frontend_",
  "mount:output": "mount output --to /",
  "run:bridgetown": "bundle exec bridgetown build",
  "run:bridgetown::watch": "$1 --watch"
};

if (
  fs.existsSync(path.join(cwd, "babel.config.json")) ||
  fs.existsSync(path.join(cwd, "babel.config.js")) ||
  fs.existsSync(path.join(cwd, "babel.config.cjs")) ||
  fs.existsSync(path.join(cwd, "babel.config.mjs"))
) {
  scripts[buildId] = "babel --filename $FILE";
} else {
  const bundledConfig = path.join(__dirname, "babel.config.json");
  scripts[buildId] = `babel --filename $FILE --config-file ${bundledConfig}`;
}

module.exports = {
  scripts,
  installOptions: {
    NODE_ENV: true
  },
  devOptions: {
    // Default port of bridgetown
    port: 4000,
    open: "none",
    // Default output directory of Bridgetown
    out: "output"
  },
  // Account for users using Docker
  proxy: {
    "0.0.0.0:4000": "0.0.0.0:4000"
  },
  plugins: [
    "@snowpack/plugin-dotenv",
    "@snowpack/plugin-babel"
  ],
};
