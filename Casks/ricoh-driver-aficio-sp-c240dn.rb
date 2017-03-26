# Install via: brew cask ricoh-driver-aficio-sp-c240dn
cask 'ricoh-driver-aficio-sp-c240dn' do
  version '2.03'
  sha256 '0dc9cd53ed6382b82b363969b15333096c7f25f8b99c930ed61ef524963b154f'

  url 'http://support.ricoh.com/bb/pub_e/dr_ut_e/0001296/0001296979/V203/r76678Lf.dmg'
  name 'Ricoh Aficio SP C240DN driver'
  homepage 'http://support.ricoh.com/bb/html/dr_ut_e/ra/model/spc240/spc240fr.htm'
  license :closed 

  pkg  'Ricoh Aficio SP C240DN.pkg'
  uninstall :pkgutil => 'printer.RICOH Aficio SP C240DN.com'
end
