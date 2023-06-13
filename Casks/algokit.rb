# typed: false
# frozen_string_literal: true

cask "algokit" do
  version "1.1.3"
  sha256 "a369e4eef5a076d21bbc15cde6e8fc5635def321cd8b7ee9f0adc0b854002334"

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
