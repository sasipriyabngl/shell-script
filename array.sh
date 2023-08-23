#!/bin/bash

# this is called array, instead of single value it can hold multiple values
PERSONS=("saroja" "lohia" "sahiya")
# inside array we always refer values with index and starts with 0(ZERO)

echo "First person: ${PERSONS[0]}"
echo "All Persons: ${PERSONS[@]}"