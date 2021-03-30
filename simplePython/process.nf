#!/usr/bin/env nextflow

data_ch = Channel.value( 5 )

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

result.view{ it.trim() }