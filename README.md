# Purpose

A collection of various Bridgetown examples and packages using snowpack.

## Getting started

The easiest way to get started is to do the following:

```bash
git clone --depth 1 git@github.com:ParamagicDev/bridgetown-snowpack.git
cd bridgetown-snowpack
cp -R templates/bridgetown-snowpack-example <your directory>
cd <your directory>
bundle install && yarn install
yarn start
```

Alternatively, you can use an NPM package called [degit](https://www.npmjs.com/package/degit)

```bash
npx degit ParamagicDev/bridgetown-snowpack/templates/<template-name> <my-project-name>
cd <my-project-name>
bundle install && yarn install
yarn start
```

And you should be up and running on `localhost:4000`

Also make sure to check out [Bridgetown](https://bridgetownrb.com)

## Local Development

```bash
git clone git@github.com:ParamagicDev/bridgetown-snowpack.git
cd bridgetown-snowpack
```

Templates found in the `templates` directory

NPM Packages found in the `packages` directory

### Deploying packages

```bash
cd packages/<package>
yarn build && yarn publish
```
