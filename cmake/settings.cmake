# Общие настройки для сборки

# Проверяем, что поддерживается компилятором и компоновщиком
message(CHECK_START "Компоновщик поддерживает PIE?")
include(CheckPIESupported)
check_pie_supported(OUTPUT_VARIABLE output LANGUAGES C )
if (CMAKE_C_LINK_PIE_SUPPORTED)
    message( CHECK_PASS "Да!")
else()
    message( CHECK_FAIL "Нет. ${output}")
endif()

# Настраиваем параметры сборки
set ( CMAKE_CXX_STANDARD 23 )
set ( CMAKE_CXX_STANDARD_REQUIRED True )

# Конец файла