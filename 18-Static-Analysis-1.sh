source "${TEST_DIR}/lib/funcs.bash"

test_start "Static Analysis" \
    "Checks for programming and stylistic errors with cppcheck"

if ! ( which cppcheck &> /dev/null ); then
    # "cppcheck is not installed. Please install (as root) with:"
    # "pacman -Sy cppcheck"
    test_end 1
fi

cppcheck --enable=warning,style,performance,portability \
    --error-exitcode=1 \
    "${TEST_DIR}/../"{procfs.c,procfs.h,util.c,util.h}

test_end