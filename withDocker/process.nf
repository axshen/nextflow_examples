#!/usr/bin/env nextflow

projectDir = projectDir
data_ch = Channel.fromPath( '../data/dat*.txt' )

process sum {
    input:
    val path from data_ch

    output:
    stdout into result

    script:
    """
    docker run sum-py \$(cat $path)
    """
}

result.view{ it.trim() }