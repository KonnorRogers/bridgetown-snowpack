const scripts = {
  "mount:frontend": "mount frontend --to /_frontend_",
  "mount:output": "mount output --to /",
  "run:bridgetown": "bundle exec bridgetown build",
  "run:bridgetown::watch": "$1 --watch",
};

const mount = {
}

const proxy = {
  "0.0.0.0:4000": "0.0.0.0:4000",
}

const plugins = [
  [
    "@snowpack/plugin-run-script",
    {
      "cmd": "bundle exec bridgetown build",
      "watch": "$1 --watch"
    }
  ]
]

const installOptions = {
}

const devOptions = {
    // Default port of bridgetown
    port: 4000,
    open: "none",
    // Default output directory of Bridgetown
    out: "output",
}


const buildOptions = {
}



module.exports = {
  mount,
  proxy,
  plugins,
  installOptions,
  devOptions,
  buildOptions
  // Account for users using Docker
  plugins: [
    "@snowpack/plugin-dotenv",
    "@snowpack/plugin-babel",
    "@snowpack/plugin-parcel",
  ],
};
