---
title: Business Process Management
description:
date: 2024-07-25
lastmod: 2024-09-06
---

# Business Process Management

Business process management (BPM) is a systemic approach for capturing, designing, executing, documenting, measuring, monitoring, and controlling both automated and non-automated processes to meet the objectives and business strategies of a company. BPM embraces the conscious, comprehensive, and increasingly technology-enabled definition, improvement, innovation, and maintenance of end-to-end processes. Through this systemic and conscious management of processes, companies achieve better results faster and more flexibly

Through BPM, processes can be aligned with the business strategy, and so help to improve company performance as a whole thanks to the optimization of processes within business divisions or even beyond company borders

## Business Process Management Notation (BPMN)

BPMN 2.0 is a notation standard for modelling and automating business processes

- Based on flowcharting
- Meant to unify the language used to describe business processes
- Maintained by Object Management Group (OMG)
- Published as an ISO standard ISO/IEC 19510:2013

Use of BPMN 2.0:

- Learn once, map and understand any process
- Complete clarity and insight into process for all stakeholders
- Intelligible between different workflow tools

BPMN is not suitable for representing:

- Process landscapes
- Organizational structures
- Data
- Strategies
- Business rules
- IT landscapes

### Structured vs. Un-Structured Workflows

BPMN focuses on business processes, but there is an important limitation

There are some processes that are poorly suited to modelling or automation in BPMN. These are the _un-structured processes_: processes that do not always take place in a predictable and repeatable way

An example of an unstructured process is that of a doctor coming upon the scene of an accident with injuries. She is unlikely to work through a BPMN diagram but instead will quickly plunge in, making decisions based on her knowledge and experience, of course, but also in reaction to the chaos of the scene

This is why the [Case Management Model and Notation (CMMN)](#case-management-model-and-notation) standard was invented alongside BPMN

### Understanding Process

- **[Process Model](#process-model)**: The basic description of a process. A diagram may describe one or more process models. A process model is a graphical representation of a business process. It defines the sequence of activities, decisions, and events that occur in a process

- **Process instance**: A process carried out in reality. A process instance is a concrete execution of a process model. It's created when a process is initiated and represents a specific occurrence of the process

  - One single customer complaint is an instance of the complaint process, for example. Some processes may be instantiated only a few times in a year, such as end-of-quarter reporting in the accounting department
  - Other instances occur more often. Think of the millions of credit-report requests in a year's time

- **Token**: A token is a concept used to represent the flow of control through a process instance. You can apply the token model, if you have a process model in mind and want to find out which process paths must or may be used during a process instance

  - A token is a concept we compare to a car: A car follows a road. At an intersection, its driver must decide to continue in a straight path or to turn left or right. Or perhaps the car turns and a clone of the car continues straight on
  - This is where the car metaphor breaks down, but we hope you get the gist: that the road system corresponds to a process model and that any particular route the car takes represents an instance

- **Correlation**: It is is a mechanism for linking multiple process instances together based on shared data or business keys

  - Do you ever get letters with a transaction key or a file number? When you reply, you are expected to reference the key or number to make it easier for your correspondent to allocate your communication properly. This allocation based on an unambiguous key is called correlation.
  - Another example is when you pay a bill, and you are asked to write the invoice number on your check. If you don't comply, your payment may not be properly allocated, and the lack of correlation can lead to reminder notices, late-payment fees, and other unpleasantness
  - Correlation is often crucial to the success of processes, from both organizational and technical points of view. Some of the costliest mistakes come from carelessness with the issue of appropriate correlation

### Process Model

- **Process owner**: They have _strategic responsibilities_ for their processes

  - In most companies, process owners inhabit the first or second tier of management (members of management committees or heads of major divisions)

- **Process manager**: They have _operational responsibility_ for their processes

  - They report directly or indirectly to the process owners
  - Process managers are often low- or middle-level managers

- **Process participant**: They work with the processes and actually create value

- **Process analyst**: The core competencies of process analysts are BPM in general and BPMN in particular

- **Process engineer**: They use technology to implement the target state process modelled by process analysts

### Camunda BPMN framework

1. Strategic process model:

   - Content: Process overview
   - Goal: Fast comprehension
   - Semantics: Logically abstract
   - Target: process owners and process managers
   - We sketch the process in a few steps, but we **don't show errors or variations**

2. Operational process model:

   - Content: Operational processes
   - Goal: Coordinate details between human process flow and technical process flow (automation)
   - Semantics: Physically specific
   - Investigate operational details of the actual process

### Basic elements of BPMN

In general, certain tasks have to be carried out during a process (_activities_), perhaps under certain conditions (_gateways_), and things may happen (_events_). What connects these three flow objects are _sequence flows_, but only within a _pool_. If connections cross pool boundaries, the process resorts to _message flows_

Furthermore, _artifacts_ provide additional information on the process, but these cannot influence the order of flow objects directly. Every artifact can connect to every flow object through _associations_

BPMN contains an additional _data_ category. This refers to the creation, processing, and filing of information that may become relevant within the scope of process handling

The basic elements of BPMN:

| Flow objects | Connecting objects | Artifacts        | Participants | Data        |
| ------------ | ------------------ | ---------------- | ------------ | ----------- |
| Activity     | Sequence flow      | Annotation       | Pool         | Data object |
| Event        | Message flow       | Group            | Lane         | Data input  |
| Gateway      | Association        | Custom artifacts |              | Data store  |
|              |                    |                  |              | Data output |

### Symbols and Attributes

1. Tasks: Represent work that needs to be done within a process

   - Types:

     - _User Task_: Requires human intervention to complete
     - _Service Task_: Invokes a service or system to perform the task
     - _Script Task_: Executes a script to perform the task
     - _Receive Task_: Waits for a message to arrive
     - _Send Task_: Sends a message

   - Tasks are the heart of the process. Ultimately, something has to happen to bring about a desired outcome
   - A task technically is part of the activities category, which also includes the subprocess

   - Visualization: A **rounded rectangle**

   > When naming tasks, we try to adhere to the object-oriented design principle of using the "verb" + "object" pattern. We would say acquire groceries, for example, not first take care of shopping for groceries

2. Events: Describe **significant things that happen before, during, or at the end of a process**

   - Represent occurrences that can affect the flow of a process

   - Types:

     - **Start Events**: Initiate a process (show which event causes the process to start)

       - Are **Catching events**
       - That means something happened independent of the process, but the process has to wait for this event, or react to it

     - **Intermediate Events**: stand for a status that is reached in the process and that is modelled explicitly

       - Occur during a process and can be catching (wait for a trigger) or throwing (send a signal)
       - For example, if you regard reaching a certain status as a milestone and you want to measure the time until the milestone is reached

     - **End Events**: mark the status reached at the end of the process path

       - Terminate a process
       - **Only the process can trigger them**

   - _None Events_: can be used in a process flow to indicate a status or a milestone

     - They are also referred to as "blank" events. Essentially, they represent events without a specified trigger.

   - Visualization: A **circle with different icons** to represent different event types

   > Events refer to something that has already happened regardless of the process (if they are catching events) and as a result of the process (if they are throwing events). For this reason, we use the "object" and make the "verb" passive in voice, so we write _hunger noticed_. BPMN does not require you to model start and end events for a process —you can leave them out —but if you model a start event, you must model an end event for each path. The same is true for end events that require start events. We always create our models with start and end events for two reasons: first, that way it's possible to determine the process trigger, and second, you can describe the final status of each path end. We only sometimes abandon this practice with subprocesses

3. Sequence flows: Connect activities and events in a process, indicating the order in which they occur

   - Describes the time-logic sequence of the flow elements: tasks, events, and the gateways
   - The process path taken by our token is also a sequence flow

   - Visualization: A **solid line with an arrowhead**

4. Gateways: are decision points in a BPMN process that control the flow of execution. The point of decision on what to do next is called a _gateway_

   - They determine how sequence flows converge and diverge within a process
   - Gateways are **represented as diamonds** in a BPMN diagram. The type of gateway is indicated by additional symbols within the diamond

   Types of Gateways:

   - Exclusive Gateway (_XOR_): Represents an exclusive choice between multiple paths

     - Only one outgoing sequence flow can be taken based on a condition

     - We always work with XOR gateways as follows:

       1. Model the task that requires a decision for the XOR gateway
       2. Model the XOR gateway after that. Create a question with mutually exclusive answers
       3. Model one outgoing path (or sequence flow) for each possible answer, and label the path with the answer

     - Visualization: Diamond with no symbol within or Diamond with a `X` symbol

   - Parallel Gateway (_AND_): Creates parallel execution paths

     - Routes the request down all possible pathways
     - No condition
     - Need to close loop with diverging and converging parallel gateways

     - Visualization: Diamond with a `+` symbol

   - Event-based Gateway:

     - They wait to see which event occurs first before routing the path down a flow
     - Race gateway

   - Inclusive Gateway

> We always draw our process diagrams horizontally, from left to right, but there is nothing to keep you from orienting your flow differently. You may orient your diagrams vertically instead of horizontally, for example, although that is unusual

## Decision Model and Notation (DMN)

DMN is the newest of the three standards

A _decision_ in the DMN sense means deriving a result (output) from given facts (input) on the basis of defined logic (decision logic)

## Case Management Model and Notation (CMMN)
