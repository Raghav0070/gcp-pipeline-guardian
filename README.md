# 🛡️ The GCP Pipeline Guardian

> AI-powered real-time monitoring and optimization system for Google Cloud Platform data pipelines using Cloud Logging, Pub/Sub, BigQuery, and Vertex AI

[![Phase](https://img.shields.io/badge/Phase-1%20Complete-green)]()
[![GCP](https://img.shields.io/badge/GCP-BigQuery%20|%20Pub/Sub%20|%20Logging-blue)]()
[![Cost](https://img.shields.io/badge/Cost-$0/month-success)]()

---

## 📋 Overview

Pipeline Guardian is an intelligent monitoring system that captures, analyzes, and optimizes GCP data pipeline performance in real-time. Built to demonstrate production-grade data engineering practices with AI integration.

### Current Status: Phase 1 ✅
- ✅ Real-time log aggregation pipeline
- ✅ BigQuery scheduled query monitoring
- ✅ Pub/Sub → BigQuery native integration
- ⏳ AI root cause analysis (Phase 2)
- ⏳ Predictive anomaly detection (Phase 3)
- ⏳ Cost optimization recommendations (Phase 4)
- ⏳ Real-time dashboard (Phase 5)

---

## 🏗️ Architecture (Phase 1)

![Architecture Diagram](docs/The-GCP-Pipeline-guardian-Phase1-Architecture.pdf)

### Data Flow
1. **BigQuery Scheduled Query** runs every 10 minutes (simulated pipeline)
2. **Cloud Logging** captures audit logs
3. **Log Router** filters for `bigquery_resource` events
4. **Pub/Sub Topic** streams filtered logs
5. **Pub/Sub Subscription** writes directly to BigQuery (native integration)
6. **BigQuery Table** stores logs as JSON for flexible querying

**Latency:** <1 second end-to-end

---

## 🎯 Key Features

### Phase 1 (Complete)
- **Real-time ingestion**: Sub-second latency from log generation to storage
- **Flexible schema**: JSON storage allows for schema evolution
- **Cost**: $0/month using GCP free tier
- **Production patterns**: Dead letter queues, retry logic, regional deployment

### Upcoming Phases
- **Phase 2**: Gemini AI integration for root cause analysis
- **Phase 3**: BigQuery ML anomaly detection
- **Phase 4**: AI-driven cost optimization
- **Phase 5**: Streamlit dashboard on Cloud Run

---

## 🛠️ Tech Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| Data Warehouse | BigQuery | Pipeline execution & log storage |
| Messaging | Pub/Sub | Real-time log streaming |
| Logging | Cloud Logging | Audit log capture |
| Orchestration | Cloud Scheduler | Scheduled query automation |
| Region | us-central1 | Cost optimization |

---
🤝 Contributing  
This is a personal portfolio project, but feedback is welcome! Open an issue if you spot bugs or have suggestions.  
  
👤 Author  
RAGHAVESHWAR  
  
LinkedIn: www.linkedin.com/in/raghaveshwar/  
Built as a demonstration of GCP data engineering + AI integration skills.  


Phase 1 completed: 14/10/2025   
⭐ Star this repo if you find it useful!  
