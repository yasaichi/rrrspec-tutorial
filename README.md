# rrrspec-tutorial
Learn how to set up [RRRSpec](https://github.com/cookpad/rrrspec).  
NOTE: This tutorial is written for [the August 2016 issue of Software Design](http://gihyo.jp/magazine/SD/archive/2016/201608) 
published by Gijutsu-Hyohron Co., Ltd.

## Tutorial
Proceed with the following steps:

1. [Setup Client](https://github.com/yasaichi/rrrspec-tutorial/compare/69c396706640f8afe9cfd24c54875cb119020547...setup-client)
2. [Setup Master and Web UI](https://github.com/yasaichi/rrrspec-tutorial/compare/setup-client...setup-master-and-web)
3. [Setup Worker](https://github.com/yasaichi/rrrspec-tutorial/compare/setup-master-and-web...setup-worker)
4. [Test run](https://github.com/yasaichi/rrrspec-tutorial/compare/setup-worker...test-run)

## Structure
* `client`: Client application
* `server`: For Master (+ Web UI) and Worker
* `demo`: For demonstration

## For the impatient

### Setup
Clone the repository with:

```
git clone git@github.com:yasaichi/rrrspec-tutorial.git
```

Run a "magical" script with:

```
ruby demo/setup.rb
```

### Test run
Start the server with:

```
cd demo && foreman start
```

Create a new taskset with:

```
cd client && foreman run --env=../demo/.env bundle exec rrrspec-client start --rsync-name=sample_app
```

Open the following URL in your browser to check the status:

```
http://localhost:3000
```

## License
Copyright (c) 2016 Yuichi Goto. See [LICENSE.txt](LICENSE.txt) for further details.
