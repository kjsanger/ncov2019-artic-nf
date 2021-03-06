
def printHelp() {
  log.info"""
  Usage:
    nextflow run connor-lab/ncov2019-artic-nf -profile (singularity,docker,conda) ( --illumina | --nanpolish | --medaka ) --prefix [prefix] [workflow-options]

  Description:
    Turn Nanopore or Illumina SARS-CoV2 sequencing reads generated by ARTIC tiling amplification protocols into consensus sequences.
      - Nanopore: ARTIC (https://github.com/artic-network/fieldbioinformatics)
      - Illumina: iVar (https://github.com/andersen-lab/ivar)

    All options set via CLI can be set in conf directory

  Nextflow arguments (single DASH):
    -profile                  Allowed values: conda, singularity, docker, [COG-UK institutional profile]

  Mandatory workflow arguments (mutually exclusive):
    --illumina                Run the Illumina workflow
    --nanopolish              Run the Nanopore/Nanopolish workflow (https://github.com/jts/nanopolish)
    --medaka                  Run the Nanopore/Medaka workflow (https://github.com/nanoporetech/medaka)

  Nanopore workflow options:
    Mandatory:
      --prefix                A (unique) string prefix for output files.
                              Sequencing run name is a good choice e.g DDMMYY_MACHINEID_RUN_FLOWCELLID.
      --basecalled_fastq      The output directory from guppy_barcoder or guppy_basecaller - usually fastq_pass. 
                              This can optionally contain barcodeXXX directories, which are 
                              auto-detected and analysed in parallel.
      --fast5_pass            Directory containing fast5 files - usually fast5_pass. NOT REQUIRED FOR MEDAKA WORKFLOW.
      --sequencing_summary    Path to sequencing_summary.txt. NOT REQUIRED FOR MEDAKA WORKFLOW.

    Optional:
      --outdir                Output directory (Default: ./results)
 
      --schemeVersion         ARTIC scheme version (Default: 'V2')
      --schemeRepoURL         Repo to download your primer scheme from (Default: 'https://github.com/artic-network/artic-ncov2019')
      --schemeDir             Directory within schemeRepoURL that contains primer schemes (Default: 'primer_schemes')
      --scheme                Scheme name (Default: 'nCoV-2019')
 
      --min_length            Minimum read length for artic guppyplex (Default: 400)
      --max_length            Maximum read length for artic guppyplex (Default: 700)
      --bwa                   Use BWA for mapping Nanopore reads (Default: false, use Minimap2)
      --outCram               Output cram instead of bam files (Default: false)
 
  Illumina workflow options:
    Mandatory:
      --prefix                A (unique) string prefix for output files.
                              Sequencing run name is a good choice e.g DDMMYY_MACHINEID_RUN_FLOWCELLID.
      --directory             Path to a directory containing paired-end Illumina reads. 
                              Reads will be found and paired RECURSIVELY beneath this directory.
    Optional:
      --outdir                Output directory (Default: ./results)

      --schemeVersion         ARTIC scheme version (Default: 'V2')
      --schemeRepoURL         Repo to download your primer scheme from (Default: 'https://github.com/artic-network/artic-ncov2019')
      --schemeDir             Directory within schemeRepoURL that contains primer schemes (Default: 'primer_schemes')
      --scheme                Scheme name (Default: 'nCoV-2019')
 
      --bed                   Path to iVar-compatible bed file, also requires --ref
                              Overrides --scheme* options. (Default: unset, download scheme from git)
      --ref                   Path to iVar-compatible reference fasta file, also requires --bed 
                              Overrides --scheme* options. (Default: unset, download scheme from git)

      --allowNoprimer         Allow reads that don't have primer sequence? 
                              Depends on your library prep method: ligation == false, tagmentation == true (Default: true)
      --illuminaKeepLen       Length (bp) of reads to keep after primer trimming (Default: 20)
      --illuminaQualThreshold Sliding window quality threshold for keeping 
                              reads after primer trimming (Default: 20)
      --mpileupDepth          Mpileup depth (Default: 100000)
      --ivarFreqThreshold     iVar frequency threshold for consensus variant (ivar consensus -t, Default: 0.75)
      --ivarMinDepth          Minimum coverage depth to call variant (ivar consensus -m; ivar variants -m, Default: 10)
      --ivarMinFreqThreshold  iVar frequency threshold to call variant (ivar variants -t, Default: 0.25)
      --ivarMinVariantQuality iVar minimum mapQ to call variant (ivar variants -q, Default: 20)

      --cram                  Input is CRAM files not fastq (Default: false)
      --outCram               Output cram instead of bam files (Default: false)
  """.stripIndent()
}
