execute_process(COMMAND "/home/hyeonbeen/carto_ws/build_isolated/controller_manager_msgs/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/hyeonbeen/carto_ws/build_isolated/controller_manager_msgs/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
