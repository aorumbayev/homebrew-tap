# typed: false
# frozen_string_literal: true

cask "algokit" do
  version "1.5.1"
  sha256 "a06806723c6ac31c3c4b8a7b763c22d8c3b0467da04303e39dc0091cc94b8c93"

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
