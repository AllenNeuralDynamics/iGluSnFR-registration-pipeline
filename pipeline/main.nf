#!/usr/bin/env nextflow
// hash:sha256:8fac7bf6a7a3c5569e02bc4750e118e05fbedaa2bfdb75bcf1454258b9e637a9

nextflow.enable.dsl = 1

zstack_sim_zmotion900_to_iglusnfr_registration_1 = channel.fromPath("../data/zstack-sim-zmotion900/[1-900]*", type: 'any', relative: true)
zstack_sim_zmotion900_to_caiman_suite2p_registeration_2 = channel.fromPath("../data/zstack-sim-zmotion900/[1-900]*", type: 'any', relative: true)
zstack_sim_zmotion900_to_caiman_suite2p_registeration_3 = channel.fromPath("../data/zstack-sim-zmotion900/[1-900]*", type: 'any', relative: true)
zstack_sim_zmotion900_to_caleb_stripregbergamo_4 = channel.fromPath("../data/zstack-sim-zmotion900/[1-900]*", type: 'any', relative: true)
zstack_sim_zmotion900_to_caiman_suite2p_registeration_5 = channel.fromPath("../data/zstack-sim-zmotion900/[1-900]*", type: 'any', relative: true)
zstack_sim_zmotion900_to_caiman_suite2p_registeration_6 = channel.fromPath("../data/zstack-sim-zmotion900/[1-900]*", type: 'any', relative: true)

// capsule - iGluSnFR-registration
process capsule_i_glu_sn_fr_registration_1 {
	tag 'capsule-6936755'
	container "$REGISTRY_HOST/capsule/a87e854d-9183-4fb0-b089-1ddb75975fea:4661f2289a0ae9f2d6abfbac71d41b87"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/stripRegisteration", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path1 from zstack_sim_zmotion900_to_iglusnfr_registration_1

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

	ln -s "/tmp/data/zstack-sim-zmotion900/$path1" "capsule/data/$path1" # id: 86f8fd88-d5f4-4415-b31b-7940bbdab451

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6936755.git" capsule-repo
	git -C capsule-repo checkout 5f7376bc814130a962ea224bfdc577eba12eb0d6 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run /data/* /results/

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
	val path2 from zstack_sim_zmotion900_to_caiman_suite2p_registeration_2

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

	ln -s "/tmp/data/zstack-sim-zmotion900/$path2" "capsule/data/$path2" # id: 86f8fd88-d5f4-4415-b31b-7940bbdab451

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout be80bde3ec9e7d96eb5d295281c357ad16458fde --quiet
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
	val path3 from zstack_sim_zmotion900_to_caiman_suite2p_registeration_3

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

	ln -s "/tmp/data/zstack-sim-zmotion900/$path3" "capsule/data/$path3" # id: 86f8fd88-d5f4-4415-b31b-7940bbdab451

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout be80bde3ec9e7d96eb5d295281c357ad16458fde --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman

	echo "[${task.tag}] completed!"
	"""
}

// capsule - Caleb-stripRegBergamo
process capsule_caleb_strip_reg_bergamo_4 {
	tag 'capsule-8667111'
	container "$REGISTRY_HOST/capsule/8d25eaba-0297-4585-a287-6dff9f3a923d:ba1a69bb244ec8c4190c4ea5f6f73671"

	cpus 64
	memory '256 GB'

	publishDir "$RESULTS_PATH/stripRegisteration_matlab", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path4 from zstack_sim_zmotion900_to_caleb_stripregbergamo_4

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=8d25eaba-0297-4585-a287-6dff9f3a923d
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/zstack-sim-zmotion900/$path4" "capsule/data/$path4" # id: 86f8fd88-d5f4-4415-b31b-7940bbdab451

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8667111.git" capsule-repo
	git -C capsule-repo checkout 46f6793195adeed16c7d279de7a1ec15f7e0a024 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run --maxshift 50 --clipShift 10 --removeLines 4 --ds_time 0

	echo "[${task.tag}] completed!"
	"""
}

// capsule - CaImAn-Suite2p-Registeration
process capsule_ca_im_an_suite_2_p_registeration_5 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:cda60c6ae52416ac2a633366a4a7c940"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/caiman_stripCaiman", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path5 from zstack_sim_zmotion900_to_caiman_suite2p_registeration_5

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

	ln -s "/tmp/data/zstack-sim-zmotion900/$path5" "capsule/data/$path5" # id: 86f8fd88-d5f4-4415-b31b-7940bbdab451

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout be80bde3ec9e7d96eb5d295281c357ad16458fde --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman caiman_initial_temp

	echo "[${task.tag}] completed!"
	"""
}

// capsule - CaImAn-Suite2p-Registeration
process capsule_ca_im_an_suite_2_p_registeration_6 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:cda60c6ae52416ac2a633366a4a7c940"

	cpus 64
	memory '128 GB'

	publishDir "$RESULTS_PATH/caiman_stripJnormcorre", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path6 from zstack_sim_zmotion900_to_caiman_suite2p_registeration_6

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

	ln -s "/tmp/data/zstack-sim-zmotion900/$path6" "capsule/data/$path6" # id: 86f8fd88-d5f4-4415-b31b-7940bbdab451

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout be80bde3ec9e7d96eb5d295281c357ad16458fde --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman jorncorre_initial_temp

	echo "[${task.tag}] completed!"
	"""
}
