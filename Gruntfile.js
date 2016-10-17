var fs = require('fs');

module.exports = function(grunt) {

	var jspath = [
		'./static/js/jquery/*.js',
		'./static/js/jquery-ellipsis/*.js',
		'./static/js/clipboard/*.js',
		'./static/js/codemirror/*.js',
		'./static/js/codemirror/mode/haxe/*.js',
		'./static/js/flickity/*.js',
		'./static/js/parallax/*.js',
		'./static/js/particles/*.js',
		'./static/js/app.js',
		'./static/js/views/*.js',
		'./static/js/pages/*.js',
		'./static/js/starter/*.js'
	];

	var csspath = [
		'./static/css/vendor/*.scss',
		'./static/css/*.scss'
	];

	grunt.initConfig({
		clean: {
			js: {
				src: ['lib/simple.js']
			},
			css: {
				src: ['lib/simple.css']
			}
		},
		concat: {
			js: {
				src: jspath,
				dest: 'lib/simple.js'
			},
			sass: {
				src: csspath,
				dest: 'lib/simple.scss'
			}
		},
		uglify: {
			js: {
				files: {
					'lib/simple.js': ['lib/simple.js']
				}
			}
		},
		sass: {
			options: {
				sourceMap: false,
				noCache: true
			},
			dist: {
				options: {
					style: 'compressed'
				},
				src: [
					'lib/simple.scss'
				],
				dest: 'css/simple.css'
			}
		},
		watch: {
			scripts: {
				files: jspath,
				tasks: ['js']
			},
			css: {
				files: csspath,
				tasks: ['css']
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-rsync');

	grunt.registerTask('default', ['clean','concat', 'sass', 'watch']);
	grunt.registerTask('js', ['clean:js', 'concat:js', 'watch']);
	grunt.registerTask('css', ['clean:css', 'concat:sass', 'sass', 'watch']);
	grunt.registerTask('prod', ['clean','concat', 'uglify', 'sass'])

};