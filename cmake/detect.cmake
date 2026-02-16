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

# 
message( STATUS "Флаги компилятора:" )
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

# Проверяем, что поддерживается компилятором и компоновщиком
message(CHECK_START "Компоновщик поддерживает PIE?")
include(CheckPIESupported)
check_pie_supported(OUTPUT_VARIABLE output LANGUAGES C )
if (CMAKE_C_LINK_PIE_SUPPORTED)
    message( CHECK_PASS "Да!")
else()
    message( CHECK_FAIL "Нет. ${output}")
endif()

# Конец файла