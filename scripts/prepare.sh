#!/bin/bash

# set -e

# command -V flatc 2>/dev/null || (
#   echo "downloading flatc binary"
#   mkdir -p ./node_modules/.bin
#   cd ./node_modules/.bin
#   wget -q -O flatc.zip https://github.com/google/flatbuffers/releases/download/v23.3.3/Linux.flatc.binary.clang++-12.zip
#   unzip -q flatc.zip
#   rm -f flatc.zip
#   cd ../..
#   command -V flatc
# )

# flatc --version
# rm -rf ./src/flatbuffers
# flatc --ts -o ./src/flatbuffers ./src/schema.fbs
# set -e

# //////////////////

# # Use Homebrew installed flatc
# flatc=/opt/homebrew/bin/flatc

# # Check if flatc is available
# if ! command -v $flatc &> /dev/null
# then
#     echo "flatc could not be found at $flatc. Please make sure it is installed."
#     exit 1
# fi

# # Display flatc version
# $flatc --version

# # Clean up previous generated flatbuffers
# rm -rf ./src/flatbuffers

# # Generate TypeScript code from FlatBuffers schema
# $flatc --ts -o ./src/flatbuffers ./src/schema.fbs

#!/bin/bash

set -e

# Check for flatc and use system-installed if available, otherwise fall back
if ! command -v flatc &> /dev/null; then
  echo "flatc could not be found, attempting to download..."
  mkdir -p ./node_modules/.bin
  cd ./node_modules/.bin
  wget -q -O flatc.zip https://github.com/google/flatbuffers/releases/download/v23.3.3/Linux.flatc.binary.clang++-12.zip
  unzip -q flatc.zip
  rm -f flatc.zip
  cd ../..
else
  echo "Using existing flatc installation."
fi

flatc --version
rm -rf ./src/flatbuffers
flatc --ts -o ./src/flatbuffers ./src/schema.fbs
