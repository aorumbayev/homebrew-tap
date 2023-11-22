# typed: false
# frozen_string_literal: true

cask "algokit" do
  version "1.7.1"
  sha256 "f9428e49ea3e668fc184d80de19e7765639135f410b06a0561a990acf90974e3"

  url "https://github.com/algorandfoundation/algokit-cli/releases/download/v#{version}/algokit-#{version}-py3-none-any.whl"
  name "algokit"
  desc "Algorand development kit command-line interface"
  homepage "https://github.com/algorandfoundation/algokit-cli"

  depends_on formula: "pipx"
  container type: :naked

  installer script: {
    executable:   "pipx",
    args:         ["install", "--force", "#{staged_path}/algokit-#{version}-py3-none-any.whl"],
    print_stderr: false,
  }
  installer script: {
    executable: "pipx",
    args:       ["ensurepath"],
  }
  installer script: {
    executable: "bash",
    args:       ["-c", "echo $(which pipx) uninstall algokit >#{staged_path}/uninstall.sh"],
  }

  uninstall script: {
    executable: "bash",
    args:       ["#{staged_path}/uninstall.sh"],
  }
end
