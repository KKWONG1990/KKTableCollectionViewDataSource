#
# Be sure to run `pod lib lint KKTableCollectionViewDataSource.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KKTableCollectionViewDataSource'
  s.version          = '0.1.0'
  s.summary          = 'KKTableCollectionViewDataSource是对tableview的封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
对TableView进行封装，免写数据源和代理方式，实现数据驱动UI，并且集成下拉刷新和下来加载以及空视图
                       DESC

  s.homepage         = 'https://github.com/KKWONG1990/KKTableCollectionViewDataSource'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KKWONG1990' => 'kkwong90@163.com' }
  s.source           = { :git => 'https://github.com/KKWONG1990/KKTableCollectionViewDataSource.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KKTableCollectionViewDataSource/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KKTableCollectionViewDataSource' => ['KKTableCollectionViewDataSource/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'MJRefresh'
end
