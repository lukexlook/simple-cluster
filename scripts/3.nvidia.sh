#!/bin/bash
SCRIPTS_DIR=$(dirname $(realpath $0))
source ${SCRIPTS_DIR}/0.env.sh
set -e

# Install driver
sudo apt install -y         \
    dkms                    \
    ${NV_VERSION}

# Extract the specific version
export LINE=$(apt list --installed ${NV_VERSION} 2>/dev/null | grep nv)
export VER=$(python3 -c "import re; print(re.search(r'\d{3}\.\d{2}\.\d{2}', '$LINE')[0])")

# Find related packages
RELATED=$(apt list --installed 2>/dev/null | grep ${VER})

# Generate apt-mark hold commands
python3 -c "

related = '''
${RELATED}
'''

print('=' * 40)
for line in related.split('\n'):
    line = line.strip()
    if line:
        print('sudo apt-mark hold', line.split('/')[0])

print('sudo apt-mark showhold')
print('=' * 40)
"

# TODO: run apt-mark commands automatically
echo "Pls run the commands above"
