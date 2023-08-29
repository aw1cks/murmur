#!/bin/sh

set -eux

# Make sure we initialise first
MODE='run' run_lego.sh

crond -fl8
