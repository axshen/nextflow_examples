#!/usr/bin/env nextflow

data_ch = Channel.value( 5 )
file_ch = Channel.fromPath( "../data/dat*" )

process someMaths {
    input:
    val x from data_ch

    output:
    stdout into result

    script:
    """
    #!/usr/bin/env python3
    
    x = int($x)
    y = 3 * x ** 3 + 2 * x / x ** 2

    print(y)
    """
}

process otherMath {
    input:
    val path from file_ch

    output:
    stdout into pythonOutput

    script:
    """
    #!/usr/bin/env python3

    f = open("$path", 'r')
    print(f.read())
    """
}

result.view{ it.trim() }
pythonOutput.view { it.trim() }
