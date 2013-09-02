function(__dot_files_get_unique_target_name _name _unique_name)
   set(propertyName "_DOT_FILES_UNIQUE_COUNTER_${_name}")
   get_property(currentCounter GLOBAL PROPERTY "${propertyName}")
   if(NOT currentCounter)
      set(currentCounter 1)
   endif()
   set(${_unique_name} "${_name}_${currentCounter}" PARENT_SCOPE)
   math(EXPR currentCounter "${currentCounter} + 1")
   set_property(GLOBAL PROPERTY ${propertyName} ${currentCounter} )
endfunction()

function(__dot_files_global_targets)
  set(__target_added)
  get_property(__target_added GLOBAL PROPERTY "__DOT_FILES_TARGETS_ADDED")
  if(__target_added)
    return()
  endif()
  add_custom_target(check-link)
  add_custom_target(link-home)
  set_property(GLOBAL PROPERTY "__DOT_FILES_TARGETS_ADDED" 1)
endfunction()
__dot_files_global_targets()

function(link_home src dest)
  get_filename_component(fullsrc "${src}" ABSOLUTE)
  __dot_files_get_unique_target_name(link-home targetname)
  set(fulldest "$ENV{HOME}/${dest}")
  get_filename_component(dest_path "${fulldest}" PATH)
  add_custom_target(${targetname}
    COMMAND cmake -E cmake_echo_color --green
    "Link ${fullsrc} to ${fulldest}"
    COMMAND mkdir -p "${dest_path}"
    COMMAND ln -sfT "${fullsrc}" "${fulldest}"
    DEPENDS "${src}")
  add_dependencies(link-home ${targetname})
  add_custom_target(${targetname}.check
    COMMAND test -L "${fulldest}" || cmake -E cmake_echo_color --red
    "${fulldest} is not a symlink")
  add_dependencies(check-link ${targetname}.check)
endfunction()
