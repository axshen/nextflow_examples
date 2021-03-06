#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

// ----------------------------------------------------------------------------------------
// Processes
// ----------------------------------------------------------------------------------------

process what {
    output:
        stdout emit: stdout

    script:
        """
        #!/usr/bin/env python3
        print(${params})
        """
}


// ----------------------------------------------------------------------------------------
// Workflow
// ----------------------------------------------------------------------------------------

workflow {
    main:
        what()
}

// ----------------------------------------------------------------------------------------
