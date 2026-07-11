# ClinicalTrialEnrollment-SalesforceAgent Multi-model

Clinical Research Agent - Salesforce Agentforce AI

## Overview

The Clinical Research Agent is an AI-powered healthcare solution built on Salesforce Agentforce. It helps patients, healthcare providers, and research teams quickly access clinical trial information, determine eligibility, and answer research-related questions using trusted enterprise data.

Instead of manually searching through research documents, trial records, and knowledge articles, users can interact with an intelligent AI agent that understands context and provides accurate responses.

## Business Problem

Clinical trial information is often scattered across:

- Research documents
- Knowledge articles
- Clinical trial databases
- Internal business systems

Patients and healthcare professionals spend significant time searching for information such as:

- Available clinical studies
- Trial eligibility requirements
- Enrollment status
- Research protocols
- Company-specific studies

This project demonstrates how Salesforce Agentforce can be used to automate these interactions using AI and enterprise data.

## Solution

The solution uses multiple AI agents working together.

### Front-End Agent

Responsible for:

- Conversing with patients
- Understanding questions
- Collecting patient information
- Providing real-time responses

### Back-End Agent

Responsible for:

- Research analysis
- Eligibility evaluation
- Clinical trial matching
- Executing backend actions
- Retrieving information from Salesforce

This multi-agent architecture allows complex healthcare workflows to be handled efficiently.

## Key Features

### Clinical Trial Search

Users can ask:

> "Are there any clinical trials available for lung cancer patients?"

The agent searches enterprise data and returns relevant studies.

### Eligibility Assessment

The agent can evaluate:

- Age requirements
- Medical conditions
- Enrollment criteria
- Trial restrictions

and determine whether a patient may qualify.

### AI-Powered Question Answering

Supports questions about:

- Clinical studies
- Research programs
- Enrollment process
- Trial requirements
- Study timelines

### Context-Aware Conversations

Before responding, the agent receives:

- Patient details
- Account information
- Relevant business context

using Agentforce Context Variables.

### Intelligent Actions

The agent can trigger:

- Apex actions
- Salesforce Flows
- External APIs
- Backend processes

without requiring manual user intervention.

## Technologies Used

**Salesforce**

- Agentforce
- Einstein AI
- Prompt Builder
- Apex
- Flow
- Lightning Experience
- Knowledge Articles

**AI & Data**

- Data Cloud
- Retrieval-Augmented Generation (RAG)
- Agentforce Data Library
- Context Variables

**Integration**

- Apex Callouts
- REST APIs

## Architecture

```
Patient
   │
   ▼
Front-End Agent
   │
   ▼
Agentforce Data Library
   │
   ├── Knowledge Articles
   ├── Clinical Trial Records
   ├── Research Documents
   └── Data Cloud
   │
   ▼
Back-End Agent
   │
   ├── Apex Actions
   ├── Flows
   ├── API Integrations
   └── Eligibility Analysis
   │
   ▼
Response Returned to User
```

## Example Use Cases

### Trial Eligibility Check

Patient asks:

> "Am I eligible for a Phase 3 diabetes study?"

Agent:

- Reviews eligibility criteria
- Evaluates patient profile
- Returns qualification guidance

### Clinical Research Questions

Patient asks:

> "What are the side effects being studied in this trial?"

Agent retrieves information from approved enterprise sources and provides a response.

### Enrollment Support

Patient asks:

> "How can I enroll in this study?"

Agent explains the enrollment process and next steps.

## Skills Demonstrated

- Salesforce Agentforce Development
- AI Agent Design
- Multi-Agent Architecture
- Healthcare Domain Solutions
- Retrieval-Augmented Generation (RAG)
- Apex Development
- Salesforce Flow Automation
- Prompt Engineering
- Data Cloud Integration
- API Integration

## Project Outcome

This project demonstrates how Salesforce Agentforce can be used to build enterprise-grade AI solutions for healthcare and clinical research by combining AI agents, Data Cloud, RAG, Prompt Builder, Apex, and Flow automation, Slack Integration.

Screenshot from the Implementation:
<img width="1025" height="613" alt="Screenshot 2026-06-05 at 11 12 35 AM" src="https://github.com/user-attachments/assets/d943b468-acd3-410d-b995-a4b23ce26f38" />
<img width="1597" height="832" alt="Screenshot 2026-06-05 at 11 13 03 AM" src="https://github.com/user-attachments/assets/3ac33529-ea6e-4551-9625-b762580e038f" />
<img width="410" height="534" alt="Screenshot 2026-06-05 at 11 13 22 AM" src="https://github.com/user-attachments/assets/23eb261b-f666-4ec4-b26d-aa5a92b4bb13" />
<img width="302" height="440" alt="Screenshot 2026-06-05 at 11 18 56 AM" src="https://github.com/user-attachments/assets/0f21ceb8-74ac-4b42-ab29-25d5e183c8ef" />
<img width="392" height="556" alt="Screenshot 2026-06-05 at 11 20 35 AM" src="https://github.com/user-attachments/assets/a65a1753-f794-4d59-823e-3da79d41a13e" />
<img width="390" height="509" alt="Screenshot 2026-06-05 at 11 20 50 AM" src="https://github.com/user-attachments/assets/ac51e8fe-04b9-4498-98e5-c25f892dfa61" />
<img width="384" height="510" alt="Screenshot 2026-06-05 at 11 21 10 AM" src="https://github.com/user-attachments/assets/17e96389-2dce-49fa-9cf7-10936151dbdd" />
<img width="402" height="540" alt="Screenshot 2026-06-05 at 11 21 23 AM" src="https://github.com/user-attachments/assets/1b260f7b-e0fa-49fe-ad19-91cf6d940e1b" />
<img width="1486" height="291" alt="Screenshot 2026-06-05 at 11 21 55 AM" src="https://github.com/user-attachments/assets/9af984d7-f6e3-4dfe-a74f-890c934de42d" />
<img width="1214" height="479" alt="Screenshot 2026-06-05 at 11 22 03 AM" src="https://github.com/user-attachments/assets/40bd53e0-86d4-46bd-8b89-74349d63ffbc" />
<img width="1073" height="367" alt="Screenshot 2026-06-05 at 11 22 11 AM" src="https://github.com/user-attachments/assets/bdb4fd0f-2ffc-4a02-9885-e358f939d7e2" />
<img width="1438" height="786" alt="Screenshot 2026-06-05 at 11 42 36 AM" src="https://github.com/user-attachments/assets/f8602590-725d-4c44-a219-b79a6e2a1c4d" />




















