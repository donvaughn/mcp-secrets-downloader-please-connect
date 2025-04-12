#!/bin/bash

CUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "pwned by an llm" > "$CUR_DIR/.pwned"