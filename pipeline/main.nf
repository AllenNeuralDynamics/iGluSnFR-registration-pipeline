#!/usr/bin/env nextflow
// hash:sha256:3c9e4910191c87b3e582edb609d589b6574ea953f5a8174691f5c3e2429d0c94

nextflow.enable.dsl = 1

iglusnfr_simulations_to_iglusnfr_registration_1 = channel.fromPath("../data/iGluSnFR_simulations/*", type: 'any', relative: true)
iglusnfr_simulations_to_caiman_suite2p_registeration_2 = channel.fromPath("../data/iGluSnFR_simulations/*", type: 'any', relative: true)
iglusnfr_simulations_to_caiman_suite2p_registeration_3 = channel.fromPath("../data/iGluSnFR_simulations/*", type: 'any', relative: true)

// capsule - iGluSnFR-registration
process capsule_i_glu_sn_fr_registration_1 {
	tag 'capsule-6936755'
	container "$REGISTRY_HOST/capsule/a87e854d-9183-4fb0-b089-1ddb75975fea:4661f2289a0ae9f2d6abfbac71d41b87"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/stripRegisteration", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path1 from iglusnfr_simulations_to_iglusnfr_registration_1

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=a87e854d-9183-4fb0-b089-1ddb75975fea
	export CO_CPUS=64
	export CO_MEMORY=137438953472

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR_simulations/$path1" "capsule/data/$path1" # id: d644fb2f-b6cf-4b78-8d3e-14a477f43056

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6936755.git" capsule-repo
	git -C capsule-repo checkout 5413a035cac33793b702b5b99982fef7d9766218 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/

	echo "[${task.tag}] completed!"
	"""
}

// capsule - CaImAn-Suite2p-Registeration
process capsule_ca_im_an_suite_2_p_registeration_2 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:aa302fb5bc6ab02dac015ae69e4a92ce"

	cpus 16
	memory '128 GB'

	publishDir "$RESULTS_PATH/suite2p", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path2 from iglusnfr_simulations_to_caiman_suite2p_registeration_2

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=16
	export CO_MEMORY=137438953472

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR_simulations/$path2" "capsule/data/$path2" # id: d644fb2f-b6cf-4b78-8d3e-14a477f43056

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout 929c3a16bc9d0103fa77f85f25241ba330826f58 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ suite2p

	echo "[${task.tag}] completed!"
	"""
}

// capsule - CaImAn-Suite2p-Registeration
process capsule_ca_im_an_suite_2_p_registeration_3 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:aa302fb5bc6ab02dac015ae69e4a92ce"

	cpus 16
	memory '128 GB'

	publishDir "$RESULTS_PATH/caiman", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path3 from iglusnfr_simulations_to_caiman_suite2p_registeration_3

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=16
	export CO_MEMORY=137438953472

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR_simulations/$path3" "capsule/data/$path3" # id: d644fb2f-b6cf-4b78-8d3e-14a477f43056

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout 929c3a16bc9d0103fa77f85f25241ba330826f58 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman

	echo "[${task.tag}] completed!"
	"""
}
