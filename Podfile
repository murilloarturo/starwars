source 'https://github.com/cocoapods/specs.git'

platform :ios, '11.0'
inhibit_all_warnings!

def network
  pod 'Alamofire', '~> 4.8'
  pod 'AlamofireImage', '~> 3.5'
end

def rx
  pod 'RxSwift',   '~> 5.0'
  pod 'RxCocoa',   '~> 5.0'
  pod 'RxReachability'
end

def ui
  pod 'lottie-ios', '~> 3.1'
end

target 'RebellionTrips' do
  network
  rx
  ui
  
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
