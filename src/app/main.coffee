###
 https://github.com/olihel/coffee-required.git
 Copyright (c) 2013 Oliver Hellebusch
 Released under MIT license (https://raw.github.com/olihel/coffee-required/master/LICENSE)
###

define (require) ->
  test = require 'cs!Test'
  console.log test.testFunc()
  console.log 'main.coffee: APP READY'
