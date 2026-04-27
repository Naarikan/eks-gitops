# EKS GitOps Notes

This repository is my practice workspace for learning GitOps on AWS EKS with Terraform, Helm, and Argo CD.

## What I built

- Provisioned VPC and EKS infrastructure with Terraform
- Created a minimal Helm chart for a frontend service
- Added an Argo CD `Application` manifest to deploy from Git

## What I tested

- End-to-end deployment flow from Git to EKS
- Change-based updates by editing Helm values and pushing commits
- Argo CD sync behavior in a simple learning setup

## Project layout

- `terraform/`: infrastructure definitions
- `charts/frontend/`: Helm chart files
- `argocd/frontend-app.yaml`: Argo CD application definition

## Why this repo exists

I created this repository as a focused hands-on exercise to understand how Helm and Argo CD work together in a GitOps workflow.
