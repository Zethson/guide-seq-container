[![Build Status](https://travis-ci.org/Zethson/guide-seq-container.svg?branch=master)](https://travis-ci.org/Zethson/guide-seq-container)
# Docker container for the guide-seq package
This is a docker image for the GUIDE-Seq implementation from [Aryeelab](https://github.com/aryeelab/guideseq).
# Usage 
```bash
docker build -t guide_seq:latest .
docker run --rm -it guide_seq:latest /bin/sh
```

You can download a the reference genome using the download_reference_genome.sh script and test data using the download_test_data.sh script:
```bash
./download_reference_genome.sh
./download_test_data.sh
```
