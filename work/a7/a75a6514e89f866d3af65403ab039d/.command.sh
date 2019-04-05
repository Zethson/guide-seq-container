#!/bin/bash -euo pipefail
CometAdapter  -in MM15_Melanom_1_B_1.mzML \
              -out MM15_Melanom_1_B_1.idXML \
              -threads 2 \
              -database test_decoy.fasta \
              -precursor_mass_tolerance 5 \
              -fragment_bin_tolerance 0.02 \
              -fragment_bin_offset 0 \
              -num_hits 1 \
              -digest_mass_range 800:2500 \
              -max_variable_mods_in_peptide 3 \
              -allowed_missed_cleavages 0 \
              -precursor_charge 2:3 \
              -activation_method ALL \
              -use_NL_ions true \
              -variable_modifications 'Oxidation (M)' \
              -fixed_modifications  \
              -enzyme 'unspecific cleavage' \
              -spectrum_batch_size 500
