sudo service klipper stop
cd ~/klipper

make clean KCONFIG_CONFIG=btt_skr_mini_e3_v1.2_klipper.config
make menuconfig KCONFIG_CONFIG=btt_skr_e3_turbo_klipper.config
make -j4 KCONFIG_CONFIG=btt_skr_e3_turbo_klipper.config
read -p "SKR E3 Turbo firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

~/klipper/scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_lpc1769_1520010CC09869AF0AC1405EC52000F5-if00 btt-skr-e3-turbo
read -p "SKR E3 Turbo firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=rpi_klipper.config
make menuconfig KCONFIG_CONFIG=rpi_klipper.config
make -j4 KCONFIG_CONFIG=rpi_klipper.config
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make -j4 flash KCONFIG_CONFIG=rpi_klipper.config

sudo service klipper start
