source 'https://github.com/cocoapods/specs.git'

platform :ios, '11.0'
inhibit_all_warnings!

target 'RebellionTrips' do
  pod 'Alamofire', '~> 4.8'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'lottie-ios', '~> 3.1'

  target 'RebellionTripsTests' do
    inherit! :search_paths
    pod 'OCMock', '~> 2.0.1'
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
  end
end
