# Uncomment this line to define a global platform for your project
platform :ios, '11.0'

target 'twitter' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  #use_frameworks!

  # Pods for twitter
  pod 'AFNetworking'
  pod 'BDBOAuth1Manager'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end