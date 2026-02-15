# Инструкция по сборке проекта

# Только свежий CMake
cmake_minimum_required( VERSION 4.0.0 FATAL_ERROR )

# Настройки проекта
project(
    "sormant"
    VERSION         0.0.0.0
    DESCRIPTION     "RTP traffic redirection"
    LANGUAGES       C
)

# Разрешаем только CLang версии не ниже 20.x
string( TOLOWER "${CMAKE_C_COMPILER_ID}" COMPILER_ID )
if (COMPILER_ID MATCHES "clang")
    execute_process(
        COMMAND ${CMAKE_C_COMPILER} --version OUTPUT_VARIABLE clang_full_version_string
    )
    string (
        REGEX REPLACE ".*clang version ([0-9]+\\.[0-9]+).*" "\\1"
        CLANG_VERSION_STRING ${clang_full_version_string})
    message("Clang версии ${CLANG_VERSION_STRING} найден!")
else()
    message(FATAL_ERROR "Компилятор Clang не найден!")
endif()

# Настраивам параметры сборки
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Генерируем заголовочные файлы

# Заголовочные файлы проекта
include_directories("include")

# Исполняемые файлы и библиотеки
add_subdirectory("src")

# Тесты


# Документация

# Конец файла