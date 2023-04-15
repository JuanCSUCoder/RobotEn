# RobotEn

![Logo](./logo.svg)

RobotEn or Robot Environment is a set of ROS DevContainer Templates, that aim to simplify and unify robotics development across Linux Distributions.

## How To

### Install DevContainer CLI

```bash
sudo npm install -g @devcontainers/cli
```

### Run Local Workspace

```bash
devcontainer up --workspace-folder .
```

## Distributions

### ROS2 Humble

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/humble
```

### ROS Noetic

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/noetic
```

