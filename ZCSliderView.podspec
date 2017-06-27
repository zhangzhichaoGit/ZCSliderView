
Pod::Spec.new do |s|

s.name         = "ZCSliderView"
s.version      = "0.0.1"
s.summary      = "ZCSliderView."
s.homepage     = "https://github.com/zhangzhichaoGit/ZCSliderView"
s.license      = { :type => "MIT", :file => "LICENSE" }
# s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
s.author             = { "无痕超" => "490914645@qq.com" }
s.social_media_url   = "https://github.com/zhangzhichaoGit"
s.platform     = :ios, "8.0"
s.ios.deployment_target = "8.0"
s.source       = { :git => "https://github.com/zhangzhichaoGit/ZCSliderView.git", :tag => "#{s.version}" }
s.source_files  = "ZCSliderView/**/*.{h,m}"

s.public_header_files = ['ZCSliderView/*.h']

s.frameworks = "UIKit","Foundation"
s.requires_arc = true

# s.library   = "iconv"
# s.libraries = "iconv", "xml2"

end
