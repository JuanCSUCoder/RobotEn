# RobotEn

![Logo](./logo.svg)

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/JuanCSUCoder/RobotEn/release.yaml?style=for-the-badge)
![GitHub repo size](https://img.shields.io/github/repo-size/JuanCSUCoder/RobotEn?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/JuanCSUCoder/RobotEn?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/JuanCSUCoder/RobotEn?label=Latest&style=for-the-badge)

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

### ROS2 Iron Irwini

#### No GPU

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/iron_nogpu
```

### ROS2 Humble

#### No GPU

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/humble_nogpu
```

#### AMD GPU

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/humble_amd
```

#### Nvidia GPU

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/humble_nvidia
```

### ROS Noetic

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/noetic
```

### ROS Indigo

```bash
devcontainer templates apply -t ghcr.io/JuanCSUCoder/RobotEn/indigo
```
