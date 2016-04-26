
# GEOS

[![Build Status](https://api.travis-ci.org/Ryandev/GEOS-iOS.svg)](https://travis-ci.org/Ryandev/GEOS-iOS)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-LGPLv2.1-blue.svg)](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html)

GEOS (Geometry Engine - Open Source) is a C++ port of the ​Java Topology Suite (JTS). As such, it aims to contain the complete functionality of JTS in C++. This includes all the ​OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced topology functions.

## Build
Add this repository to your projects Cartfile
```
github 'Ryandev/GEOS-iOS' == 4.9.2
```
and run ```carthage update```

## Usage

* Include built geos.framework into xcode project and add header
```objc
#import <geos/geos.h>
```


## Documentation
Full GEOS documentation can be found [here](http://geos.osgeo.org/doxygen/)


## License
[LGPL](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html)

