# typed: false
# frozen_string_literal: true

cask "algokit" do
  version "2.3.0"
  sha256 "d91ae981080e3e44d389dd113bc1a2dccd7e01898c4b5fa2a284dcc8569609a6"

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
