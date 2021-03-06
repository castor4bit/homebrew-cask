cask 'launchcontrol' do
  version '1.50'
  sha256 '6fd8a31784854c21a978f989b4c75fd5a64f4273f56428e297aeffaf467760f2'

  url "https://www.soma-zone.com/download/files/LaunchControl-#{version}.tar.bz2"
  appcast 'https://www.soma-zone.com/LaunchControl/a/appcast.xml'
  name 'LaunchControl'
  homepage 'https://www.soma-zone.com/LaunchControl/'

  auto_updates true

  app 'LaunchControl.app'

  uninstall delete:    '/Library/PrivilegedHelperTools/com.soma-zone.LaunchControl.Helper',
            launchctl: 'com.soma-zone.LaunchControl.Helper',
            quit:      [
                         'com.soma-zone.JobWatch',
                         'com.soma-zone.LaunchControl',
                         'com.soma-zone.LicenseWindow',
                         'com.soma-zone.QuickLaunch',
                       ]

  zap trash: [
               '~/Library/Application Support/LaunchControl',
               '~/Library/Caches/com.apple.helpd/Generated/com.soma-zone.LaunchControl.help*',
               '~/Library/Caches/com.apple.helpd/Generated/LaunchControl Help*',
               '~/Library/Caches/com.soma-zone.LaunchControl',
               '~/Library/Preferences/com.soma-zone.LaunchControl.plist',
             ]
end
