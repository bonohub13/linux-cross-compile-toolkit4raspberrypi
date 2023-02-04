# ARM/ARM64 Linux kernel cross-compile toolkit for the Raspberry PI
- English instructions
    1. [Prerequisites](#Prerequisites)
    2. [Instructions to build Linux kernel (cross-compile)](#how-to-build-the-linux-kernel-using-this-tool-(en))
    3. [Instructions to install the Linux kernel](#how-to-install-this-kernel-(en))
    4. [Special thanks](#special-thanks-to)
- Japanese instructions
    1. [準備](#準備-(jp))
    2. [Linuxカーネルのビルド方法 (クロスコンパイル)](#このツールを使用したlinuxカーネルのビルド方法-(jp))
    3. [Linuxカーネルのインストール方法](#カーネルのインストール方法-(jp))
    4. [謝意](#謝意)

## Prerequisites
Please make sure you have the following tools installed
- make
- docker ([rootless](https://docs.docker.com/engine/security/rootless/) is better due to file ownership issues)

## How to build the Linux kernel using this tool (en)
- If you don't want to build the kernel, the precompiled binary are placed under `install`. \
It is built for 64-bit Raspberry Pi 4 with Linux version 5.15
1. Run `make build-image` to build the docker image to build Linux kernel.
    - EXPERIMENTAL: 32-bit arm cross-compile
        ``` bash
        make build-image-32
        ```
2. Run `make run`. This will grab the kernel from [raspberrypi/linux](https://github.com/raspberrypi/linux.git) \
and build the Linux kernel including the firmware.
    - After building the kernel, the built image are placed under `mount`
    - EXPERIMENTAL: 32-bit arm cross-compile
        ``` bash
        make run-32
        ```

## How to install this kernel (en)
__RUN THESE COMMANDS INSIDE OF A RASPBERRY PI__

1. Install the kernel image and the kernel headers
    ``` bash
    find install -type f -name "*.deb" | xargs sudo apt install
    ```
2. Update the `/boot` directory
    ``` bash
    sudo cp -rf mount/boot/* /boot
    ```
3. Update the `config.txt` and `cmdline.txt` files under `/boot`. \
Keep any existing settings nessesary.
    - In the raspberry pi, these files are placed under `/boot`

## Special thanks to
- alexdelprete for his [step by step detailed instructions](https://gist.github.com/alexdelprete/82b09f11153e3f8664a10294f1ab0b34) on how to \
cross-compile the Linux kernel for the Raspberry PI. \
This project was possible because of his work!

- - -
## 準備 (jp)
以下のソフトウェアが環境にインストールされていることを確認してください。
- make
- docker ([rootless](https://docs.docker.com/engine/security/rootless/)のほうがファイル所有権等の問題を回避できるためよい)

## このツールを使用したLinuxカーネルのビルド方法 (jp)
- Linuxカーネルをコンパイルしたくない場合、コンパイル済のバイナリは全て`install` \
ディレクトリ内に置かれる。 \
これらは64-bitのRaspberry PI 4用のLinux5.15となります。
1. `make build-image`を実行し、Linuxカーネルをビルドするためのdockerイメージを \
ビルドする。
    - EXPERIMENTAL: 32-bit armへのクロスコンパイル
        ``` bash
        make build-image-32
        ```
2. `make run`を実行し、dockerコンテナ内でLinuxカーネルをビルドする。 \
Linuxカーネルは[raspberrypi/linux](https://github.com/raspberrypi/linux.git)よりダウンロードしている。
    - ビルド完了後、パッケージ等はすべて`mount`ディレクトリ内に出力される
    - EXPERIMENTAL: 32-bit armへのクロスコンパイル
        ``` bash
        make run-32
        ```

## カーネルのインストール方法 (jp)
1. カーネル、カーネルヘッダのインストール
    ``` bash
    find mount -type f -name "*.deb" | xargs sudo apt install
    ```
2. `/boot`ディレクトリの更新 (ファームウェアの上書き)
    ``` bash
    sudo cp -rf mount/boot/* /boot
    ```
3. `config.txt`と`cmdline.txt`の差分を取り、更新する
    - ラズパイ側の両ファイルは`/boot`下にある

## 謝意
- alexdelprete
    - 彼の[Linuxカーネルのクロスコンパイル手順](https://gist.github.com/alexdelprete/82b09f11153e3f8664a10294f1ab0b34)によって本プロジェクトは可能となっています。
