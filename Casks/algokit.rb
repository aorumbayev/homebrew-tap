cask "algokit" do
  arch arm: "arm64", intel: "x64"

  version "2.4.2"
  sha256 arm:   "5a0db2920512035dc31f042e7aeb781568f4a5605683111b866e68a88378c806",
         intel: "d9e51df0e0dd7efd9cc57af68eb05e9c40c449c762b9aeb767853bb49457a1ef"

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
