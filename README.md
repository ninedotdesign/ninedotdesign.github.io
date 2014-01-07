# sloth

[![Build Status](https://magnum.travis-ci.com/xively/sloth.png?token=oLucmZFzPxy8fyrknDiS)](https://magnum.travis-ci.com/xively/sloth)

![Mascot](https://github.com/cosm/sloth/raw/master/mascot.gif)

```Live slow, die whenever```

This repository contains the source for Xively's statically-generated home-page. This is for all logged-out pages. It is generated using Jekyll, then served with Nginx.

[More Information](http://www.youtube.com/embed/IkWXk_3PJKY)

## Developing sloth

Assets (currently Foundation files) are in the `assets` folder.

See `assets/sass/*.scss`

### Upgrading Foundation

Update the zurb-foundation gem:

`bundle update zurb-foundation`

Update the compass project:

```sh
cd assets
bundle exec compass install -r zurb-foundation foundation/upgrade --force
```

## Set Up The Dev Environment

```sh
./bin/bootstrap
```

## Running The Dev Server

```sh
./bin/server
```

## Test the compilation

```sh
./bin/test
```

