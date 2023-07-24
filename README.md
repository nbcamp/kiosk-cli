#  Kiosk CLI

## Development

Clone this repository and run program to develop

```sh
$ swift run
```

## Build

 Check build path by adding `--show-bin-path` option.

**Debug**

```sh
$ swift build # --show-bin-path
```

**Release**

```sh
$ swift build -c release # --show-bin-path
```

**Release by architectures**

```sh
$ swift build -c release --arch arm64 --arch x86_64 # --show-bin-path
```
