{ lib
, stdenv
, fetchurl
, appimageTools
, makeWrapper
}:

let
  pname = "simplenote";
  version = "2.24.0";

  src = fetchurl {
    url = "https://github.com/Automattic/simplenote-electron/releases/download/v${version}/Simplenote-linux-${version}-x86_64.AppImage";
    sha256 = "sha256-PBNX1W6CV6A6MWdgcdO9y+imreHjDcOF3hgohheTl5k=";
  };

  appimageContents = appimageTools.extractType2 { inherit pname version src; };

in appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/simplenote.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/simplenote.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "The simplest way to keep notes";
    homepage = "https://github.com/Automattic/simplenote-electron";
    license = licenses.gpl2;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
  };
}
