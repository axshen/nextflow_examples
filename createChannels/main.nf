nextflow.enable.dsl=2

constant = 'const'

process first_p {
  echo true

  input:
    val constant
    val input1
    val input2

  output:
    val 1, emit: output1

  script:
  """
    rm -f /tmp/*.txt
    echo first $input1 $input2 $constant
    touch /tmp/1.txt
    touch /tmp/2.txt
    touch /tmp/3.txt
  """
}

process second_p {

  input:
    val input1

  output:
    val test, emit: output1

  exec:
    test = file("/tmp/*.txt")
}

process third_p {
  echo true

  input:
    val input1

  output:

  script:
  """
    echo third $input1
  """
}


workflow {
  first_p(constant, 1, 2)
  second_p(first_p.out.output1)
  third_p(second_p.out.output1.flatten())
}
