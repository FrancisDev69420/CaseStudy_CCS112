# CaseStudy_CCS112
Assessment Activity: Understanding the  Scrum Model of Agile and Git for Code  Collaboration


CCS12 PRELIM CASE STUDY

Overview:

- Design and develop a SOAP system
- Follow Scrum practices for iterative development
- Use Git for version control to collaborate efficiently

SOAP SYSTEM

Web-based application enabling medical professionals to:
- Subjective: Record patient-reported symptoms and medical history.
 • Input Fields for:
    • Patient-reported symptoms
    • Medical History
    • Capability to save 

- Objective: Document measurable data from physical exams or diagnostic tests.
 • Input Fields for:
    • Vital Signs
    • Physical Examination
    • File upload for report documents (Optional)

- Assessment: Analyze data to form a diagnosis.
 • Diagnosis Input:
    • A text field where medical professionals can summarize their clinical analysis.
 • Automated Summary (Optional):
    • A feature to pull relevant information from Subjective and Objective sections to aid in diagnosis.

- Plan: Create treatment plans, including medications, therapies, and follow-up schedules.
 • Treatment Plan Entry:
    • Fields for medications, therapies, and procedures.
    • Follow-up instructions (e.g., "Return in two weeks").
 • Appointment Scheduling:
    • A simple calendar or scheduler to set follow-up visits.
 • Download/Print Functionality (Optional):
    • Generate a summary of the plan for patients.


System Features

1. Login Page
	Purpose: Authenticate healthcare professionals.
	Design:
	- A simple login form with fields for username and password.
	- Professional clinic logo and branding.

2. Dashboard 
	Purpose: Provide a summary view for healthcare providers.
	Design:
	- Recent Patient Records: List of the last 5 patients seen with links to  their 	 profiles.
	- Quick Access Buttons:
	  - Add New Patient Record
	  - Search Patient

3. Patient List Page
	Purpose: Display all patients with a search and filter feature.
	Design:
	 - A table showing:
	   - Patient Name
	   - Age
	   - Last Visit Date
	   - Action Buttons: View | Edit | Delete

4. Patient Page (Individual)
	Purpose: Display detailed patient information with access to SOAP sections.
	Design:
	Tabs or sections for:
	  - Subjective
          - Objective
          - Assessment
          - Plan
         Summary card showing:
          - Name, Age, Contact Information
          - Last Visit Date
          - Patient ID
          - Button to edit 	

5. SOAP Entry Form

	Subjective Section:
		Fields:
		Symptoms (textarea input): [__________________________]
		Medical History (textarea input): [__________________________]

	Objective Section:
		Fields:
		Vital Signs:
		Blood Pressure: [______]
		Heart Rate: [______]
		Physical Exam Notes (textarea input): [________________________]
		File Upload: [Choose File] [Upload]

	Assessment Section:
		Fields:
		Diagnosis Summary (textarea): [__________________________]

	Plan Section:
		Fields:
		Treatment Plan (textarea): [__________________________]
		Follow-Up Instructions (textarea): [__________________________]
		Appointment Scheduling:
		Calendar Input: [Select Date & Time]
		Button: [Save]




Workflow 

Step 1: The healthcare provider logs in and selects a patient.
Step 2: They fill out the Subjective and Objective sections.
Step 3: Based on the inputs, they document a diagnosis in the Assessment section.
Step 4: The provider creates a treatment plan in the Plan section and schedules follow-ups.
Step 5: All data is saved to the database and can be reviewed in future visits.


Roles based on SCRUM

1. Scrum Master - parang leader (REYES)
2. Product Owner - Responsible for creating the product backlog (SAGAN, KHEN)
3. Development Team - The developers/responsible for delivering product (RIOVEROS, STA ANA)


Deliverables 

Teams must provide:

1. A working SOAP system hosted on a server or demo link.
2. A Git repository link with a detailed commit history.
3. Documentation, including the backlog, sprint plans, and retrospectives.
4. A presentation summarizing their work, challenges, and lessons.









