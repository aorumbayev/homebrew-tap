cask "algokit" do
  arch arm: "arm64", intel: "x64"

  version "2.4.1"
  sha256 arm:   "02adbda5a7b4fce3fadba1e70c29c21a2b922a39ad571e622d0a566b2cda010b",
         intel: "3616e742b651b8b94f4caabe36bdd255982482db73005cfa95bf3b8d509d9448"

  url "https://github.com/algorandfoundation/algokit-cli/releases/download/v#{version}/algokit-#{version}-macos_#{arch}-brew.tar.gz"
  name "algokit"
  desc "Algorand development kit command-line interface"
  homepage "https://github.com/algorandfoundation/algokit-cli"

  binary "#{staged_path}/#{token}"

  postflight do
    set_permissions "#{staged_path}/#{token}", "0755"
  end

  uninstall delete: "/usr/local/bin/#{token}"
end
