input=NA12878-chr22-10pct #without extension
threads=`grep -c processor /proc/cpuinfo`

if [ ! -f $input.bam ]
then
    echo "Input file not present."
    if command -v curl > /dev/null
    then
	echo "Downloading input file."
	curl -O http://www.exascience.com/public-files/elprep-demo/$input.bam
    elif command -v wget > /dev/null
    then
	echo "Downloading input file."
	wget http://www.exascience.com/public-files/elprep-demo/$input.bam
    else
	echo "Please download the input file from http://www.exascience.com/public-files/elprep-demo/$input.bam before running this script."
	exit
    fi
fi

if command -v elprep > /dev/null
then
    if command -v samtools > /dev/null
    then
	elprep $input.bam $input.only_mapped.reordered-contigs.read-group.bam --filter-unmapped-reads --replace-reference-sequences ucsc.hg19.dict --replace-read-group "ID:group1 LB:lib1 PL:illumina PU:unit1 SM:sample1" --sorting-order "unknown" --nr-of-threads $threads --gc-on 2
    else
	echo 'samtools not found. Please download it from http://samtools.sourceforge.net and make sure that its binary is present in your PATH.'
    fi
else
    echo 'elprep not found. Please download it from https://github.com/exascience/elprep and make sure that its binary is present in your PATH.'
fi
