Pod::Spec.new do |s|
  s.name             = 'MultiPod'
  s.version          = '1.0.0'
  s.summary          = 'MultiPod'

  s.description      = <<-DESC
Testing MultiPod.
                       DESC

  s.homepage         = 'https://google.com'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.authors          = 'Mike Donahue'

  s.source           = {
    :git => 'https://github.com/MikeDonahue/MultiPods.git',
    :tag => 'CocoaPods-' + s.version.to_s
  }

  # s.preserve_paths = [
  #   "MikeFoundationOnly/CHANGELOG.md",
  #   "MikeFoundationOnly/NOTICES",
  #   "CoreOnly/README.md"
  # ]

  s.social_media_url = 'https://github.com/mikedonahue'
  s.ios.deployment_target = '15.0'
  # s.osx.deployment_target = '10.13'
  # s.tvos.deployment_target = '12.0'

  s.cocoapods_version = '>= 1.4.0'

  s.swift_version = '5.3'

  # s.default_subspec = 'Core'

  s.subspec 'MikeFoundation' do |ss|
    ss.source_files = 'MikeFoundation/MikeFoundation/'
  end

  s.subspec 'MikeCore' do |ss|
    ss.source_files = 'MikeCore/MikeCore/'
    ss.dependency 'MultiPod/MikeFoundation'
  end

  s.subspec 'MikeUI' do |ss|
    ss.source_files = 'MikeUI/MikeUI/'
    ss.dependency 'MultiPod/MikeFoundation'
    ss.dependency 'MultiPod/MikeCore'
  end

end