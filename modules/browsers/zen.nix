{ pkgs, inputs, ... }: 

let
  profile_name = "main";
in 
{
  programs.zen-browser = {
    enable = true;

    # use this:
    # https://github.com/0xc000022070/zen-browser-flake/tree/b6b1e625e4aa049b59930611fc20790c0ccbc840?tab=readme-ov-file#preferences
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      DisplayBookmarksToolbar = "never";
      
      BlockAboutConfig = false;

      DefaultDownloadDirectory = "\${home}/Downloads";
      DontCheckDefaultBrowser = true;

      DisableAccounts = true;
      DisableDeveloperTools = false;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
      };

      HttpsOnlyMode = "force_enabled";
      
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "sponsorBlocker@ajay.app" = {
          install_url = moz "sponsorblock";
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
        };
        "firefox@commafeed.com" = {
          install_url = moz "commafeed";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "{91aa3897-2634-4a8a-9092-279db23a7689}" = {
          install_url = moz "zen-internet";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "privacy-redirect@example.com" = {
          install_url = moz "privacy-please";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
      };

     profiles.default = {
        isDefault = true;
        settings = {
          # zen specific
          "zen.welcome-screen.seen" = true;
          "zen.tabs.vertical.right-side" = true;
          "zen.view.compact.enable-at-startup" = false;
          "zen.theme.content-element-separation" = 0;
        };
        search = {
          force = true;
          default = "duckduckgo";
        };
      }; 
    };
  };
}
