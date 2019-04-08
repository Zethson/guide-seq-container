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

Then run the large test:
```bash
python guide_seq_wf/guideseq/guideseq.py all -m test/test_manifest.yaml
```

# Building a singularity image
Often times singularity images are prefered over docker images to be able to run them in a HPC environment.
You can build one by running
```bash
mkdir -p /tmp/singularity_output

docker run -v /var/run/docker.sock:/var/run/docker.sock \
-v /tmp/singularity_output:/output \
--privileged -t --rm \
singularityware/docker2singularity \
guide_seq:latest
```
Now you can find your shiny new singularity image in /tmp/singularity_output




