h1. ZOS gem

A gem to wrap the ZOS SOAP API so it's simple to use

h2. Background

Using SOAP can be cumbersome and sometimes reviewing a WSDL file for a new API can be a pain. This wrapper allows you to call methods on a ZOS object instead of using a soap client.

ZOS is a new, but powerful, service and there isn't a nice ruby wrapper for the API so I decided to release this to the public.

h2. Requirements

* Written in/for Ruby 1.9.3
* Savon for SOAP
* Review the ZOS API so you know what methods/arguments are available

h2. Installation

_[Manual]_

# Download this: http://github.com/dkullmann/zos/zipball/master
# Unzip that download.
# Copy the zos.rb file into your vendor or lib folder

@todo - gem install

h2. Usage

	zos = ZOS.new(apiKey, apiPasswd, clientId)

	# Using default options
	device_tree = zos.get_device_tree

	# Customizing options
	landmark_id = zos.add_landmark(options)


h2. Todo

* gem install
* continue adding methods
* perhaps figure out a pattern to requests/responses so there isn't one method each

h2. License

Copyright (c) 2012 David Kullmann

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.