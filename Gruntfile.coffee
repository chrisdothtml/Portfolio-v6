module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		jade:
			compile:
				files:
					'index.html': ['assets/html/index.jade']
		sass:
			options:
				style: 'compressed'
				sourcemap: false
			compile:
				files:
					'assets/css/core-styles.css': 'assets/css/src/core-styles.scss'
		autoprefixer:
			compile:
				src: 'assets/css/core-styles.css'
				dest: ''
		cssmin:
			compile:
				files:
					'assets/css/core-styles.min.css': ['assets/css/core-styles.css']
		coffee:
			compile:
				options:
					bare: true
					mangle: true
				files:
					'assets/js/core-scripts.js': 'assets/js/src/core-scripts.coffee'
					'assets/js/functions.js': 'assets/js/src/functions.coffee'
					'assets/js/plugins.js': 'assets/js/src/plugins.coffee'
		uglify:
			compile:
				files:
					'assets/js/core-scripts.min.js': 'assets/js/core-scripts.js'
					'assets/js/functions.min.js': 'assets/js/functions.js'
					'assets/js/plugins.min.js': 'assets/js/plugins.js'
		watch:
			html:
				files: ['assets/html/*.jade']
				tasks: ['jade']
			sass:
				files: ['assets/css/src/*.scss']
				tasks: ['sass','autoprefixer','cssmin']
			coffee:
				files: ['assets/js/src/*.coffee']
				tasks: ['coffee','uglify']

	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-sass'
	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	# Single Compile
	#grunt.registerTask 'default', ['jade','sass','autoprefixer','cssmin','coffee','uglify']

	# Default
	grunt.registerTask 'default', ['watch']