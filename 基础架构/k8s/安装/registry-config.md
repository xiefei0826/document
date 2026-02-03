# Containerd 镜像仓库配置说明

由于 containerd v1.5+ 版本弃用了直接在 `config.toml` 中配置 `mirrors` 的方式，需要使用 `config_path` 来配置镜像仓库。

## 配置步骤

1. **创建配置目录**：
   ```bash
   sudo mkdir -p /etc/containerd/certs.d
   ```

2. **为每个镜像仓库创建独立的配置文件**：

   **docker.io** (`/etc/containerd/certs.d/docker.io/hosts.toml`):
   ```toml
   server = "https://docker.io"

   [host."https://docker.m.daocloud.io"]
     capabilities = ["pull", "resolve"]
   ```

   **registry.k8s.io** (`/etc/containerd/certs.d/registry.k8s.io/hosts.toml`):
   ```toml
   server = "https://registry.k8s.io"

   [host."https://k8s.m.daocloud.io"]
     capabilities = ["pull", "resolve"]
   ```

   **gcr.io** (`/etc/containerd/certs.d/gcr.io/hosts.toml`):
   ```toml
   server = "https://gcr.io"

   [host."https://gcr.m.daocloud.io"]
     capabilities = ["pull", "resolve"]
   ```

   **quay.io** (`/etc/containerd/certs.d/quay.io/hosts.toml`):
   ```toml
   server = "https://quay.io"

   [host."https://quay.m.daocloud.io"]
     capabilities = ["pull", "resolve"]
   ```

   **其他仓库**（类似配置）

3. **重启 containerd**：
   ```bash
   sudo systemctl restart containerd
   ```

## 当前配置状态

- `config.toml` 已更新为使用新的 `config_path` 方式
- 镜像仓库映射关系已从 `config.toml` 中移除
- 需要手动创建 `/etc/containerd/certs.d/` 目录下的配置文件

## 镜像仓库映射关系

以下是需要配置的镜像仓库映射：

- docker.elastic.co → elastic.m.daocloud.io
- docker.io → docker.m.daocloud.io
- dhi.io → dhi.m.daocloud.io
- gcr.io → gcr.m.daocloud.io
- ghcr.io → ghcr.m.daocloud.io
- k8s.gcr.io → k8s-gcr.m.daocloud.io
- registry.k8s.io → k8s.m.daocloud.io
- mcr.microsoft.com → mcr.m.daocloud.io
- nvcr.io → nvcr.m.daocloud.io
- quay.io → quay.m.daocloud.io
- registry.ollama.ai → ollama.m.daocloud.io