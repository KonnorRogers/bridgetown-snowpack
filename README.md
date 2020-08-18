# Purpose

A collection of various Bridgetown examples and packages using snowpack.

## Getting started

### New project

```bash
bridgetown new <dir> --apply="https://github.com/ParamagicDev/bridgetown-snowpack/blob/master/automations/<automation-file>"
```

### Existing Project

```bash
bundle exec bridgetown apply https://github.com/ParamagicDev/bridgetown-snowpack/blob/master/automations/<automation-file>
```

## How I use it

```bash
/OPTS="--skip-yarn" bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ParamagicDev/bridgetown-automation-docker-compose/master/installer.sh)"

cd <project>
source docker.env
docker-compose run --rm web bundle exec bridgetown apply https://github.com/ParamagicDev/bridgetown-snowpack/blob/master/automations/newsite.automation.rb
```

And you should be up and running on `localhost:4000`

Also make sure to check out [Bridgetown](https://bridgetownrb.com)


## Deploying packages

```bash
cd packages/<package>
yarn version && yarn build && yarn publish
```
