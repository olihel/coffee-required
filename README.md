# coffee-required

Writing AMD-API modules in CoffeeScript using RequireJS, quick and easy

## Setup

Sample configuration file *src/index.js*:

```JavaScript
requirejs.config({
  baseUrl: 'app/',
  paths: {
    'cs': '../bower_components/require-cs/cs',
    'coffee-script': '../bower_components/coffee-script/index',
    'almond': '../bower_components/almond/almond'
  },

  // following options are irrelevant for in-browser usage;
  // only evaluated during optimize build (via r.js):
  stubModules: ['cs'],
  exclude: ['coffee-script'],
  include: 'cs!main',
  insertRequire: ['cs!main'],
  name: 'almond',
  out: '../dist/index-optimized.js'
});
```

For a more detailed description of configuration options, see the fully documented r.js [example build file](https://github.com/jrburke/r.js/blob/master/build/example.build.js). 

### Development

When developing your app, simply reference [RequireJS](https://github.com/jrburke/requirejs) and the above configuration file

```HTML
<script src="bower_components/requirejs/require.js" data-main="index.js"></script>
```

and reference CoffeeScript files via the "cs!" plugin name (see [require-cs](https://github.com/jrburke/require-cs)), e.g.:

```CoffeeScript
require ['cs!test'], (test) ->
  console.log test.testFunc()
```

CoffeeScript files are then fetched via XMLHttpRequest and compiled at runtime in the browser.

### Optimized build

When building optimized and minified files for deployment the same configuration file can be used in RequireJS's optimization tool [r.js](https://github.com/jrburke/r.js). During optimization all required CoffeeScript files are compiled and script dependencies like the CoffeeScript compiler, RequireJS and require-cs itself are removed. However the [Almond](https://github.com/jrburke/almond) dependency is added for minimal AMD-API support.  

Example using the [grunt-contrib-requirejs](https://github.com/gruntjs/grunt-contrib-requirejs) wrapper for r.js:

```CoffeeScript
grunt.initConfig
  requirejs:
    compile:
      options:
        mainConfigFile: 'src/index.js'
```


[![githalytics.com alpha](https://cruel-carlota.gopagoda.com/1b8f6c66b9178a8c7120383c63e2806e "githalytics.com")](http://githalytics.com/olihel/coffee-required)

<sub>**License**</sub>  
<sub>The MIT License (MIT)</sub>  
<sub>Copyright (c) 2013 Oliver Hellebusch</sub>

<sub>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:</sub>

<sub>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.</sub>

<sub>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.</sub>
