cask "algokit" do
  version "1.10.20"
  sha256 "649b972a50d418a7791ed3b72e65421e24479764980f1b2dee24e626bc0f22f2"

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
