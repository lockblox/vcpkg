include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lockblox/varint
    REF v1.0
    SHA512 32ca4a3e42691ecee928af27cb1782b58786504a24fb496ad305b4db4cfc58c264aff4da3e5dae598219dcf5f576a352ed2e7903c6c73c9625d930c38298f5bc
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug ${CURRENT_PACKAGES_DIR}/lib)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/varint RENAME copyright)