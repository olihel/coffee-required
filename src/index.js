/**
 * https://github.com/olihel/coffee-required.git
 * Copyright (c) 2013 Oliver Hellebusch
 *  Released under MIT license (https://raw.github.com/olihel/coffee-required/master/LICENSE)
 **/

/* global requirejs:false, require:false */

requirejs.config({
  baseUrl: 'app/',
  paths: {
    'cs': '../bower_components/require-cs/cs',
    'coffee-script': '../bower_components/coffee-script/index',
    'almond': '../bower_components/almond/almond'
  },

  // following properties only evaluated by grunt build task:
  stubModules: ['cs'],
  exclude: ['coffee-script'],
  include: 'cs!main',
  insertRequire: ['cs!main'],
  name: 'almond',
  out: '../dist/index-optimized.js'
});

requirejs.onError = function (err) {
  throw err;
};

// app initialization
require(['cs!main']);
