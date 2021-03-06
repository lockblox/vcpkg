include(vcpkg_common_functions)

if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
    message("blox only supports static library linkage")
    set(VCPKG_LIBRARY_LINKAGE static)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lockblox/blox
    REF v1.0
    SHA512 fbd29952dfeaaa6aa21b3c44526849010ce49d47ad63321dcf9f1414ce929ce7db12524a1a61f3e645abe1192eebc95a507b1ff36a09a41d357bd74cb9852bb8
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/blox RENAME copyright)