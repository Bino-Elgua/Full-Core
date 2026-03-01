#!/bin/bash

echo "=== DUPLICATE SERVICE ANALYSIS ==="
echo ""

# Check for services with similar names
echo "POTENTIAL DUPLICATES (similar names):"
echo ""

# Extract-related
echo "DNA Extraction:"
ls -lh services/*extraction* services/*dna* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Gemini-related
echo "Gemini Services:"
ls -lh services/gemini* 2>/dev/null | awk '{print $9, $5}'
echo ""

# API-related
echo "API Layer Services:"
ls -lh services/api* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Security-related
echo "Security Services:"
ls -lh services/*security* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Firebase-related
echo "Firebase Services:"
ls -lh services/firebase* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Settings-related
echo "Settings Services:"
ls -lh services/settings* 2>/dev/null | awk '{print $9, $5}'
echo ""

# LLM-related
echo "LLM Services:"
ls -lh services/*llm* services/*provider* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Scraping-related
echo "Scraping Services:"
ls -lh services/*scrap* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Pricing-related
echo "Pricing Services:"
ls -lh services/pricing* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Credit-related
echo "Credit Services:"
ls -lh services/*credit* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Realtime/Collaboration
echo "Collaboration/Realtime:"
ls -lh services/*realtime* services/*collaboration* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Video-related
echo "Video Services:"
ls -lh services/video* 2>/dev/null | awk '{print $9, $5}'
echo ""

# Performance-related
echo "Performance Services:"
ls -lh services/performance* 2>/dev/null | awk '{print $9, $5}'
echo ""

