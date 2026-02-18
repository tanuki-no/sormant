# Опции проекта

if(NOT "${CMAKE_BUILD_TYPE}" STREQUAL "Release" AND
   NOT "${CMAKE_BUILD_TYPE}" STREQUAL "Debug" AND
   NOT "${CMAKE_BUILD_TYPE}" STREQUAL "RelWithDebInfo")

  if(NOT "${CMAKE_BUILD_TYPE}" STREQUAL "")
    message(FATAL_ERROR "sormant - неверный тип  сборки: ${CMAKE_BUILD_TYPE}")
  endif()
endif()

option(SORMANT_ENABLE_TESTS "Запускать тесты после сборки")

set(CMAKE_EXPORT_COMPILE_COMMANDS true CACHE BOOL "Сохранить параметры сборки в файле compile_commands.json (переписать)" FORCE)

# Конец файла