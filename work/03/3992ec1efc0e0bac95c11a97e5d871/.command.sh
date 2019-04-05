#!/bin/bash -euo pipefail
DecoyDatabase  -in test.fasta \
               -out test_decoy.fasta \
               -decoy_string DECOY_ \
               -decoy_string_position prefix
