{ pkgs, lib, ... }: {
  time.timeZone = "America/Miquelon";
  users.users.root.initialPassword = "password";
  networking = {
    hostName = "nixpi5";
    useDHCP = false;
    interfaces = {
      wlan0.useDHCP = false;
      eth0.useDHCP = true;
    };
  };
  raspberry-pi-nix.board = "bcm2712";
  hardware = {
    raspberry-pi = {
      config = {
        all = {
          base-dt-params = {
            BOOT_UART = {
              enable = false;
              value = 1;
            };
            uart_2ndstage = {
              enable = false;
              value = 1;
            };
            audio = {
              enable = true;
              value = "off";
            };
            sd_poll_once = {
              enable = true;
            };

            # NVME
            pciex1 = {
              enable = true;
            };
            pciex1_gen = {
              enable = true;
              value = 3;
            };
            nvme = {
              enable = true;
            };
          };
          dt-overlays = {
            vc4-kms-v3d = {
              enable = true;
              params = { };
            };
            disable-bt = {
              enable = true;
              params = { };
            };
          };
          options = {
            hdmi_blanking = {
              enable = true;
              value = 1;
            };
            disable_overscan = {
              enable = true;
              value = 1;
            };
            gpu_mem_256 = {
              enable = true;
              value = 76;
            };
            gpu_mem_512 = {
              enable = true;
              value = 76;
            };
            gpu_mem_1024 = {
              enable = true;
              value = 76;
            };
            disable_splash = {
              enable = true;
              value = 1;
            };
#            enable_uart = {
#              enable = true;
#              value = 0;
#            };
            temp_limit = {
              enable = true;
              value = 75;
            };
            initial_turbo = {
              enable = true;
              value = 20;
            };
          };
        };
      };
    };
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
