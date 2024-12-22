#!/bin/sh

nix build '.#nixosConfigurations.rpi5.config.hardware.raspberry-pi.config-output' && cat result
