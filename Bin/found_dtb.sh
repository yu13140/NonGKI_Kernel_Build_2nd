#!/usr/bin/env bash
# Shell authon: yu13140 <whmyc801@gmail.com>
# 20251011

main() {
    local IMAGE_DIR="$GITHUB_WORKSPACE/device_kernel/out/arch/arm64/boot"

    find $IMAGE_PATH/dts/${{ env.GENERATE_CHIP }}/ -name "*.dtb" 2&1 >/dev/null
    if [ $? -eq 0 ]; then
        echo "DTB_PATH=0" >> $GITHUB_ENV
    else
        find $IMAGE_PATH/dts/vendor/${{ env.GENERATE_CHIP }}/ -name "*.dtb" 2&1 >/dev/null
        if [ $? -eq 0 ]; then
            echo "DTB_PATH=1" >> $GITHUB_ENV
        fi
    fi    
}

main