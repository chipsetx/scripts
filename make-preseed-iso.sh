#!/usr/bin/env bash

input_iso=$1
output_iso=$2
preseed=$3
input_file_dir=$4


if  [ -r $input_iso ] && [ -r $preseed ]; then
    printf '%s\n' \
        "Usage: ${0##*/} <input-iso> <output-iso> <preseed-file> [file-dir]" \
        "" \
        "input-iso:    the debian iso to modify" \
        "output-iso:   where to store the modified iso" \
        "preseed-file: the location of a preseed file to inject" 
else

echo "extraction du nouvel iso "
mkdir new_iso/
file-roller $input_iso -e new_iso/
# ou mount iso et copie vers new_iso/

echo "extraction du fichier initrd"
cd new_iso/install/
mkdir new_initrd_dir/
cd new_initrd_dir/
gzip -d < ../initrd.gz | cpio -i --no-absolute-filenames

echo "Ajout du fichier preseed"
sed -i 's/append vga=788  --- quiet/append vga=788  --- quiet auto=true/' "../../isolinux/install.cfg" 
cp ../../../$preseed preseed.cfg


echo "recompression du fichier initrd.gz"
find . -print0 | cpio -H newc -o -0 | gzip -9 > ../initrd.gz
cd ../
rm -rf new_initrd_dir/

echo "ajout des sommes md5"
cd ../
find . -type f -exec md5sum {} + > md5sum.txt

echo "recompression du nouvel iso"
cd ../
mkisofs -quiet -o debian.iso -r -J -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat new_iso/
rm -rf new_iso/

fi




