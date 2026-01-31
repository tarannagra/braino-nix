{ inputs, pkgs, ...}:

{
  programs.nixcord = {
    enable = true;

    vesktop.enable = true;

    config = {
      plugins = {
        # there are so many plugins which should be built in to native discord
        # discord would be so much more ideal with all these QOL plugins
        ClearURLs.enable = true;
        callTimer.enable = true;
        fakeNitro.enable = true;
        forceOwnerCrown.enable = true;
        messageLogger = {
          enable = true;
          ignoreBots = true;
          ignoreSelf = true;
        };
        noProfileThemes.enable = true;
        noTypingAnimation.enable = true;
        readAllNotificationsButton.enable = true;
        showHiddenChannels.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
