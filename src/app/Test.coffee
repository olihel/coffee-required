###
 https://github.com/olihel/coffee-required.git
 Copyright (c) 2013 Oliver Hellebusch
 Released under MIT license (https://raw.github.com/olihel/coffee-required/master/LICENSE)
###

define( (require) ->
  Test2 = require 'cs!Test2'
  console.log('TEST');
  test2 = new Test2()
  return testFunc: ->
    'test string'
)
