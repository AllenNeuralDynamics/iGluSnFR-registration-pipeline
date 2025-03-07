#!/usr/bin/env nextflow
// hash:sha256:d257e1899dad051364959ad5eac15c2c1e1aef58576e42679abe033dc63913e6

nextflow.enable.dsl = 1

iglusnfr4f_dendrite_passivedriftinggratings_to_iglusnfr_registration_1 = channel.fromPath("../data/iGluSnFR4f_dendrite_passiveDriftingGratings/*", type: 'any', relative: true)
iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_2 = channel.fromPath("../data/iGluSnFR4f_dendrite_passiveDriftingGratings/*", type: 'any', relative: true)
iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_3 = channel.fromPath("../data/iGluSnFR4f_dendrite_passiveDriftingGratings/*", type: 'any', relative: true)
iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_4 = channel.fromPath("../data/iGluSnFR4f_dendrite_passiveDriftingGratings/*", type: 'any', relative: true)
iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_5 = channel.fromPath("../data/iGluSnFR4f_dendrite_passiveDriftingGratings/*", type: 'any', relative: true)
iglusnfr4f_dendrite_passivedriftinggratings_motioncorrected_1xds_to_pass_through_data_6 = channel.fromPath("../data/iGluSnFR4f_dendrite_passiveDriftingGratings_motionCorrected_1xDS/*", type: 'any', relative: true)

// capsule - iGluSnFR-registration
process capsule_i_glu_sn_fr_registration_1 {
	tag 'capsule-6936755'
	container "$REGISTRY_HOST/capsule/a87e854d-9183-4fb0-b089-1ddb75975fea:9ad55c6db67526a08d4bb460f069990b"

	cpus 64
	memory '256 GB'

	publishDir "$RESULTS_PATH/stripRegistration", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path1 from iglusnfr4f_dendrite_passivedriftinggratings_to_iglusnfr_registration_1

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=a87e854d-9183-4fb0-b089-1ddb75975fea
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR4f_dendrite_passiveDriftingGratings/$path1" "capsule/data/$path1" # id: 642ba851-556a-4b85-bad8-ea74dbf9c55d

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6936755.git" capsule-repo
	git -C capsule-repo checkout 9fa700678e7f1ea6d22c00a145e5d345940d4abf --quiet
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
	memory '256 GB'

	publishDir "$RESULTS_PATH/suite2p", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path2 from iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_2

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR4f_dendrite_passiveDriftingGratings/$path2" "capsule/data/$path2" # id: 642ba851-556a-4b85-bad8-ea74dbf9c55d

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout 6317094b5d532b12b313f94cb39bbb60a37dfd07 --quiet
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
	memory '256 GB'

	publishDir "$RESULTS_PATH/caiman", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path3 from iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_3

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR4f_dendrite_passiveDriftingGratings/$path3" "capsule/data/$path3" # id: 642ba851-556a-4b85-bad8-ea74dbf9c55d

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout 6317094b5d532b12b313f94cb39bbb60a37dfd07 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman

	echo "[${task.tag}] completed!"
	"""
}

// capsule - CaImAn-Suite2p-Registeration
process capsule_ca_im_an_suite_2_p_registeration_5 {
	tag 'capsule-6874496'
	container "$REGISTRY_HOST/capsule/db98af8f-7c66-40ac-b6ea-f39dbabedf51:cda60c6ae52416ac2a633366a4a7c940"

	cpus 64
	memory '256 GB'

	publishDir "$RESULTS_PATH/caiman_stripCaiman", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path4 from iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_4

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR4f_dendrite_passiveDriftingGratings/$path4" "capsule/data/$path4" # id: 642ba851-556a-4b85-bad8-ea74dbf9c55d

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout 6317094b5d532b12b313f94cb39bbb60a37dfd07 --quiet
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
	memory '256 GB'

	publishDir "$RESULTS_PATH/caiman_stripJnormcorre", saveAs: { filename -> filename.matches("capsule/results/.*") ? new File(filename).getName() : null }

	input:
	val path5 from iglusnfr4f_dendrite_passivedriftinggratings_to_caiman_suite2p_registeration_5

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=db98af8f-7c66-40ac-b6ea-f39dbabedf51
	export CO_CPUS=64
	export CO_MEMORY=274877906944

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR4f_dendrite_passiveDriftingGratings/$path5" "capsule/data/$path5" # id: 642ba851-556a-4b85-bad8-ea74dbf9c55d

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6874496.git" capsule-repo
	git -C capsule-repo checkout 6317094b5d532b12b313f94cb39bbb60a37dfd07 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ../data/* ../results/ caiman jorncorre_initial_temp

	echo "[${task.tag}] completed!"
	"""
}

// capsule - pass-through-data
process capsule_pass_through_data_7 {
	tag 'capsule-6068962'
	container "$REGISTRY_HOST/capsule/5e75700f-9d8b-4851-9294-872d4d38d822:710a9814f018ff24b030107d1b250f07"

	cpus 64
	memory '8 GB'

	publishDir "$RESULTS_PATH/stripRegistration_matlab", saveAs: { filename -> new File(filename).getName() }

	input:
	val path6 from iglusnfr4f_dendrite_passivedriftinggratings_motioncorrected_1xds_to_pass_through_data_6

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=5e75700f-9d8b-4851-9294-872d4d38d822
	export CO_CPUS=64
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/iGluSnFR4f_dendrite_passiveDriftingGratings_motionCorrected_1xDS/$path6" "capsule/data/$path6" # id: 754dbb34-f5be-4326-9a05-8532080eb1a3

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-6068962.git" capsule-repo
	git -C capsule-repo checkout 0d03504ce05d5583294f81aeb1a65334c6e49d89 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}
