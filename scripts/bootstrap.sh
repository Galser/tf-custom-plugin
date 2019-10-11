#!/usr/bin/env bash
# Vagrantbox Full Provison script for our task

bash scripts/setup_go.sh
bash scripts/setup_tf.sh
bash scripts/setup_custom_plugin.sh
bash scripts/init_tf.sh
