cmake_minimum_required(VERSION 3.16.0)

project(EXAMPLE_BLE_NUS)

message("-- [INFO] Building Example")
add_executable(example_ble_nus main.cpp)
target_compile_features(example_ble_nus PUBLIC cxx_std_17)
target_link_libraries(example_ble_nus bluezdbus-static pthread)
