#!/bin/bash

# Find all .hx files in chapter directories
SRC_PATHS=$(ls chapter_*/*.hx 2>/dev/null | sort)
ERRORS=()
SUCCESS_COUNT=0
TOTAL_COUNT=0

echo "Starting Haxe tests..."
echo "------------------------------------"

for SRC_PATH in $SRC_PATHS; do
    ((TOTAL_COUNT++))

    # Get that directory and filename
    DIR_NAME=$(dirname "$SRC_PATH")
    FILE_NAME=$(basename "$SRC_PATH" .hx)
    PACKAGE_NAME=$(basename "$DIR_NAME")

    echo -n "Testing: $PACKAGE_NAME.$FILE_NAME ... "

    # Run the Haxe file using the interpreter
    if haxe --interp -cp haxe -main "$PACKAGE_NAME.$FILE_NAME" > /dev/null 2>&1; then
        echo "PASSED"
        ((SUCCESS_COUNT++))
    else
        echo "FAILED"
        ERRORS+=("Error in $PACKAGE_NAME.$FILE_NAME")
    fi
done

echo "------------------------------------"
echo "Tested $TOTAL_COUNT files"
echo "Passed: $SUCCESS_COUNT"
echo "Failed: ${#ERRORS[@]}"

if [ ${#ERRORS[@]} -ne 0 ]; then
    echo "Summary of failures:"
    for ERR in "${ERRORS[@]}"; do
        echo "  - $ERR"
    done
    exit 1
fi

echo "All tests passed successfully!"
exit 0
