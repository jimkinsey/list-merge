fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'
srcDir = 'src/main/'
destDir = 'lib'

build = (callback) ->
  coffee = spawn './node_modules/.bin/coffee', ['-c', '-o', destDir, srcDir]
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0
  console.log "Built! :)"

task 'build', 'Build lib/ from src/', ->
  build()

task 'watch', 'Watch src/ for changes', ->
  coffee = spawn './node_modules/.bin/coffee', ['-w', '-c', '-o', destDir, srcDir]
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()

{exec} = require "child_process"

REPORTER = "min"

task "test", "run tests", ->
  exec "NODE_ENV=test 
    ./node_modules/.bin/mocha 
    --compilers coffee:coffee-script
    --reporter #{REPORTER}
    --require coffee-script 
    --colors
    src/test/list-merge-test.coffee
  ", (err, output) ->
    throw err if err
    console.log output