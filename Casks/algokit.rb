# typed: false
# frozen_string_literal: true

cask "algokit" do
  version "2.0.6"
  sha256 "5b663e3261a3955eaf9ff0adecafde6df18c90db20137320154b30a14ea257d3"

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
