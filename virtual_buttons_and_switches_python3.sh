#!/bin/bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
export PATH="/home/user/.local/bin:$PATH"
pip install PySerial
pip install pynput
# python3 -m pip install pynput
python3 keypresser_p3.py
