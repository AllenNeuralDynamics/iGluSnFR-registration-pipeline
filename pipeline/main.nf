#!/usr/bin/env nextflow
// hash:sha256:2fe48789c598dcbb4d1a6678ab63f624e0c714ba4549df4bbdc6dedb7db2350c

nextflow.enable.dsl = 1

iglusnfr_simulations_default_to_iglusnfr_registration_1 = channel.fromPath("../data/iGluSnFR_simulations_default/*", type: 'any', relative: true)
iglusnfr_simulations_default_to_caiman_suite2p_registeration_2 = channel.fromPath("../data/iGluSnFR_simulations_default/*", type: 'any', relative: true)
iglusnfr_simulations_default_to_caiman_suite2p_registeration_3 = channel.fromPath("../data/iGluSnFR_simulations_default/*", type: 'any', relative: true)
iglusnfr_simulations_default_to_calebs_stripregistrationbergamo_using_matlab_runtime_4 = channel.fromPath("../data/iGluSnFR_simulations_default/*", type: 'any', relative: true)

// capsule - iGluSnFR-registration
process capsule_i_glu_sn_fr_registration_1 {
	tag 'capsule-6936755'
	container "$REGISTRY_HOST/capsule/a87e854d-9183-4fb0-b089-1ddb75975fea:4661f2289a0ae9f2d6abfbac71d41b87"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/stripRegisteration", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path1 from iglusnfr_simulations_default_to_iglusnfr_registration_1

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

	ln -s "/tmp/data/iGluSnFR_simulations_default/$path1" "capsule/data/$path1" # id: 56885832-ccc9-4e7c-a019-14e653b60bb9

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6936755.git" capsule-repo
	git -C capsule-repo checkout c3620ad1fe1cd290afe01ff823372d89781f899c --quiet
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
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:cda60c6ae52416ac2a633366a4a7c940"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/suite2p", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path2 from iglusnfr_simulations_default_to_caiman_suite2p_registeration_2

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=137438953472

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR_simulations_default/$path2" "capsule/data/$path2" # id: 56885832-ccc9-4e7c-a019-14e653b60bb9

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout e8546605398632e6a5bdb90f357ec65f62d718f3 --quiet
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
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:cda60c6ae52416ac2a633366a4a7c940"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/caiman", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path3 from iglusnfr_simulations_default_to_caiman_suite2p_registeration_3

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=137438953472

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR_simulations_default/$path3" "capsule/data/$path3" # id: 56885832-ccc9-4e7c-a019-14e653b60bb9

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout e8546605398632e6a5bdb90f357ec65f62d718f3 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman -resume

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Calebs stripRegistrationBergamo using MATLAB_Runtime
process capsule_calebs_strip_registration_bergamo_using_matlab_runtime_4 {
	tag 'capsule-3744737'
	container "$REGISTRY_HOST/capsule/d5c41354-8c96-4334-b8ef-654ba0882929:7ab891deacf46b1e885cefee98811618"

	cpus 64
	memory '256 GB'

	publishDir "$RESULTS_PATH/stripRegisteration_matlab", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path4 from iglusnfr_simulations_default_to_calebs_stripregistrationbergamo_using_matlab_runtime_4

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=d5c41354-8c96-4334-b8ef-654ba0882929
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR_simulations_default/$path4" "capsule/data/$path4" # id: 56885832-ccc9-4e7c-a019-14e653b60bb9

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3744737.git" capsule-repo
	git -C capsule-repo checkout a1eba1a21523d451af74ae7677a1a3053cbfd89e --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}
