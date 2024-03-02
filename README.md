## Overview
CMake template C++ project with pre-integrated Google Test and Google Benchmarks. Structured as following:
- `__lib__`
- `__app__` -> depends on `__lib__` 
- `__lib___test` -> depends on GTest and `__lib__`
- `__lib___bench` -> depends on GBench and `__lib__` 

Provides extensible structure from the beginning. For reusable initialization of a template use:

```fish
function init-cppcmake
    # Clone the GitHub repository
    git clone https://github.com/AntonReborn/CMakeTemplate

    # Check if the clone was successful before proceeding
    if test -d CMakeTemplate
        # Change to the directory
        cd CMakeTemplate

        # Run the initialization script
        # Ensure the script is executable and exists before attempting to run
        if test -x ./init_template.sh
            ./init_template.sh
            cd ..

        else
            echo "Initialization script not found or not executable"
        end
    else
        echo "Clone failed or directory does not exist"
    end
end
```