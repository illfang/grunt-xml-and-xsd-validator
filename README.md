# grunt-xml-and-xsd-validator

> Grunt plugin to validate XML files and test if the documents are well-formed using a XSD schema

## Getting Started
This plugin requires Grunt `~0.4.4`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-xml-and-xsd-validator --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-xml-and-xsd-validator');
```

## The "xml_validator" task

### Overview
In your project's Gruntfile, add a section named `xml_validator` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  xml_validator: {
    your_target: {
      src: [ 'your_files/*.xml', 'another_file.xml' ],
      options: {
        xsd: 'your_files/my_schema.xsd'
      }
    },
  },
});
```

## Release History
1.0.0 - Implemented XML document validation using XSD schemas


# Based on the original base XML validation of
[grunt-xml-validator (https://github.com/panzic/grunt-xml-validator)](https://github.com/panzic/grunt-xml-validator)

Copyright (c) 2014 Carlo 'kj'

Licensed under the MIT license.
