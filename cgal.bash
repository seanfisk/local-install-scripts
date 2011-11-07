#!/bin/bash
source cmake_install.bash

cmake_install https://gforge.inria.fr/frs/download.php/29125/CGAL-3.9.tar.gz
make demos
make examples
