cask "algokit" do
  version "1.10.19"
  sha256 "2221d6d73e1ffd487a90328dc505fefbc63b10eb4ec98af311f7fb27963b00ba"

  url "https://github.com/aorumbayev/algokit-cli/releases/download/v#{version}/algokit-v#{version}-macos-py3.12.zip"
  name "algokit"
  desc "Algorand development kit command-line interface"
  homepage "https://github.com/aorumbayev/algokit-cli"

  binary "#{staged_path}/#{token}"

  postflight do
    set_permissions "#{staged_path}/#{token}", "0755"
  end

  uninstall delete: "/usr/local/bin/#{token}"
end
