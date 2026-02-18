# Обнаружение и настройка компилятора CLang

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

# Задать базовые параметры сборки для пользовательской части
message( STATUS "Общие флаги компилятора для :" )
include( CheckCompilerFlag )

set ( SORMANT_COMMON_CFLAGS  "" )
set ( CHECK_C_FLAGS "-Wall;-pedantic;-Wconversion;-Wunused;-Wshadow;-Werror;-Wno-deprecated-declarations;-fvisibility=hidden" )
set ( CMAKE_REQUIRED_QUIET  TRUE )
foreach (FLAG ${CHECK_C_FLAGS} )
  check_compiler_flag(C ${FLAG} HAVE_${FLAG})
    if(HAVE_${FLAG})
        set (SORMANT_COMMON_CFLAGS  "${SORMANT_COMMON_CFLAGS} ${FLAG}")
    endif()
endforeach()
message(STATUS "Общие флаги компилятора: ${SORMANT_COMMON_CFLAGS}")

# Задать
set ( SORMANT_EBPF_CFLAGS   "" )

# CLANG_FLAGS := ${FLAGS} --target=bpf -std=gnu99 -nostdinc
# # eBPF verifier enforces unaligned access checks where necessary, so don't
# # let clang complain too early.
# CLANG_FLAGS += -ftrap-function=__undefined_trap
# CLANG_FLAGS += -Wall -Wextra -Werror -Wshadow
# CLANG_FLAGS += -Wno-address-of-packed-member
# CLANG_FLAGS += -Wno-unknown-warning-option
# CLANG_FLAGS += -Wno-gnu-variable-sized-type-not-at-end
# CLANG_FLAGS += -Wimplicit-int-conversion -Wenum-conversion
# CLANG_FLAGS += -Wimplicit-fallthrough
# CLANG_FLAGS += -mcpu=v3

# Конец файла