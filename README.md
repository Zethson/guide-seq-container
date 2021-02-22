# Docker container for the guide-seq package
This is a docker image for the GUIDE-Seq implementation from [Tsai lab](https://www.tsailab.com/).
# Usage 
```bash
docker build -t guide_seq:latest .
docker run --rm -it guide_seq:latest /bin/sh
```

# Testing
Inside the container run
```bash
git clone https://github.com/tsailabSJ/guideseq
cd guideseq
python guideseq/guideseq.py test/test_manifest.yml
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

