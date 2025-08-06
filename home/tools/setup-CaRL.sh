#!/bin/bash

echo "start setup CaRL"

# setup CaRL
cd
git clone https://github.com/autonomousvision/CaRL.git
cd CaRL
chmod +x setup_carla.sh
./setup_carla.sh
conda env create --file=environment.yml
conda activate carl

# setup .bashrc
echo 'conda activate garage_2' >> ~/.bashrc

echo 'export CARLA_ROOT=/home/$(whoami)/CaRL/carla' >> ~/.bashrc
echo 'export WORK_DIR=/home/$(whoami)/CaRL' >> ~/.bashrc
echo 'export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla' >> ~/.bashrc
echo 'export SCENARIO_RUNNER_ROOT=${WORK_DIR}/scenario_runner' >> ~/.bashrc
echo 'export LEADERBOARD_ROOT=${WORK_DIR}/leaderboard' >> ~/.bashrc
echo 'export PYTHONPATH="${CARLA_ROOT}/PythonAPI/carla/":"${SCENARIO_RUNNER_ROOT}":"${LEADERBOARD_ROOT}":${PYTHONPATH}' >> ~/.bashrc

echo 'export DISPLAY=:0' >> ~/.bashrc

echo "finish setup CaRL"
