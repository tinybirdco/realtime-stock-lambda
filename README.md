# Real-time Stock Analysis with Tinybird: Lambda Architecture Example

This repository demonstrates how to build a simple real-time stock analysis pipeline using Tinybird, implementing the Lambda Architecture pattern.

## Overview

This example showcases how to combine pre-aggregated snapshots with real-time data to provide both historical depth and up-to-the-minute accuracy for stock level analysis. We use Tinybird's powerful data processing capabilities to:

* Ingest real-time stock transaction data.
* Generate pre-aggregated daily stock level snapshots.
* Query both real-time data and snapshots for comprehensive stock analysis.

## Architecture

The architecture follows the Lambda pattern, consisting of:

* **Speed Layer (Real-time):** Processes incoming stock transaction events in real-time, allowing for immediate insights.
* **Batch Layer (Snapshots):** Generates daily snapshots of stock levels, providing efficient historical analysis.
* **Serving Layer:** Allows querying both real-time data and snapshots through Tinybird's API endpoints.

## Getting Started

1.  **Clone the repository:**

    ```bash
    git clone [https://github.com/tinybirdco/realtime-stock-lambda.git](https://www.google.com/search?q=https://github.com/tinybirdco/realtime-stock-lambda.git)
    cd realtime-stock-lambda
    ```

2.  **Set up Tinybird:**

    * Create a Tinybird account (if you don't have one).
    * Create a new Workspace.
    * Import the provided data source schemas and Pipes into your Tinybird Workspace.

## Data Sources

* `stock_changes`: Stores real-time stock transaction events.
* `stock_events_snapshots`: Stores real-time stock changes with an asigned snapshot_id.
* `stock_snapshots_raw`: Stores raw snapshots generated every 5 minutes.
* `stock_snapshots_agg_daily`: Stores daily pre-aggregated stock level snapshots.

## Materializations

* `stock_events_snapshot_mv`: Processes incoming stock transactions assigning an snapshot_id.
* `daily_snapshots_agg`: Generates daily stock aggregated snapshots.

## Copy

* `raw_snapshots_copy`: Copy pipe used to generate raw snapshots every 5 minutes.

## Endpoint

* `stock_evolution`: provides a stock evolution filtering location, dynamically selecting the appropriate Data Source based on the requested time range.
