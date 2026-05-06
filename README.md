#  Ruby AI JS QA — AI-Powered Question Answering Platform

 **Live Demo:** [https://manibalasinha.github.io/Ruby_AI_JS_QA/](https://manibalasinha.github.io/Ruby_AI_JS_QA/)
 **Repo:** [https://github.com/ManibalaSinha/Ruby_AI_JS_QA](https://github.com/ManibalaSinha/Ruby_AI_JS_QA)

---

##  Overview

**Ruby_AI_JS_QA** is a **production-style full-stack AI platform** designed to handle intelligent question-answering workflows at scale.

It combines:

* **Ruby on Rails (Backend API layer)**
* **JavaScript (Frontend UI)**
* **AI model integrations (LLM APIs)**

The system is built with a focus on:

* Clean service architecture
* Extensibility for multiple AI providers
* Backend-driven orchestration of AI workflows

---

##  System Design Highlights (Senior-Level Focus)

### 1. Backend-Centric AI Orchestration

* Rails acts as a **central orchestration layer**
* Handles:

  * Prompt construction
  * API routing to AI providers
  * Response normalization
* Designed to easily plug in providers like:

  * OpenAI
  * Anthropic

### 2. Modular Service Architecture

* AI logic isolated into **service objects**
* Clear separation of:

  * Controllers (HTTP layer)
  * Services (business logic)
  * Models (data layer)
* Enables:

  * Easy testing
  * Swap/extend AI providers
  * Maintainable scaling

### 3. Full-Stack Interaction Flow

```
Frontend (JS UI)
   ↓
Rails API (Request validation + orchestration)
   ↓
AI Service Layer (Prompt + API calls)
   ↓
Response Processing
   ↓
Frontend Rendering
```

### 4. Extensibility

* Supports:

  * Multi-model routing
  * Custom prompt pipelines
  * Domain-specific QA workflows

---

##  Key Features

###  AI-Powered Question Answering

* Context-aware responses using LLM APIs
* Designed for **accuracy + extensibility**

###  Customizable QA Workflows

* Modify prompt structure
* Add preprocessing/postprocessing layers
* Adapt to use cases like:

  * Knowledge assistants
  * Developer tools
  * Internal enterprise bots

###  Full-Stack Experience

* Clean UI for submitting queries
* Real-time interaction with backend APIs

---

##  Tech Stack

**Backend**

* Ruby 3.x
* Rails 6.x
* REST API design
* Service Object Pattern

**Frontend**

* JavaScript (SPA-style UI)
* API-driven rendering

**AI Layer**

* OpenAI / Anthropic APIs
* Prompt engineering layer

---

##  Getting Started

###  Prerequisites

* Ruby 3+
* Rails 6+
* Node.js + npm
* AI API key (OpenAI / Anthropic)

---

###  Backend Setup

```bash
git clone https://github.com/ManibalaSinha/Ruby_AI_JS_QA.git
cd Ruby_AI_JS_QA

bundle install
rails db:create db:migrate
```

Configure API keys:

```ruby
# config/initializers/ai_service.rb
ENV['OPENAI_API_KEY'] = 'your_key'
```

Start server:

```bash
rails server
```

---

###  Frontend Setup

```bash
cd frontend
npm install
npm start
```

---

###  Run the App

Open:

```
http://localhost:3000
```

---

##  Scalability & Future Improvements

This project is structured to evolve into a **production-grade AI system**:

*  Added **Redis caching for responses**
*  Introduced **background jobs (Sidekiq)**
*  Streaming responses (WebSockets / SSE)
*  Multi-tenant support
*  Rate limiting & API quotas
*  Observability (logs, metrics)

---

##  Engineering Quality

* Clean separation of concerns
* Backend-first design
* Service-oriented architecture
* API-driven development

---

##  Contributing

PRs are welcome!

```bash
git checkout -b feature/your-feature
git commit -m "Add feature"
git push origin feature/your-feature
```

---

##  License

MIT License

---

##  Why This Project Matters

This project demonstrates:

* Strong **backend system design thinking**
* Experience integrating **AI into real applications**
* Ability to build **scalable, extensible APIs**
* Understanding of **modern full-stack architecture**
