cask "algokit" do
  version "0.1.2"
  sha256 "a9aae863f5cd95434ce1c4e6d1cbaf17927c68aeeacf0cf6c7de863cf1d48f32"
  
  url "https://github.com/algorandfoundation/algokit-cli/releases/download/v0.1.2/algokit_cli-0.1.2-py3-none-any.whl"
  name "algokit"
  desc "Algorand development kit command-line interface"
  homepage "https://github.com/algorandfoundation/algokit-cli"
  container type: :naked

  depends_on formula: "pipx"
  
  installer script: {
    executable: "pipx",
    args: ["install", "#{staged_path}/algokit_cli-0.1.2-py3-none-any.whl"],
  }

  installer script: {
    executable: "bash",
    args: ["-c", "echo /usr/local/bin/pipx uninstall algokit_cli >#{staged_path}/uninstall.sh"],
  }

  uninstall script: {
    executable: "bash",
    args: ["#{staged_path}/uninstall.sh"]
  }
end
