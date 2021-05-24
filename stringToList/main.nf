#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

// ----------------------------------------------------------------------------------------
// Processes
// ----------------------------------------------------------------------------------------

process generate_filename {
    input:
        val names

    output:
        stdout emit: files

    script:
        """
        #!/usr/bin/env python3
        print("${names}.txt", end="")
        """
}

process whats_happening {
    input:
        val files

    output:
        stdout emit: stdout

    script:
        """
        #!/usr/bin/env python3
        print("${files}")
        """
}



// ----------------------------------------------------------------------------------------
// Workflow
// ----------------------------------------------------------------------------------------

workflow {
    names = Channel.of(params.filenames.split(','))

    main:
        generate_filename(names)
        whats_happening(generate_filename.out.files.collect())
        whats_happening.out.view()
}

// ----------------------------------------------------------------------------------------
