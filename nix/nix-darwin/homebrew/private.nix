{
  # プライベート用だけで入れたい Homebrew CLI はここに追加する。
  brews = [ ];

  # プライベート用だけで使う tap はここに追加する。
  taps = [ ];

  # プライベート用だけで入れたい GUI アプリやフォントはここに追加する。
  casks = [
    "altserver"
  ];

  # プライベート用だけで入れたい Mac App Store アプリはここに追加する。
  masApps = {
    "Xcode" = 497799835;
  };
}
