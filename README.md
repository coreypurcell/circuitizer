Circuitizer
==========

A simple digital circuit solver that prints it's output with the DOT
Language.

In IRB:

    $:.unshift '.'
    require 'lib/circuitizer'

    # creating our nodes (gates, sources, readings)
    # label them with a unique name
    b = Board.new
    b << Source.new('IN-1', true)
    b << Source.new('IN-2', true)
    b << AndGate.new('A-Gate')
    b << Reading.new('OUT')

    # wire up the nodes with traces
    b << Trace.new.start(b['IN-1']).end(b['A-Gate'])
    b << Trace.new.start(b['IN-2']).end(b['A-Gate'])
    b << Trace.new.start(b['A-Gate']).end(b['OUT'])

    # set your sources manually if you didn't above
    # or you can change them for a second run
    b['IN-1'].set true
    b['IN-2'].set true

    # run it and print
    b.run
    puts b.print #returns the DOT text


Print in Graphviz

    # you need to capture the output from b.print then run it through
    # graphviz

    # write to a file
    File.open('circuit.dot', 'w+') do |f|
      f.write(b.print)
    end
    
    # from the command line
    dot -Tps -o circuit.ps circuit.dot
    


#### Where do we go from here?

Check github issues.
