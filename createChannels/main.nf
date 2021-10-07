#!/usr/bin/env nextflow 

nextflow.enable.dsl = 2

process generateFiles {
    input:
        val number

    output:
        stdout emit: stdout
    
    script:
        """
        #!/usr/bin/env python3

        import time

        number = int($number)
        for i in range(number):
            filename = f"/Users/she393/Downloads/file_{i}.txt"
            f = open(filename, 'w')
            f.write('lol ')
            f.close()

        time.sleep(5)
        """
}

process readFile {
    input:
        val generate
        path file
    
    output:
        stdout emit: stdout

    script:
        """
        #!/bin/bash

        cat $file
        """
}

workflow {
    number = Channel.value(5)

    main:
        generateFiles(number)
        readFile(generateFiles.out.stdout, Channel.fromPath("/Users/she393/Downloads/*.txt"))
        readFile.out.stdout.view()
}