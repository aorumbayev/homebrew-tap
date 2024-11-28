cask "algokit" do
  arch arm: "arm64", intel: "x64"

  version "2.5.1"
  sha256 arm:   "295432f3a4f402c7b57752346e1b788dc54f2ccc40d498f043f8f26b4672d877",
         intel: "3f9ecedd37740f5257d4ed288e410935a08c68e6cf1465f7da81db33e9a1148e"

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
