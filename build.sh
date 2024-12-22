#!/bin/sh

nix build '.#nixosConfigurations.rpi5.config.system.build.sdImage'
