#!/bin/bash

echo "🚀 Phase 2: Deploying AI Error Analysis"
echo "========================================"

# Check for API key
if [ -z "$GEMINI_API_KEY" ]; then
    echo "❌ Error: GEMINI_API_KEY not set"
    echo "Run: export GEMINI_API_KEY='your-key'"
    exit 1
fi

# Variables
PROJECT_ID="pipeline-guardian"
REGION="us-central1"

echo "✓ API key found"
echo "✓ Project: $PROJECT_ID"
echo "✓ Region: $REGION"

# Deploy Cloud Function
echo ""
echo "Deploying Cloud Function..."

cd cloud-function

gcloud functions deploy analyze-error \
  --runtime python311 \
  --trigger-topic pipeline-logs \
  --entry-point analyze_error \
  --set-env-vars GEMINI_API_KEY=$GEMINI_API_KEY \
  --region $REGION \
  --memory 256MB \
  --timeout 60s

cd ..

echo ""
echo "✅ Phase 2 Deployment Complete!"
