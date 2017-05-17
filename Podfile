source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!


target 'PagingMenuControllerDemo' do
  pod "PagingMenuController"
  pod 'Material', '~> 2.0'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'SCLAlertView'
end



post_install do |installer|
 installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
     config.build_settings['SWIFT_VERSION'] = '3.0'
   end
 end
end
