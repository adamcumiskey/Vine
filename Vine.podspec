#
# Be sure to run `pod lib lint Vine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Vine'
  s.version          = '2.0.5'
  s.summary          = 'A library for growing applications'

  s.description      = <<-DESC
  Vine provides a lightweight library for coordinating navigation in an iOS application.
                       DESC

  s.homepage         = 'https://github.com/adamcumiskey/Vine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adam' => 'adam.cumiskey@gmail.com' }
  s.source           = { :git => 'https://github.com/adamcumiskey/Vine.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'
  s.swift_version = '4.2'

  s.source_files = 'Vine/Classes/**/*'
end
