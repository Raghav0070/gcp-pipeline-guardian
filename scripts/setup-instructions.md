# Setup Instructions

## Prerequisites
- GCP account with billing enabled
- `gcloud` CLI installed and configured
- Project ID: `pipeline-guardian` (or your choice)

## Step-by-Step Setup

```bash
gcloud services enable \
  bigquery.googleapis.com \
  pubsub.googleapis.com \
  logging.googleapis.com \
  --project=pipeline-guardian
```

- Create tables
- Create scheduled query (see Phase 1 documentation) and schedule it for every 10 min

# Create topic
gcloud pubsub topics create pipeline-logs

# Create subscription with BigQuery delivery
# (Must be done via Console - see documentation)

# Create Log Sink
# Go to Logging → Log Router
# Create sink with filter:
```
resource.type="bigquery_resource"
resource.labels.project_id="pipeline-guardian"
protoPayload.methodName="jobservice.insert"
```


## Should see new rows every 10 minutes.
