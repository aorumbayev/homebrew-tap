cask "algokit" do
  version "1.10.12"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/aorumbayev/algokit-cli/releases/download/v1.10.12/dist/algokit-cli-macos-py3.12"
  name "algokit"
  desc "Algorand development kit command-line interface"
  homepage "https://github.com/aorumbayev/algokit-cli"

  binary "#{staged_path}/#{token}"

  postflight do
    set_permissions "#{staged_path}/#{token}", '0755'
  end

  uninstall delete: "/usr/local/bin/#{token}"
end
