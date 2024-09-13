# satellite-earth/personal-node for StartOS

[personal-node](https://github.com/satellite-earth/packages/tree/master/apps/personal-node) is a personal Nostr relay. This repository creates the s9pk package that is installed to run personal-node on StartOS.

## Dependencies

Install the system dependencies below to build this project by following the instructions in the provided links. You can also find detailed steps to setup your environment in the service packaging [documentation](https://github.com/Start9Labs/service-pipeline#development-environment).

- [docker](https://docs.docker.com/get-docker)
- [docker-buildx](https://docs.docker.com/buildx/working-with-buildx/)
- [yq](https://mikefarah.gitbook.io/yq)
- [deno](https://deno.land/)
- [make](https://www.gnu.org/software/make/)
- [start-sdk](https://github.com/Start9Labs/start-os/tree/master/backend)

## Cloning

Clone the personal-node-startos package repository locally.

```
git clone https://github.com/satellite-earth/personal-node-startos.git
cd personal-node-startos
```

## Building

To build the `satellite-personal-node` package for all platforms using start-sdk, run the following command:

```
make
```

To build the `satellite-personal-node` package for a single platform using start-sdk, run:

```
# for amd64
make x86
```
or
```
# for arm64
make arm
```

## Installing (on StartOS)

Run the following commands to determine successful install:
> :information_source: Change server-name.local to your Start9 server address

```
start-cli auth login
# Enter your StartOS password
start-cli --host https://server-name.local package install satellite-personal-node.s9pk
```

If you already have your `start-cli` config file setup with a default `host`, you can install simply by running:

```
make install
```

> **Tip:** You can also install the satellite-personal-node.s9pk using **Sideload Service** under the **System > Manage** section.

### Verify Install

Go to your StartOS Services page, select **Satellite Personal Node**, configure and start the service. Then, verify its interfaces are accessible.

**Done!**
