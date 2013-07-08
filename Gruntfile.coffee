###
 https://github.com/olihel/coffee-required.git
 Copyright (c) 2013 Oliver Hellebusch
 Released under MIT license (https://raw.github.com/olihel/coffee-required/master/LICENSE)
###

module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    devserver:
      port: 8888,
      base: 'src/',
      cache: 'no-cache'

    requirejs:
      compile:
        options:
          mainConfigFile: 'src/index.js'


  grunt.loadNpmTasks 'grunt-devserver'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'

  grunt.registerTask 'server', ['devserver']

  grunt.registerTask 'dist', 'Generate dist folder content', ->
    grunt.file.copy 'src/index.html', 'dist/index.html', {
      process: (content) ->
        content
          .split('src="bower_components/requirejs/require.js" data-main="index.js"')
          .join('src="index-optimized.js"')
    }
    grunt.task.run 'requirejs'

  grunt.registerTask 'default', 'Help screen', ->
    grunt.log.subhead 'Available tasks:'
    grunt.log.writeln '- server'
    grunt.log.writeln '- dist'
