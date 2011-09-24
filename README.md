Circuitizer
==========

A simple digital circuit solver that prints it's output with the DOT
Language.

### Graphviz must be installed

On a Mac you can use homebrew
    
    brew update
    brew install graphviz

### Examples
  
    ruby examples/simple_gate.rb

will output simple_gate.ps which looks like this

![Circuit](http://dl.dropbox.com/u/262398/simple_gate.png)

In IRB:

    $:.unshift '.'
    require 'lib/circuitizer'

    # creating our nodes (gates, sources, readings)
    # label them with a unique name
    b = Board.new do
      source 'IN-1', true
      source 'IN-2', true
      and_gate 'AND-Gate'
      reading 'OUT'
      
      # wire up the traces
      trace 'IN-1', 'AND-Gate'
      trace 'IN-2', 'AND-Gate'
      trace 'AND-Gate', 'OUT'
    end

    # change the value of sources
    b['IN-1'].set false

    # run it
    b.run

    # see the outputs
    b.outputs

    # write my board out as a postscript file
    # you can do this prior to running if you want
    DotWriter.write(b, "my-circuit.ps")


### Running the tests
  
    bundle install && rake


#### Where do we go from here?

Check github issues.
