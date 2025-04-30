# Task 10: Blue/Green Deployment for Strapi on AWS ECS with CodeDeploy

This project demonstrates a fully automated Blue/Green deployment pipeline for a Strapi application using **Amazon ECS (Fargate)**, **CodeDeploy**, **ALB**, and **GitHub Actions**. The infrastructure is provisioned using **Terraform**, and deployments are orchestrated via CI/CD.

---

## ✅ Features

- **Blue/Green Deployment** using CodeDeploy
- Canary Strategy: `CodeDeployDefault.ECSCanary10Percent5Minutes`
- Automatic rollback on deployment failure
- Zero downtime deployment with ALB traffic shifting
- Docker image build & push to Amazon ECR
- Dynamic ECS Task Definition registration
- Trigger CodeDeploy via GitHub Actions
- Infrastructure as Code using Terraform
- Conditional `terraform apply` (only when ECS cluster doesn't exist)

---

## 📁 Folder Structure


---

## 🚀 Deployment Workflow (CI/CD)

### 1. On every push to `main`:
- GitHub Actions builds the Docker image
- Tags it with commit SHA and pushes to ECR

### 2. Terraform Steps:
- Checks if ECS cluster exists
- If not, runs `terraform apply` to provision infrastructure

### 3. ECS & CodeDeploy:
- Registers a new ECS task definition with updated image
- Creates a new deployment via AWS CodeDeploy
- ALB automatically shifts traffic from Blue to Green after health checks

---

## 🛡️ Security & Network Setup

- ALB Security Group allows ports **80 (HTTP)** and **443 (HTTPS)**
- Two Target Groups created: **Blue** and **Green**
- ALB Listener configured to switch traffic between Blue/Green based on deployment state

---

## 🔄 Deployment Strategy

- **Strategy:** `CodeDeployDefault.ECSCanary10Percent5Minutes`
- **Rollback:** Enabled on failure
- **Old tasks:** Terminated automatically on success

---

## 🧪 Verification Checklist

- ✅ New deployments are routed through the Green target group
- ✅ No downtime during deployment
- ✅ On failure, traffic is automatically routed back to Blue

---

## 🔧 Environment Variables

Set the following GitHub Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

## 📌 Notes

- Make sure the `task-definition.json` and `appspec.json` files use placeholders like `<IMAGE_URI>` and `<TASK_DEFINITION_ARN>` for dynamic substitution.
- Certificate ARN must be set if using HTTPS in production.

---

## 🙋‍♂️ Maintainer

**Karthik** – DevOps Aspirant
