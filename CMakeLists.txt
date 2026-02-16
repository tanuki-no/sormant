# Инструкция по сборке проекта

# Только свежий CMake
cmake_minimum_required( VERSION 4.0.0 FATAL_ERROR )

# Настройки проекта
project(
    "sormant"
    VERSION         0.0.0.1
    DESCRIPTION     "RTP traffic redirection"
    LANGUAGES       C
)

# Настройки сборки вынесена в отдельные файлы
include( "cmake/detect.cmake" )
include( "cmake/options.cmake" )
include( "cmake/settings.cmake" )

# Требуем pkgconfig
find_package(PkgConfig REQUIRED)

# Ищем библиотеки
pkg_check_modules(BPF REQUIRED  "libbpf")

# Генерируем заголовочные файлы

# Заголовочные файлы проекта

# Модули ядра
add_subdirectory("bpf")

# Исполняемые файлы и библиотеки
add_subdirectory("src")

# Тесты

# Документация

# Конец файла