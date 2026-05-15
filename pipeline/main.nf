#!/usr/bin/env nextflow
// hash:sha256:10b738fb875740b58721b2ab3194f27b6c9eb58f3a87377b2c9be47188b8fe41

nextflow.enable.dsl = 1

params.iglusnfr_simulations_url = 's3://aind-scratch-data/iGluSnFR_simulations_default'
params.iglusnfr_registered_url = 's3://aind-scratch-data/iGluSnFR_simulations_default_stripregistration'

iglusnfr_simulations_to_caiman_suite2p_registration_1 = channel.fromPath(params.iglusnfr_simulations_url + "/*", type: 'any')
iglusnfr_simulations_to_caiman_suite2p_registration_2 = channel.fromPath(params.iglusnfr_simulations_url + "/*", type: 'any')
iglusnfr_registered_to_pass_through_data_3 = channel.fromPath(params.iglusnfr_registered_url + "/*", type: 'any')

// capsule - CaImAn-Suite2p-Registration
process capsule_ca_im_an_suite_2_p_registeration_2 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:51c0db4332c28243e96a156ad8d07275"

	cpus 64
	memory '240 GB'

	publishDir "$RESULTS_PATH/suite2p", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	path 'capsule/data/' from iglusnfr_simulations_to_caiman_suite2p_registration_1

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=257698037760

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	fi
	git -C capsule-repo checkout 405ac880b096a4b75c645ef28b2cdc5f49f93086 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ suite2p

	echo "[${task.tag}] completed!"
	"""
}

// capsule - CaImAn-Suite2p-Registration
process capsule_ca_im_an_suite_2_p_registeration_3 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:51c0db4332c28243e96a156ad8d07275"

	cpus 64
	memory '240 GB'

	publishDir "$RESULTS_PATH/caiman", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	path 'capsule/data/' from iglusnfr_simulations_to_caiman_suite2p_registration_2

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=257698037760

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	fi
	git -C capsule-repo checkout 405ac880b096a4b75c645ef28b2cdc5f49f93086 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman

	echo "[${task.tag}] completed!"
	"""
}

// capsule - pass-through-data
process capsule_pass_through_data_7 {
	tag 'capsule-6068962'
	container "$REGISTRY_HOST/capsule/5e75700f-9d8b-4851-9294-872d4d38d822:710a9814f018ff24b030107d1b250f07"

	cpus 64
	memory '7.5 GB'

	publishDir "$RESULTS_PATH/stripRegistration_matlab", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/' from iglusnfr_registered_to_pass_through_data_3

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=5e75700f-9d8b-4851-9294-872d4d38d822
	export CO_CPUS=64
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6068962.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6068962.git" capsule-repo
	fi
	git -C capsule-repo checkout 0d03504ce05d5583294f81aeb1a65334c6e49d89 --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}
