# Исполняемые файли и библиотеки в пространстве пользователя

set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SORMANT_COMMON_CFLAGS}" )

add_executable(
    ${PROJECT_NAME}
    "main.c"
)

target_include_directories(
    ${PROJECT_NAME}
    PRIVATE ${BPF_INCLUDE_DIRS}
)

target_link_libraries(
    ${PROJECT_NAME}
    PRIVATE ${BPF_LIBRARIES}
)

if (CMAKE_C_LINK_PIE_SUPPORTED)
    set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE TRUE)
endif()

# Конец файла