[![test](https://github.com/kranzky/lets-punk/workflows/test/badge.svg)](https://github.com/kranzky/lets-punk/actions?query=workflow%3Atest)
[![Coverage Status](https://coveralls.io/repos/github/kranzky/lets-punk/badge.svg?branch=main)](https://coveralls.io/github/kranzky/lets-punk?branch=main)

# Let's Punk!

Template project for Punk! omakase web framework for rapid prototyping.

## Setup

```
> brew bundle
> nvm use `cat .nvmrc`
> npm uninstall --global quasar-cli
> npm install --global @quasar/cli@1.1.3
> yarn install
> bundle install
```

### Services

* Sign up at https://userstack.com/
* Add `USERSTACK_API_KEY` to `env/locals.sh`, GitHub secrets and Heroku config vars
* Sign up at https://ipstack.com/
* Add `IPSTACK_ACCESS_KEY` to `env/locals.sh`, GitHub secrets and Heroku config vars

## Usage

```
> punk db create
> punk db migrate
> punk server
> punk worker
> quasar dev -m pwa
```

## Icon and Splash Screen

```
> yarn global add @quasar/icongenie
> icongenie generate --icon punk-icon.png --background punk-splash.png --mode pwa --splashscreen-icon-ratio 0 --skip-trim
```

## Release Process

Create a new tag and release on GitHub to trigger ship workflow.

## Copyright

Copyright (c) 2021 Jason Hutchens. See LICENSE for further details.
