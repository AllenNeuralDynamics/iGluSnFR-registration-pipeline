# iGluSnFR-registration-pipeline
This workflow leverages the Nextflow framework to automate and parallelize image registration tasks. It supports multiple registration algorithms, including:
- iGluSnFR Strip Registration
- CaImAn Suite2p Registration
- Matlab implementation of Strip Registration

* `Matlab implementation of Strip Registration` capsule has flags: `-- maxshift 50` `--clipShift 10` `--removeLines 4` `--ds_time 0` 
* `CaImAn Suite2p Registration` capsule needs flags `-- caiman` or `-- suite2p` to switch between CaImAn and Suite2p

<img width="1103" alt="Screenshot 2025-01-28 at 11 10 31 AM" src="https://github.com/user-attachments/assets/d5442a35-158d-442c-a87b-4d17d9fd9626" />

## Note:
This pipeline has multiple registration methods for comparing them for the upcoming iGluSnFR methods paper. 

# Output
The workflow generates registration results in the following directories:
- suite2p/: Results from Suite2p registration
- caiman/: Results from CaImAn registration
- stripRegisteration/: Results from strip registration
- stripRegisteration_matlab/: Results from matlab implementation strip registration
