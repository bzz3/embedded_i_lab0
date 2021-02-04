#!/bin/bash

# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
curl https://bootstrap.pypa.io/2.7/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
export PATH="/home/user/.local/bin:$PATH"

pip3 install PySerial
pip3 install pynput

python3 keypresser_p3.py
