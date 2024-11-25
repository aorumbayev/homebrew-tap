cask "algokit" do
  arch arm: "arm64", intel: "x64"

  version "2.5.0"
  sha256 arm:   "4825b6c479f230f2536f6f8b5ad396f5a6970fc82782c944ccb53ff7cf2ddc2e",
         intel: "23b6f85db4041975ba856ea411adbda5276747fd859a4d08d3b2ca243423b608"

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
