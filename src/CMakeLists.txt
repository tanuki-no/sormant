# Исполняемые файли и библиотеки

# Userspace
add_executable(
    ${PROJECT_NAME}
    "main.c"
)

target_include_directories(
    ${PROJECT_NAME} PRIVATE ${BPF_INCLUDE_DIRS}
)

target_link_libraries(
    ${PROJECT_NAME} PRIVATE ${BPF_LIBRARIES}
)

# Модуль ядра

# КФ