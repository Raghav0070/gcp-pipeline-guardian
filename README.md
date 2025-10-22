# 🛡️ The GCP Pipeline Guardian

> AI-powered real-time monitoring and error analysis system for Google Cloud Platform data pipelines using Cloud Logging, Pub/Sub, BigQuery, Cloud Functions, and Gemini AI

[![Phase](https://img.shields.io/badge/Phase2-%20Complete-green)]()
[![GCP](https://img.shields.io/badge/GCP-BigQuery%20|%20Pub/Sub%20|%20Cloud%20Functions-blue)]()
[![AI](https://img.shields.io/badge/AI-Gemini%202.0%20Flash-orange)]()
[![Cost](https://img.shields.io/badge/Cost-~₹2/error-success)]()

---

## 📋 Overview

Pipeline Guardian is an intelligent monitoring system that captures, analyzes, and optimizes GCP data pipeline errors in real-time using AI. Built to demonstrate production-grade data engineering practices with advanced AI integration.

### Current Status: Phase 2 ✅
- ✅ **Phase 1**: Real-time log aggregation pipeline
- ✅ **Phase 2**: AI-powered error analysis (COMPLETE)
- ⏳ **Phase 3**: Predictive anomaly detection
- ⏳ **Phase 4**: Cost optimization recommendations
- ⏳ **Phase 5**: Real-time dashboard

---

## 🏗️ Architecture

### Phase 1: Foundation
![Phase 1 Architecture](docs/The-GCP-Pipeline-guardian-Phase1-Architecture.pdf)

**Data Flow:**
1. BigQuery scheduled queries run every 10 minutes
2. Cloud Logging captures audit logs
3. Log Router filters `bigquery_resource` events
4. Pub/Sub streams filtered logs
5. BigQuery stores logs for analysis


---

### Phase 2: AI Error Analysis (Current)
![Phase 2 Architecture](images/phase-2-architecture.png)

**Enhanced Data Flow:**
BigQuery Error ↓ Cloud Logging (Custom Filter) ├─→ Pub/Sub → BigQuery (raw logs) └─→ Pub/Sub → Cloud Function → Gemini AI → BigQuery (AI analysis) ⚡ <5 seconds





**Key Components:**
- **Cloud Function**: `analyze-error` (Python 3.11, serverless)
- **Gemini AI**: 2.0 Flash model for cost optimization
- **Auto-scaled**: PUSH subscription architecture
- **Dual Storage**: Raw logs + AI insights

**Latency:** ~5 seconds from error to AI analysis

---

## 🎯 Key Features

### Phase 1 (Complete) ✅
- ✅ Real-time log ingestion (sub-second latency)
- ✅ JSON schema flexibility
- ✅ Production patterns (DLQ, retry logic)
- ✅ $0/month on free tier

### Phase 2 (Complete) ✅
- ✅ **Real-time error detection** - Captures manual + scheduled query errors
- ✅ **AI root cause analysis** - Gemini provides instant diagnosis
- ✅ **Automated insights** - Fix suggestions + prevention tips
- ✅ **Event-driven** - Serverless Cloud Functions (zero maintenance)
- ✅ **Cost optimized** - Flash model (90% cheaper than Pro)
- ✅ **Production-grade** - Comprehensive error handling

**Example AI Analysis:**
Error: "Not found: Table pipeline-guardian:dataset.table_name"  

AI Analysis:  
 ✓ Root Cause: Table doesn't exist in specified dataset  
 ✓ Fix: Verify table name with INFORMATION_SCHEMA.TABLES  
 ✓ Prevention: Add existence checks before queries
 
 
---

## 🛠️ Tech Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| Data Warehouse | BigQuery | Pipeline execution & log storage |
| Messaging | Pub/Sub | Real-time event streaming |
| Logging | Cloud Logging | Audit log capture with custom filters |
| **Compute** | **Cloud Functions** | **Serverless error analysis (Phase 2)** |
| **AI** | **Gemini 2.0 Flash** | **Root cause analysis (Phase 2)** |
| Orchestration | Cloud Scheduler | Scheduled query automation |
| Region | us-central1 | Cost & latency optimization |

---

📊 Results & Impact
Before Pipeline Guardian
❌ Manual error investigation: 30+ minutes
❌ Context lost in logs
❌ Repeated mistakes
❌ No pattern detection

After Pipeline Guardian
✅ Automated analysis: <5 seconds
✅ AI-powered root cause identification
✅ Actionable fix suggestions
✅ Prevention guidance included
✅ Complete audit trail

🎓 Technical Highlights
Phase 1 Learnings
GCP service integration patterns
Real-time data pipeline architecture
Cost optimization strategies  
  
Phase 2 Learnings (The Hard Parts!)
Reverse engineering: No docs for Cloud Logging filter syntax
Event-driven design: Pub/Sub PUSH vs PULL architecture
Nested JSON parsing: 6 levels deep error extraction
AI integration: Production-grade Gemini API usage
Cost optimization: Flash vs Pro model (10-20x savings)
Debugging strategies: Local testing workflows
Auto-configuration: How Cloud Functions auto-create resources
  
🤝 Contributing
This is a personal portfolio project, but feedback is welcome! Open an issue if you spot bugs or have suggestions.

👤 Author
RAGHAVESHWAR
GCP Data Engineer | AI Integration Specialist

LinkedIn: www.linkedin.com/in/raghaveshwar/
Portfolio: Building production-grade AI solutions on GCP

Built to demonstrate:

Advanced GCP architecture patterns
AI/ML integration best practices
Production engineering mindset

📅 Timeline
Phase 1 completed: 14/10/2025
Phase 2 completed: 18/01/2025 🎉


⭐ Star This Repo
If you find this project useful or impressive, please star it!

Especially valuable if you're:

Learning GCP data engineering
Integrating AI into data pipelines
Building event-driven architectures
Preparing for Google Cloud certifications

  
Built with ☁️ on GCP + 🤖 Gemini AI
