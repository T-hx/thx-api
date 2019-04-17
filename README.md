### what

Api application for thx system(peer to peer bonus)

### version 

```bash
$ ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin18]

$ bundler -v
Bundler version 1.17.1

$ mysql --version
mysql  Ver 14.14 Distrib 5.7.24, for osx10.14 (x86_64) using  EditLine wrapper

$ redis-server --version
Redis server v=5.0.3 sha=00000000:0 malloc=libc bits=64 build=457be8ba4fa3e51f

```

### set up

```bash
git clone git@github.com:T-hx/thx-api.git
bundle install --path=vendor/bundle
mysql.server start
bin/rake db:setup
```

### how to run api server
```bash
redis-server
bundle exec rails s -p 3001
```


### how to run front server
```
npm start
```