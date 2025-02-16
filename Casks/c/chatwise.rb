cask "chatwise" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.81"
  sha256 arm:   "26a9161f83fd2149e0100ac9a2de40d9f3c6811eeb53efadabbc1bc34869b471",
         intel: "4bf4dd2278dc122dd00531c72c973ca18f21f551b4b53849e9eb9e64ef4aaff2"

  url "https://github.com/egoist/chatwise-releases/releases/download/v#{version}/ChatWise_#{version}_#{arch}.dmg",
      verified: "github.com/egoist/chatwise-releases/"
  name "ChatWise"
  desc "AI chatbot for many LLMs"
  homepage "https://chatwise.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "ChatWise.app"

  uninstall quit: "app.chatwise"

  zap trash: [
    "~/Library/Application Support/app.chatwise",
    "~/Library/Caches/app.chatwise",
    "~/Library/Saved Application State/app.chatwise.savedState",
    "~/Library/WebKit/app.chatwise",
  ]
end
