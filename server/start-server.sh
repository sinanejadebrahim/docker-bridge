#!/bin/bash
{
cd /root/images
python3 -m http.server 5432 &
} &> /dev/null 2>&1
