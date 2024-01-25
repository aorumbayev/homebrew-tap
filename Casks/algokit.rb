cask "algokit" do
  version "1.10.22"
  sha256 "63d3eaefea9c6c4a2474afdf92275f4a9c4418a7afe4ffed0a5d52103eaf2536"

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
