# OSINT_nix

このリポジトリは、OSINT（オープンソースインテリジェンス）を目的としたNixプロジェクトで、Nix flakesによって管理され、環境管理のために`direnv`と統合されています。

## セットアップ

1.  **Nixのインストール**: Nixがインストールされていない場合は、[Nixウェブサイト](https://nixos.org/download/)の指示に従ってインストールしてください。Nix flakesが有効になっていることを確認してください（`~/.config/nix/nix.conf`に`experimental-features = nix-command flakes`を追加）。

2.  **direnvのインストール**: `direnv`がインストールされていない場合は、システムのパッケージマネージャーまたはNix経由でインストールしてください。
    ```bash
    nix-env -iA nixpkgs.direnv
    ```
    その後、シェルにフックを設定してください（例：Bashの場合、`~/.bashrc`に`eval "$(direnv hook bash)"`を追加）。

3.  **リポジトリのクローン**:
    ```bash
    git clone https://github.com/Yus314/OSINT_nix.git
    cd OSINT_nix
    ```

4.  **direnvの許可**:
    ディレクトリに入ると、`direnv`は`.envrc`ファイルを検出します。環境をロードするために、`direnv`を許可する必要があります。
    ```bash
    direnv allow
    ```
    これにより、`flake.nix`と`.envrc`で定義された開発環境が設定されます。

## 使用方法

`direnv`が環境をロードすると、このディレクトリ内で`flake.nix`で定義されたツールと依存関係にアクセスできるようになります。