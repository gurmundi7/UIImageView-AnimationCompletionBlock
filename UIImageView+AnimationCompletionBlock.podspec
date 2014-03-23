Pod::Spec.new do |s|
  s.name         = "UIImageView+AnimationCompletionBlock"
  s.version      = "1.0.0"
  s.summary      = "Category on UIImageView that provides an alternative to startAnimation that allows a completion block."
  s.homepage     = "https://github.com/gurmundi7/UIImageView-AnimationCompletionBlock"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Gurpreet Singh Mundi" => "unknown" }
  s.platform     = :ios
  s.ios.deployment_target = "5.1.1"
  s.source       = { :git => "https://github.com/gurmundi7/UIImageView-AnimationCompletionBlock" }
  s.public_header_files = 'imageViewAnimationCompletion/UIImageView+AnimationCompletion.h'
  s.source_files = 'imageViewAnimationCompletion/UIImageView+AnimationCompletion.{h,m}'
  s.requires_arc = true
end
