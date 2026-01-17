# This is a flake for OSINT CTF.
{
  description = "for OCINT CTF Flake";
  inputs = {
    nixpkgs.url = "git+https://github.com/nixos/nixpkgs?shallow=1&ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              exiftool # 画像のメタデータを見る
              tor-browser # .onionドメインのダークウェブにアクセスする
              ffmpeg-full # 動画をばらしてフレームに分解する
              libreoffice-qt # PDFの解析をする

              pkgs.python313
              pkgs.uv
            ];
          };
        };
    };
}
