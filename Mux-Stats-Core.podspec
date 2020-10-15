Pod::Spec.new do |s|
  s.name             = 'Mux-Stats-Core'

  s.version          = '2.4.0'
  s.source           = { :git => 'https://github.com/muxinc/stats-sdk-objc.git',
                         :tag => "v#{s.version}" }

  s.summary          = 'The Mux Stats Core'
  s.description      = 'The Mux stats Core provides performance analytics and QoS monitoring for video.'

  s.homepage         = 'https://mux.com'
  s.social_media_url = 'https://twitter.com/muxhq'

  s.license          = 'Apache 2.0'
  s.author           = { 'Mux' => 'ios-sdk@mux.com' }


  s.ios.deployment_target = '9.0'
  s.ios.frameworks = 'AVKit', 'AVFoundation'
  s.ios.vendored_frameworks = 'XCFramework/MuxCore.xcframework'

  s.tvos.deployment_target = '10.0'
  s.tvos.frameworks = 'AVKit', 'AVFoundation'
  s.tvos.vendored_frameworks = 'XCFramework/MuxCore.xcframework'

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'
  }
end
