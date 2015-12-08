#
# Be sure to run `pod lib lint JKLThreadSafeOperator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JKLThreadSafeOperator"
  s.version          = "0.1.0"
  s.summary          = "A light-weight thread-safe operation wrapper used to perform sync read, aync barrier write on a concurrent queue."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Make a class thread-safe could be painful, as involving wrapping all your public methods into GCD operations.  

This operator is designated to perform thread-safe operations by simply wrapping read & write operations into corresponding blocks. So without changing original model classes, the project could benefit from multi-threading without compromising the stability.
                       DESC

  s.homepage         = "https://github.com/jiakai-lian/JKLThreadSafeOperator"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jiakai Lian" => "jiakai.lian@gmail.com" }
  s.source           = { :git => "https://github.com/jiakai-lian/JKLThreadSafeOperator.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JKLThreadSafeOperator' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

