{ pkgs, ... }: 

let
  profile_name = "taran";
in 
{
  programs.firefox = {
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

      SearchBar = "unified"; # or separate
      
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
      };
    };
    profiles."${profile_name}" = {
      id = 0;
      name = "${profile_name}";
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;

        # Sidebar specific
        "sidebar.main.tools" = "history,{446900e4-71c2-419f-a6a7-df9c091e268b}";
        "sidebar.position_start" = false;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "sidebar.new-sidebar.has-used" = true;
      };
      search = {
        default = "ddg";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "YouTube Search" = {
            urls = [
              {
                template = "https://youtube.com/results";
                params = [
                  { name = "search_query"; value = "{searchTerms}"; }
                ];
              }
            ];
            # icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@yt"];
          };

        };
      };
    };
  };
}
