Pod::Spec.new do |s|
  s.name         = "KCNaviTransition"
  s.version      = "0.0.1"
  s.ios.deployment_target = '8.0'
  s.summary      = "简介"
  s.homepage     = "https://github.com/wkrelease/KCNaviTransition"
  s.social_media_url = 'https://github.com/wkrelease/KCNaviTransition'
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "cocoakc" => "18501987683@163.com" }
  s.source       = { :git => 'https://github.com/wkrelease/KCNaviTransition.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'KCNaviTransition/*'
  #s.public_header_files = 'KCNaviTransition/KCNaviTransition.h'
 
end