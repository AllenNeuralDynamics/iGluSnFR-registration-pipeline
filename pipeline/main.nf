#!/usr/bin/env nextflow
// hash:sha256:13f90a7685b9854f770c198dbbfa973deaad1f2feb2982281e0afca69bb19a73

nextflow.enable.dsl = 1

iglusnfr_simulations_to_caiman_suite2p_registration_1 = channel.fromPath("../data/iGluSnFR_simulations/*", type: 'any', relative: true)
iglusnfr_simulations_to_caiman_suite2p_registration_2 = channel.fromPath("../data/iGluSnFR_simulations/*", type: 'any', relative: true)

// capsule - CaImAn-Suite2p-Registration
process capsule_ca_im_an_suite_2_p_registeration_2 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:51c0db4332c28243e96a156ad8d07275"

	cpus 64
	memory '240 GB'

	publishDir "$RESULTS_PATH/suite2p", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path1 from iglusnfr_simulations_to_caiman_suite2p_registration_1

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

	ln -s "/tmp/data/iGluSnFR_simulations/$path1" "capsule/data/$path1" # id: dfb5c9f4-77c4-4a91-96fe-2551a70d0891

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	fi
	git -C capsule-repo checkout 82462acf9e1afe79f0bf2f6a627b85a014f3fc6a --quiet
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
	val path2 from iglusnfr_simulations_to_caiman_suite2p_registration_2

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

	ln -s "/tmp/data/iGluSnFR_simulations/$path2" "capsule/data/$path2" # id: dfb5c9f4-77c4-4a91-96fe-2551a70d0891

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	fi
	git -C capsule-repo checkout 82462acf9e1afe79f0bf2f6a627b85a014f3fc6a --quiet
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman jnormcorre_initial_temp

	echo "[${task.tag}] completed!"
	"""
}
