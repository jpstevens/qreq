module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffeelint: {
      files: ["src/*.coffee", "src/**/*.coffee", "test/*.coffee", "test/**/*.coffee"],
      options: {
        max_line_length: {
          level: "ignore"
        }
      }
    },
    coffee: {
      glob_to_multiple: {
        expand: true,
        flatten: false,
        cwd: 'src/',
        src: ['*.coffee'],
        dest: 'dist/',
        ext: '.js'
      }
    },
    clean: ["dist"],
    mochaTest: {
      feature: {
        options: {
          reporter: 'list',
          require: 'coffee-script/register',
          colors: true
        },
        src: ['tests/feature/*-spec.coffee']
      },
      unit: {
        options: {
          reporter: 'list',
          require: 'coffee-script/register',
          colors: true
        },
        src: ['tests/unit/*-spec.coffee']
      }
    }
  });

  grunt.loadNpmTasks('grunt-coffeelint');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-mocha-test');

  grunt.registerTask('build', ['coffeelint', 'clean', 'coffee']);

  grunt.registerTask('test:feature', ['mochaTest:feature']);
  grunt.registerTask('test:unit', ['mochaTest:unit']);
  grunt.registerTask('test', ['test:unit', 'test:feature']);

  grunt.registerTask('default', ['test', 'build']);
};
