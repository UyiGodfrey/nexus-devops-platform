# Evidence and Reproducibility Guide

This guide explains what reviewers can verify in the [Nexus DevOps Platform](../README.md), and what should not be mistaken for a live production deployment.

## Verified project artifacts

| Area | Where to inspect | What it demonstrates |
|---|---|---|
| API | `app/` | Express routes including health and info endpoints |
| Automated tests | `app/` test files and scripts | Local test coverage; rerun with `npm test` |
| Container | `Dockerfile`, `docker-compose.yml` | Reproducible local image and service setup |
| GitHub Actions | `.github/workflows/ci.yml` | CI definitions for dependency installation, tests and image build |
| Kubernetes | `kubernetes/` | Deployment and Service manifests with probes and limits |
| Helm | `helm/nexus-api/` | Parametrized Kubernetes manifests |
| GitOps | `gitops/nexus-application.yaml` | Argo CD Application configuration example |
| Terraform | `terraform/main.tf` | AWS ECR repository configuration |
| Ansible | `ansible/setup-nexus.yml` | Example host setup automation |
| Monitoring | `monitoring/` | Prometheus, Loki and Alloy configuration examples |

## Quick local verification

Prerequisites: Docker with Compose.

```bash
docker compose up --build
```

In a separate terminal:

```bash
curl http://localhost:3000/
curl http://localhost:3000/health
curl http://localhost:3000/api/info
```

Stop the containers using `docker compose down`.

You can also run the application tests:

```bash
cd app
npm ci
npm test
```

## Interpreting evidence correctly

- **Code/configuration present:** file exists in this repository. This alone does not prove an environment was provisioned.
- **Local reproduction:** a reviewer can run documented steps and record their own results.
- **CI evidence:** inspect [GitHub Actions runs](https://github.com/UyiGodfrey/nexus-devops-platform/actions) for the results of specific workflow executions.
- **Cloud / Kubernetes deployment:** not claimed here unless deployment evidence is added separately.

## Next improvements

- Add screenshots or sanitized terminal transcripts of completed end-to-end local runs.
- Add more explicit test cases around failure handling.
- Exercise the Kubernetes and Helm configuration in a documented local cluster.
- Record the status of optional AWS resources without including credentials or unexpected cloud charges.

[← Back to project](../README.md) · [Portfolio index](../PORTFOLIO.md)
