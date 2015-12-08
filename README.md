# JKLThreadSafeOperator

[![CI Status](http://img.shields.io/travis/Jiakai Lian/JKLThreadSafeOperator.svg?style=flat)](https://travis-ci.org/Jiakai Lian/JKLThreadSafeOperator)
[![Version](https://img.shields.io/cocoapods/v/JKLThreadSafeOperator.svg?style=flat)](http://cocoapods.org/pods/JKLThreadSafeOperator)
[![License](https://img.shields.io/cocoapods/l/JKLThreadSafeOperator.svg?style=flat)](http://cocoapods.org/pods/JKLThreadSafeOperator)
[![Platform](https://img.shields.io/cocoapods/p/JKLThreadSafeOperator.svg?style=flat)](http://cocoapods.org/pods/JKLThreadSafeOperator)

Make a class thread-safe could be painful, as involving wrapping all your public methods into GCD operations.  

This operator is designated to perform thread-safe operations by simply wrapping read & write operations into corresponding blocks. (For performance comparision between different implementations, please check another repo [ThreadSafeClassDesign](https://github.com/jiakai-lian/ThreadSafeClassDesign)). So without changing original model classes, the project could benefit from multi-threading without compromising the stability.

The main idea behind the scene is applying concurrent read and exclusive write model on a concurrent GCD queue. Additionally, this operator maintains a simple cache to manage queues for each type of class.


## Run Example Projects

To run the example project, clone the repo, and run `pod `install from the Example directory first.

## Usage
#### Read Operation
```
                __block NSUInteger studentsCount;
                [JKLThreadSafeOperator syncReadWithObject:course readBlock:^(JKLCourse * innerReadOnlyCourse) {
                    studentsCount = [innerReadOnlyCourse students].count;
                }];
```

#### Write Operation
```
                [JKLThreadSafeOperator barrierAsyncWriteWithObject:course writeBlock:^(JKLCourse * innerWritableCourse) {
                    [innerWritableCourse addStudentWithStudentName:@"Bob"];
                }];
```


## Requirements

## Installation

JKLThreadSafeOperator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JKLThreadSafeOperator"
```

## Author

Jiakai Lian, jiakai.lian@gmail.com

## License

JKLThreadSafeOperator is available under the MIT license. See the LICENSE file for more info.
