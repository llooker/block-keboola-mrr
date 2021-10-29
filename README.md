# Subscription Revenue Essentials by Keboola

## Keboola Blocks Intro (Scaffold Prerequisite)
Looker Blocks powered by Keboola are designed to work in tandem with corresponding Keboola Scaffolds in the Keboola Connection platform. Similar to Blocks in nature, Keboola Scaffolds are templatized use-cases that can be instantly deployed into the Keboola platform, providing the whole data management and processing chain required to populate the Looker dashboards.

## Block Overview
This Block connects to data from Keboola “Recurring Revenue” Scaffold into Looker. Its purpose is to provide quick out-of-the-box end to end integration and functionality to be used either stand-alone or to be combined with other data. In order to set up the Keboola data feed, please contact us: [here](https://get.keboola.com/lookerblocks?block=mrr).

## Data and Block Structure
This block is built above processed data gathered from your contract/order/subscription platform, so it’s possible to use Keboola Scaffold or project to transform your data to necessary output. Block is composed from these objects (views):

*  Company
*  Contract
*  Contract Line
*  Employee
*  MRR
*  MRR Aggregated (aggregated values per companies)
*  Product

The **Keboola Scaffold** will set up everything for you - from data extraction to data transformation, to setting up the Snowflake database with necessary tables for the LookML. All you need to do is set up the connection to the database in Looker and add it to the Looker model.

In case you want to enrich your Looker model and dashboards with other fields or objects in your model or modify the process to ingest contracts from different data sources, you can modify the whole data extraction and processing directly in Keboola Connection.
