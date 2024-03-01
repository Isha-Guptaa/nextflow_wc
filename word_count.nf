nextflow.enable.dsl=2

params.input = "${launchDir}/data/ecoli_database"

input_ch = Channel.fromPath(params.input)

workflow {

    NUM_LINES(input_ch)
    NUM_LINES.out.view()

}

process NUM_LINES {

    input:
    path read

    output:
    stdout

    script:
    """

    printf 'Total number of genomes in ${read}\\t'

    grep '>' ${read} | wc -l

    printf 'Chromosome genome:'

    grep 'chromosome' ${read} | wc -l

    printf 'Plasmid genome:'
    
    grep 'plasmid' ${read} | wc -l

    printf 'Complete sequence:'
    
    grep 'complete sequence' ${read} | wc -l
    """
}

