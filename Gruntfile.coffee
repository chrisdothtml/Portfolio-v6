module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		stylesheet: 'core-styles'
		dirs:
			html: 'assets/html'
			css: 'assets/css'
			js: 'assets/js'

		jade:
			src:
				expand: true
				cwd: '<%=dirs.html%>/'
				src: '*.jade'
				ext: '.html'
		sass:
			options:
				style: 'compressed'
				sourcemap: false
			src:
				files:
					'<%=dirs.css%>/<%=stylesheet%>.css': '<%=dirs.css%>/src/<%=stylesheet%>.scss'
		autoprefixer:
			build:
				src: '<%=dirs.css%>/<%=stylesheet%>.css'
		cssmin:
			build:
				files:
					'<%=dirs.css%>/<%=stylesheet%>.min.css': '<%=dirs.css%>/<%=stylesheet%>.css'
		coffee:
			options:
				bare: true
				mangle: true
			src:
				expand: true
				cwd: '<%=dirs.js%>/src/'
				src: '*.coffee'
				dest: '<%=dirs.js%>/'
				ext: '.js'
		uglify:
			build:
				expand: true
				cwd: '<%=dirs.js%>/'
				src: ['functions.js','plugins.js','core-scripts.js']
				dest: '<%=dirs.js%>/'
				ext: '.min.js'
		watch:
			options:
				livereload: true
			jade:
				files: ['<%=dirs.html%>/*.jade']
				tasks: ['jade']
			sass:
				files: ['<%=dirs.css%>/src/*.scss']
				tasks: ['sass','autoprefixer','cssmin']
			coffee:
				files: ['<%=dirs.js%>/src/*.coffee']
				tasks: ['coffee','uglify']

	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-sass'
	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'default', ['watch']