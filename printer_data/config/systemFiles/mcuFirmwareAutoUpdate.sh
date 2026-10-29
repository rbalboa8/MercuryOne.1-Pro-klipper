sudo service klipper stop
cd ~/klipper

make clean KCONFIG_CONFIG=btt_skr_3_ez_klipper.config
make menuconfig KCONFIG_CONFIG=btt_skr_3_ez_klipper.config
make -j4 KCONFIG_CONFIG=btt_skr_3_ez_klipper.config
read -p "SKR 3 EZ firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -d /dev/serial/by-id/usb-Klipper_stm32h723xx_23000A000751323530383130-if00
read -p "SKR 3 EZ firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=orbitool_o2s_klipper.config
make menuconfig KCONFIG_CONFIG=orbitool_o2s_klipper.config
make -j4 KCONFIG_CONFIG=orbitool_o2s_klipper.config
read -p "Obitool O2S firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-Klipper_stm32f072xb_Orbitool_O2S-if00
read -p "Obitool O2S firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=rpi_klipper.config
make menuconfig KCONFIG_CONFIG=rpi_klipper.config
make -j4 KCONFIG_CONFIG=rpi_klipper.config
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make -j4 flash KCONFIG_CONFIG=rpi_klipper.config

sudo service klipper start
