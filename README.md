個人的なラブライブのグッズ管理

[http://star-zero.github.io/LoveLive/](http://star-zero.github.io/LoveLive/)

# Require

* Ruby
* Bundler
* Bower

# Project setting

```
$ git clone git@github.com:STAR-ZERO/LoveLive.git LoveLive
$ cd LoveLive
$ bundle install --path vendor/bundle
$ bower install
```

# Deploy

```
$ bundle exec middleman build
$ bundle exec middleman deploy
```
