#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/hyeonbeen/carto_ws/src/ros_control/rqt_controller_manager"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/hyeonbeen/carto_ws/install_isolated/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/hyeonbeen/carto_ws/install_isolated/lib/python2.7/dist-packages:/home/hyeonbeen/carto_ws/build_isolated/rqt_controller_manager/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/hyeonbeen/carto_ws/build_isolated/rqt_controller_manager" \
    "/usr/bin/python2" \
    "/home/hyeonbeen/carto_ws/src/ros_control/rqt_controller_manager/setup.py" \
    build --build-base "/home/hyeonbeen/carto_ws/build_isolated/rqt_controller_manager" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/hyeonbeen/carto_ws/install_isolated" --install-scripts="/home/hyeonbeen/carto_ws/install_isolated/bin"
