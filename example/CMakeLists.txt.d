cmake_minimum_required (VERSION 3.14)
project (example)
set(CMAKE_CXX_STANDARD 14)
IF(NOT APPLE AND NOT MSVC)
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
ENDIF()
get_filename_component(CCAPI_CPP_PROJECT_DIR ../ ABSOLUTE)
message("CCAPI_CPP_PROJECT_DIR: ${CCAPI_CPP_PROJECT_DIR}")
set(RAPIDJSON_INCLUDE_DIR ${CCAPI_CPP_PROJECT_DIR}/dependency/rapidjson/include)
set(WEBSOCKETPP_INCLUDE_DIR ${CCAPI_CPP_PROJECT_DIR}/dependency/websocketpp)
set(ASIO_INCLUDE_DIR ${CCAPI_CPP_PROJECT_DIR}/dependency/asio/asio/include)
set(DATE_INCLUDE_DIR ${CCAPI_CPP_PROJECT_DIR}/dependency/date/include)
find_package(OpenSSL REQUIRED)
find_package(ZLIB REQUIRED)
set(OPENSSL_USE_STATIC_LIBS TRUE)
set(ENABLE_ALL_EXCHANGE $ENV{ENABLE_ALL_EXCHANGE})
message("ENABLE_ALL_EXCHANGE: ${ENABLE_ALL_EXCHANGE}")
if ("${ENABLE_ALL_EXCHANGE}" STREQUAL "true")
	add_definitions(-DENABLE_ALL_EXCHANGE)
endif()
add_definitions(-DENABLE_COINBASE)
include_directories(${CCAPI_CPP_PROJECT_DIR}/include ${WEBSOCKETPP_INCLUDE_DIR} ${ASIO_INCLUDE_DIR} ${RAPIDJSON_INCLUDE_DIR} ${DATE_INCLUDE_DIR} ${OPENSSL_INCLUDE_DIR})
link_libraries(OpenSSL::Crypto OpenSSL::SSL ZLIB::ZLIB)
file(GLOB SOURCES_SIMPLE src/simple.cpp)
add_executable(simple ${SOURCES_SIMPLE})
file(GLOB SOURCES_ADVANCED src/advanced.cpp)
add_executable(advanced ${SOURCES_ADVANCED})