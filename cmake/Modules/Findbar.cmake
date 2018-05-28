# Checks an environment variable; note that the first check
# does not require the usual CMake $-sign.
IF( DEFINED ENV{BAR_DIR} )
  SET( BAR_DIR "$ENV{BAR_DIR}" )
ENDIF()

FIND_PATH(
  BAR_INCLUDE_DIR
    bar/bar.h
  HINTS
    ${BAR_DIR}
)

FIND_LIBRARY( BAR_LIBRARY
  NAMES bar
  HINTS ${BAR_DIR}
)

FIND_PACKAGE_HANDLE_STANDARD_ARGS( BAR DEFAULT_MSG
  BAR_INCLUDE_DIR
  BAR_LIBRARY
)

IF( BAR_FOUND )
  SET( BAR_INCLUDE_DIRS ${BAR_INCLUDE_DIR} )
  SET( BAR_LIBRARIES ${BAR_LIBRARY} )

  MARK_AS_ADVANCED(
    BAR_LIBRARY
    BAR_INCLUDE_DIR
    BAR_DIR
  )
ELSE()
  SET( BAR_DIR "" CACHE STRING
    "An optional hint to a directory for finding `bar`"
  )
ENDIF()
