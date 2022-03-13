#!/bin/sh

find /mnt/data/ccare -maxdepth 2 -type d -ipath '*\/*\/.git' | sed 's/\/.git//' | xargs -i{} sh -c 'echo {} && cd {} && git fetch -p'

