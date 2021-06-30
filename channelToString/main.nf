#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

// ----------------------------------------------------------------------------------------
// Processes
// ----------------------------------------------------------------------------------------

process printFiles {
    input:
        val files

    output:
        stdout emit: filesString
    
    script:
        """
        #!/usr/bin/env python3

        print('$files'.replace('[', '').replace(']', '').replace(',', ''))
        """    
}

// ----------------------------------------------------------------------------------------
// Workflow
// ----------------------------------------------------------------------------------------

workflow {
    files = Channel.fromPath("./files/*txt").collect()

    main:
        printFiles(files)
        printFiles.out.filesString.view()
}

// ----------------------------------------------------------------------------------------
