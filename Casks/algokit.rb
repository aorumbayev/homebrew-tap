cask "algokit" do
  arch arm: "arm64", intel: "x64"

  version "2.4.3"
  sha256 arm:   "e9289bcb20c3f1d6d1f4064cad7d3af085de58dea7b4cc5add91296fce2c93a1",
         intel: "65164f83e564f4e712dfee64fdd07574a42899686792e130b585d07506a2f1c1"

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
