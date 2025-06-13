# eks-automode-pipeline
For Multi-tier web app-CI/CD-EKS automode
# Argo CD Configuration

This folder contains configuration files for deploying and managing Argo CD and its applications in the `eks-automode-pipeline` project.

---

## 📁 File Structure

| File Name              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `argocd-values.yaml`   | Helm values file used to install Argo CD components with taint/toleration settings. |
| `ecommerce-app.yaml`   | Argo CD `Application` manifest to deploy the `ecommerce-app` Helm chart.    |

---

## 🚀 Deploying Argo CD

To install Argo CD with a tainted node pool configuration using Helm:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm install argocd argo/argo-cd \
  --namespace argocd \
  --create-namespace \
  -f argocd-values.yaml

# Application Charts

This folder contains Helm charts for deploying individual applications via Argo CD in the `eks-automode-pipeline` project.

---

## 📁 Folder Structure


---

## 📦 `ecommerce-app/`

This is a Helm chart that defines Kubernetes resources for deploying the `ecommerce-app` microservice.

### Includes:
- **Deployment**: Defines the pod spec and replica count.
- **Service**: Exposes the app internally or externally.
- **Ingress**: Optional support for NGINX or ALB ingress.
- **Configurable values** in `values.yaml`:
  - `image.repository`, `tag`
  - `replicaCount`
  - `serviceAccount.create`
  - `tolerations`, `nodeSelector`, `affinity`

---

## 🛠️ How to Deploy (via Argo CD)

1. Ensure `ecommerce-app.yaml` exists under `argocd/` folder as an Argo CD `Application` manifest.
2. Push changes to GitHub.
3. Argo CD will auto-sync and deploy based on:
   ```yaml
   path: apps/ecommerce-app
   repoURL: https://github.com/<your-username>/eks-automode-pipeline.git
