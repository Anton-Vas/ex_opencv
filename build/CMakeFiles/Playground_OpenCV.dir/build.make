# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dev/Desktop/EX_openCV

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dev/Desktop/EX_openCV/build

# Include any dependencies generated for this target.
include CMakeFiles/Playground_OpenCV.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Playground_OpenCV.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Playground_OpenCV.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Playground_OpenCV.dir/flags.make

CMakeFiles/Playground_OpenCV.dir/main.cpp.o: CMakeFiles/Playground_OpenCV.dir/flags.make
CMakeFiles/Playground_OpenCV.dir/main.cpp.o: ../main.cpp
CMakeFiles/Playground_OpenCV.dir/main.cpp.o: CMakeFiles/Playground_OpenCV.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dev/Desktop/EX_openCV/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Playground_OpenCV.dir/main.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Playground_OpenCV.dir/main.cpp.o -MF CMakeFiles/Playground_OpenCV.dir/main.cpp.o.d -o CMakeFiles/Playground_OpenCV.dir/main.cpp.o -c /home/dev/Desktop/EX_openCV/main.cpp

CMakeFiles/Playground_OpenCV.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Playground_OpenCV.dir/main.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dev/Desktop/EX_openCV/main.cpp > CMakeFiles/Playground_OpenCV.dir/main.cpp.i

CMakeFiles/Playground_OpenCV.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Playground_OpenCV.dir/main.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dev/Desktop/EX_openCV/main.cpp -o CMakeFiles/Playground_OpenCV.dir/main.cpp.s

CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o: CMakeFiles/Playground_OpenCV.dir/flags.make
CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o: ../SystemManager/SystemManager.cpp
CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o: CMakeFiles/Playground_OpenCV.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dev/Desktop/EX_openCV/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o -MF CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o.d -o CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o -c /home/dev/Desktop/EX_openCV/SystemManager/SystemManager.cpp

CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dev/Desktop/EX_openCV/SystemManager/SystemManager.cpp > CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.i

CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dev/Desktop/EX_openCV/SystemManager/SystemManager.cpp -o CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.s

CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o: CMakeFiles/Playground_OpenCV.dir/flags.make
CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o: ../SystemManager/SysParams.cpp
CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o: CMakeFiles/Playground_OpenCV.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dev/Desktop/EX_openCV/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o -MF CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o.d -o CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o -c /home/dev/Desktop/EX_openCV/SystemManager/SysParams.cpp

CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dev/Desktop/EX_openCV/SystemManager/SysParams.cpp > CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.i

CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dev/Desktop/EX_openCV/SystemManager/SysParams.cpp -o CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.s

CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o: CMakeFiles/Playground_OpenCV.dir/flags.make
CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o: ../DebugPrint/DebugPrint.cpp
CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o: CMakeFiles/Playground_OpenCV.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dev/Desktop/EX_openCV/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o -MF CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o.d -o CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o -c /home/dev/Desktop/EX_openCV/DebugPrint/DebugPrint.cpp

CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dev/Desktop/EX_openCV/DebugPrint/DebugPrint.cpp > CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.i

CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dev/Desktop/EX_openCV/DebugPrint/DebugPrint.cpp -o CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.s

# Object files for target Playground_OpenCV
Playground_OpenCV_OBJECTS = \
"CMakeFiles/Playground_OpenCV.dir/main.cpp.o" \
"CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o" \
"CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o" \
"CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o"

# External object files for target Playground_OpenCV
Playground_OpenCV_EXTERNAL_OBJECTS =

Playground_OpenCV: CMakeFiles/Playground_OpenCV.dir/main.cpp.o
Playground_OpenCV: CMakeFiles/Playground_OpenCV.dir/SystemManager/SystemManager.cpp.o
Playground_OpenCV: CMakeFiles/Playground_OpenCV.dir/SystemManager/SysParams.cpp.o
Playground_OpenCV: CMakeFiles/Playground_OpenCV.dir/DebugPrint/DebugPrint.cpp.o
Playground_OpenCV: CMakeFiles/Playground_OpenCV.dir/build.make
Playground_OpenCV: /usr/local/lib/libopencv_gapi.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_stitching.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_aruco.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_barcode.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_bgsegm.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_bioinspired.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_ccalib.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_dnn_objdetect.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_dnn_superres.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_dpm.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_face.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_freetype.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_fuzzy.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_hfs.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_img_hash.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_intensity_transform.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_line_descriptor.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_mcc.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_quality.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_rapid.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_reg.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_rgbd.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_saliency.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_stereo.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_structured_light.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_superres.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_surface_matching.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_tracking.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_videostab.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_wechat_qrcode.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_xfeatures2d.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_xobjdetect.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_xphoto.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_shape.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_highgui.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_datasets.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_plot.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_text.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_ml.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_phase_unwrapping.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_optflow.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_ximgproc.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_video.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_videoio.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_imgcodecs.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_objdetect.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_calib3d.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_dnn.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_features2d.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_flann.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_photo.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_imgproc.so.4.5.5
Playground_OpenCV: /usr/local/lib/libopencv_core.so.4.5.5
Playground_OpenCV: CMakeFiles/Playground_OpenCV.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dev/Desktop/EX_openCV/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable Playground_OpenCV"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Playground_OpenCV.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Playground_OpenCV.dir/build: Playground_OpenCV
.PHONY : CMakeFiles/Playground_OpenCV.dir/build

CMakeFiles/Playground_OpenCV.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Playground_OpenCV.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Playground_OpenCV.dir/clean

CMakeFiles/Playground_OpenCV.dir/depend:
	cd /home/dev/Desktop/EX_openCV/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dev/Desktop/EX_openCV /home/dev/Desktop/EX_openCV /home/dev/Desktop/EX_openCV/build /home/dev/Desktop/EX_openCV/build /home/dev/Desktop/EX_openCV/build/CMakeFiles/Playground_OpenCV.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Playground_OpenCV.dir/depend

