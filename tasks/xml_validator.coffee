#
# grunt-xml-and-xsd-validator
# https://github.com/illfang/grunt-xml-and-xsd-validator
#
# Copyright (c) 2015 Kevin Kratzer and below
#
# based on the work of
#
# grunt-xml-validator
# https://github.com/kajyr/grunt-xml-validator
#
# Copyright (c) 2014 Carlo 'kj'
# Licensed under the MIT license.
#

module.exports = (grunt) ->

  grunt.registerMultiTask('xml_validator', 'Grunt plugin to validate XML files', () ->

    DOMParser = require('xmldom').DOMParser
    xmllint = require('./xmllint')
    fail = false
    schema = null
    
    checkValidity = (f) ->
      xml = grunt.file.read(f)
      doc = new DOMParser({
        locator:{},

        errorHandler: (level, msg) ->
          fail = true
          grunt.log.error f + "\tnot valid"

      }).parseFromString(xml,'text/xml')
      if !fail and schema
        validation = xmllint.validateXML {xml: doc, schema: schema}
        if validation.errors
          fail = true
          grunt.log.error f + "\tnot well formed"
          validation.errors.forEach((e) -> grunt.log.error f + "\t " + e)
      doc if !fail
    
    options = this.options {xsd: null}
    if (options.xsd)
      schema = checkValidity(options.xsd)

    this.filesSrc.forEach(checkValidity)

    if fail 
      grunt.fail.warn 'Some files are not valid'
    else
      grunt.log.ok this.filesSrc.length + ' files valid'
      
  )