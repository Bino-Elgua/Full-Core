#!/bin/bash

echo "=== CHECKING WHICH SERVICES ARE ACTUALLY IMPORTED ==="
echo ""

# Get all .ts and .tsx files except node_modules
FILES=$(find . -type f \( -name "*.ts" -o -name "*.tsx" \) ! -path "./node_modules/*" ! -path "./.git/*")

declare -A SERVICE_IMPORTS

# Count imports for each service
for service in services/*.ts; do
    SERVICE_NAME=$(basename "$service")
    IMPORT_COUNT=$(echo "$FILES" | xargs grep -l "from.*$SERVICE_NAME\|import.*from.*services" 2>/dev/null | grep -v "$service" | wc -l)
    if [ "$IMPORT_COUNT" -gt 0 ]; then
        SERVICE_IMPORTS["$SERVICE_NAME"]=$IMPORT_COUNT
    fi
done

# Sort and display
echo "TOP 30 MOST IMPORTED SERVICES:"
for service in "${!SERVICE_IMPORTS[@]}"; do
    echo "${SERVICE_IMPORTS[$service]} $service"
done | sort -rn | head -30

echo ""
echo "POTENTIALLY UNUSED SERVICES (0 imports outside their file):"
for service in "${!SERVICE_IMPORTS[@]}"; do
    if [ "${SERVICE_IMPORTS[$service]}" -eq 0 ]; then
        echo "  - $service"
    fi
done | sort
