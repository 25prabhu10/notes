---
title: Telemetry
description: Telemetry is the process of collecting and transmitting data from a remote source to a central or local source
---

# Telemetry

Telemetry is the process of collecting and transmitting data from a remote source to a central or local source. This data can be used for monitoring, alerting, and analysis. Telemetry is used in many different fields, including aerospace, automotive, and healthcare

Telemetry vs. [Logging](./Logging.md):

| Feature    | Telemetry                                   | Logging                                  |
| ---------- | ------------------------------------------- | ---------------------------------------- |
| Purpose    | Monitoring                                  | Event Record                             |
| Focus      | Quantitative                                | Qualitative                              |
| Data Types | Numerical values, time-series data, metrics | Text, structured data, unstructured data |
| Frequency  | Real-time or triggered                      | Varies based on logging level            |
| Use Cases  | Performance monitoring, alerting, analysis  | Debugging, troubleshooting, auditing     |
| Tools      | Prometheus, Grafana, Jaeger, Zipkin         | ELK Stack, Splunk, Graylog               |
| Designed   | For machines                                | For humans                               |

## Observability

Observability is the ability to understand the internal state of a system based on its external outputs. It is a measure of how well you can understand what is happening inside a system based on the data that is available to you. Observability is important because it allows you to quickly identify and resolve issues that may arise in your system

Observability is achieved through the use of telemetry data. By collecting and analysing telemetry data, you can gain insights into the performance and behaviour of your system. This data can help you identify bottlenecks, troubleshoot issues, and optimize your system for better performance

> Observability is about understanding and debugging unknown-unknowns; **the ability to understand any inner system state** just by asking questions from outside the system
>
> Charity Majors, Observability Pioneer, Co-founder of Honeycomb.io

Asking questions:

- What was the impact of my change?
- Is the code being used?
- Is the feature being used?
- Has the time for any action changed?
- How are those third parties doing?
- How is cross-region latency going?

Why is telemetry needed?

- Ship more often
- Produce better code
- Spend less time fixing and more time creating value
- Decrease downtime
- There's way more to know
- We're afraid we'll break things
- We've forgotten what we've built by the time it ships
- We can't figure out what's wrong and fix it

| Observability    | Monitoring     |
| ---------------- | -------------- |
| Unknown unknowns | Known unknowns |
| Debugging        | Alerting       |
| Understanding    | Reporting      |
| Questions        | Answers        |
| Exploratory      | Confirmatory   |
| Ad-hoc           | Scheduled      |
| Real-time        | Historical     |
| Proactive        | Reactive       |

## OpenTelemetry

OpenTelemetry is an open-source observability framework that provides a standard set of APIs, SDKs, and collectors to instrument applications, microservices, and cloud-native platforms. It enables developers to capture and export telemetry data, such as metrics, logs, and traces, to a variety of backend analytics systems

- It is a CNCF project
- It is a merger of OpenTracing and OpenCensus, two popular observability projects
- It is a protocol for telemetry data
- Vendor-neutral
- Standardized instrumentation
- Flexible and extensible
- SDKs for multiple languages

- **Instrumentation Libraries**: SDKs for various programming languages that provide APIs for instrumenting applications
- **Collectors**: Agents that collect telemetry data from instrumented applications and forward it to backend systems
- **Exporters**: Components that export telemetry data to backend systems, such as Prometheus, Jaeger, and Zipkin
- **Processors**: Components that transform, filter, and enrich telemetry data before exporting it to backend systems
- **Context Propagation**: Mechanisms for propagating context across service boundaries to correlate telemetry data

### Current Signals

Signals are the types of telemetry data that OpenTelemetry captures. The three main signals are traces, metrics, and logs. Each signal provides a different perspective on the performance and behaviour of a system

- **Traces** (Stable): Captures the flow of requests through a distributed system
- **Metrics** (Stable): Captures quantitative data about the performance and behaviour of a system
- **Logs** (Only Protocol is stable): Captures structured and unstructured data for debugging and troubleshooting

#### Trace

Traces are used to capture the flow of requests through a distributed system. A trace is a collection of spans that represent the lifecycle of a request as it travels through different services. Each span contains metadata about the request, such as the start time, end time, and duration

- The "thing" that is being done
- Not something we create
- A trace is a collection of spans

> Logs are fancy traces

##### Span

A span represents a single operation within a trace. It contains metadata about the operation, such as the start time, end time, duration, and tags. Spans are linked together to form a trace, which represents the flow of a request through a distributed system

- Structured Blob of data that also has:
  - Unique ID (span ID)
  - Correlation ID (trace ID)
  - Duration (start time, end time)
  - Timestamps
  - Causality ID (parent span ID)

## Auto-Instrumentation

Auto-instrumentation is the process of automatically instrumenting an application to capture telemetry data without requiring manual code changes. It is a key feature of observability frameworks like OpenTelemetry, which provide SDKs and agents that can automatically instrument applications

- Codeless instrumentation
- Environment variable configuration
- Sideloaded
- Getting started quickly
- Verbose

### Get Started with OpenTelemetry Auto-Instrumentation DotNet

PowerShell module (Windows):

```powershell
# Download the module
$module_url = "https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/download/v1.8.0/OpenTelemetry.DotNet.Auto.psm1"
$download_path = Join-Path $env:temp "OpenTelemetry.DotNet.Auto.psm1"
Invoke-WebRequest -Uri $module_url -OutFile $download_path -UseBasicParsing

# Import the module to use its functions
Import-Module $download_path

# Install core files (online vs offline method)
Install-OpenTelemetryCore
Install-OpenTelemetryCore -LocalPath "C:\Path\To\OpenTelemetry.zip"

# Set up the instrumentation for the current PowerShell session
Register-OpenTelemetryForCurrentSession -OTelServiceName "MyServiceDisplayName"

# Run your application with instrumentation
.\MyNetApp.exe
```

Shell scripts:

```bash
# Download the bash script
curl -sSfL https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/download/v1.8.0/otel-dotnet-auto-install.sh -O

# Install core files
sh ./otel-dotnet-auto-install.sh

# Enable execution for the instrumentation script
chmod +x $HOME/.otel-dotnet-auto/instrument.sh

# Setup the instrumentation for the current shell session
. $HOME/.otel-dotnet-auto/instrument.sh

# Run your application with instrumentation
OTEL_SERVICE_NAME=myapp OTEL_RESOURCE_ATTRIBUTES=deployment.environment=staging,service.version=1.0.0 ./MyNetApp
```
