Pod::Spec.new do |s|
  s.name             = 'MikeUI'
  s.version          = '1.0.0'
  s.summary          = 'MikeUI'

  s.description      = <<-DESC
Testing MultiPod.
                       DESC

  s.homepage         = 'https://google.com'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.authors          = 'Mike Donahue'

  s.source           = {
    :git => 'https://github.com/MikeDonahue/MultiPods.git',
    :tag => 'MikeUI-' + s.version.to_s
  }

  s.social_media_url = 'https://github.com/mikedonahue'
  s.ios.deployment_target = '15.0'
  # s.osx.deployment_target = '10.13'
  # s.tvos.deployment_target = '12.0'

  s.cocoapods_version = '>= 1.4.0'
  s.swift_version = '5.3'

  # s.default_subspec = 'Core'
  s.dependency 'MikeFoundation', '~> 1.0.0'
  s.dependency 'MikeCore', '~> 1.0.0'

  source = 'MikeUI/MikeUI/**/*.swift'
  s.source_files = [
    source,
  ]

end