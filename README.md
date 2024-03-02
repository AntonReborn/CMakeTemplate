## Overview
CMake template C++ project with pre-integrated Google Test and Google Benchmarks. Structured as following:
- `__lib__`
- `__app__` -> depends on `__lib__` 
- `__lib___test` -> depends on GTest and `__lib__`
- `__lib___bench` -> depends on GBench and `__lib__` 

Provides extensible structure from the beginning. For reusable initialization of a template use:

### Start new project

```bash
git clone https://github.com/AntonReborn/CMakeTemplate
cd CMakeTemplate
./init_template.sh # Renames all occurrences of __***__ to the ones interactively provided
```
#### Fish func
```fish
function init-cppcmake
    git clone https://github.com/AntonReborn/CMakeTemplate
    if test -d CMakeTemplate
        cd CMakeTemplate
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