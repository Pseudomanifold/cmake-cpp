INCLUDE( FindPackageHandleStandardArgs )

# Checks an environment variable; note that the first check
# does not require the usual CMake $-sign.
IF( DEFINED ENV{FOO_DIR} )
  SET( FOO_DIR "$ENV{FOO_DIR}" )
ENDIF()

FIND_PATH(
  FOO_INCLUDE_DIR
    foo/foo.h
  HINTS
    ${FOO_DIR}
)

FIND_PACKAGE_HANDLE_STANDARD_ARGS( FOO DEFAULT_MSG
  FOO_INCLUDE_DIR
)

IF( FOO_FOUND )
  SET( FOO_INCLUDE_DIRS ${FOO_INCLUDE_DIR} )

  MARK_AS_ADVANCED(
    FOO_INCLUDE_DIR
    FOO_DIR
  )
ELSE()
  SET( FOO_DIR "" CACHE STRING
    "An optional hint to a directory for finding `foo`"
  )
ENDIF()
