module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		# Variables
		dirs:
			html: 'assets/html'
			css: 'assets/css'
			js: 'assets/js'

		# HTML Tasks
		jade:
			src:
				expand: true
				cwd: '<%=dirs.html%>/'
				src: '*.jade'
				ext: '.html'

		# CSS Tasks
		sass:
			options:
				style: 'compressed'
				sourcemap: false
			src:
				expand: true
				src: '<%=dirs.css%>/src/*.scss'
				ext: '.css'
		autoprefixer:
			src:
				expand: true
				src: '<%=dirs.css%>/src/*.css'
		cssmin:
			dist:
				expand: true
				cwd: '<%=dirs.css%>/src/'
				src: '*.css'
				dest: '<%=dirs.css%>/'
				ext: '.min.css'

		# Javascript Tasks
		coffee:
			options:
				bare: true
				mangle: true
			src:
				expand: true
				src: '<%=dirs.js%>/src/*.coffee'
				ext: '.js'
		uglify:
			build:
				expand: true
				cwd: '<%=dirs.js%>/src/'
				src: '*.js'
				dest: '<%=dirs.js%>/'
				ext: '.min.js'

		# Watch Tasks
		watch:
			options:
				livereload: true
			jade:
				files: ['<%=dirs.html%>/*.jade']
				tasks: ['jade']
			sass:
				files: ['<%=dirs.css%>/src/**/*.scss','<%=dirs.css%>/src/*.css']
				tasks: ['sass','autoprefixer','cssmin']
			coffee:
				files: ['<%=dirs.js%>/src/*.coffee','<%=dirs.js%>/src/*.js']
				tasks: ['coffee','uglify']

	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-sass'
	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	#grunt.registerTask 'default', ['watch']
	grunt.registerTask 'default', ['jade','sass','autoprefixer','cssmin','coffee','uglify']