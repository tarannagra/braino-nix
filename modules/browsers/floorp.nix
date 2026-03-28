{ pkgs, ... }: 

{
  programs.floorp = {
    enable = true;

    languagePacks = ["en-GB"];
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      DisplayBookmarksToolbar = "never";
      
      BlockAboutConfig = false;

      DownloadDirectory = "\${home}/downloads/browsers/floorp";
      DefaultDownloadDirectory = "\${home}/downloads/browsers/floorp";
      DontCheckDefaultBrowser = true;

      DisableAccounts = true;
      DisableDeveloperTools = false;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFormHistory = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
      };

      HttpsOnlyMode = "force_enabled";

      # SearchBar = "unified"; # or separate
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Locked = true;
      };
      GenerativeAI = {
        Enabled = false;
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };

      Preferences = {
        "floorp.mousegesture.enabled" = false;
        "floorp.panelSidebar.enabled" = true;
        "sidebar.new-sidebar.has-used" = true;
        "sidebar.position_start" = false;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
      };

      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
          private_browsing = true;
        };
        "sponsorBlocker@ajay.app" = {
          install_url = moz "sponsorblock";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "deArrow@ajay.app" = {
          install_url = moz "dearrow";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = moz "bitwarden-password-manager";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = moz "vimium-ff";
          installation_mode = "force_installed";
          updates_disabled = true;
          private_browsing = true;
        };
        "firefox@commafeed.com" = {
          install_url = moz "commafeed";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "@crw-extension-firefox" = {
          install_url = moz "consumer-rights-wiki";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
      };
    };
  };
}
