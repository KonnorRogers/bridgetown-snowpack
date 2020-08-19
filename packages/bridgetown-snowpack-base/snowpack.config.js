const mount = {
  frontend: "/_frontend_",
  output: "/",
};

const proxy = {
  // Account for users using Docker
  "0.0.0.0:4000": "0.0.0.0:4000",
};

const plugins = [
  [
    "@snowpack/plugin-run-script",
    {
      cmd: "bundle exec bridgetown build",
      watch: "$1 --watch",
    },
  ],
  ["@snowpack/plugin-webpack", {}],
];

const installOptions = {
  NODE_ENV: true,
};

const devOptions = {
  // Default port of bridgetown
  port: 4000,
  open: "none",
  // Default output directory of Bridgetown
  out: "output",
};

const buildOptions = {
  clean: true,
};

module.exports = {
  mount,
  proxy,
  plugins,
  installOptions,
  devOptions,
  buildOptions,
};
