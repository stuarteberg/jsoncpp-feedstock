mkdir build && cd build

set CMAKE_CONFIG=Release

cmake ^
  -G "NMake Makefiles" ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE="%CMAKE_CONFIG%" ^
  -DBUILD_STATIC_LIBS=1 ^
  -DBUILD_SHARED_LIBS=0 ^
  -DPYTHON_EXECUTABLE="%PYTHON%" ^
  ..
if errorlevel 1 exit 1

cmake --build . --config %CMAKE_CONFIG% --target install
if errorlevel 1 exit 1

ctest --output-on-failure
if errorlevel 1 exit 1
