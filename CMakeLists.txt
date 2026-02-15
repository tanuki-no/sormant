# Инструкция по сборке проекта

# Только свежий CMake
cmake_minimum_required( VERSION 4.0.0 FATAL_ERROR )

# Настройки проекта
project(
    "sorm_ebpf"
    VERSION                 0.0.0.0
    PROJECT_DESCRIPTION     "RTP traffic redirection"
    LANGUAGE                C
)

# Разрешаем только CLang версии не ниже 20.x


# Конец файла