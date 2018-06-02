


source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'Reddit-Clone' do
  use_frameworks!
  pod 'SwiftyJSON'
  pod 'Alamofire'
  pod 'Kingfisher', '~> 4.0'
end
# Workaround for Cocoapods issue #7606
post_install do |installer|
   installer.pods_project.build_configurations.each do |config|
       config.build_settings.delete('CODE_SIGNING_ALLOWED')
       config.build_settings.delete('CODE_SIGNING_REQUIRED')
   end
end
