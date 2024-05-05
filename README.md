# Job-Portal-Smart-Contract.

Contract Definition:

This is the main contract named JobPortal.
1.	It defines two structs: Applicant and Job, which represent the structure of an applicant and a job, respectively.

2.	It declares public state variables applicantCount and jobCount to keep track of the total number of applicants and jobs.

Event Declaration:

1.	NewApplicant: This event is emitted when a new applicant is added to the system.
2.	NewJob: This event is emitted when a new job is added to the system
3.	addApplicant:This function allows adding a new applicant to the system.It takes four parameters: _name, _laborHistory, _skills, and _availability, which represent the applicant's name, labor history, skills, and availability, respectively. It increments applicantCount and creates a new Applicant struct with the provided details. It emits a NewApplicant event.
4.	getApplicant: This function allows fetching details of a specific applicant by their ID. It takes one parameter _id, which represents the ID of the applicant. It returns the details of the applicant identified by the given ID.
5.	addJob: This function allows adding a new job to the system. It takes three parameters: _title, _description, and _salary, which represent the title, description, and salary of the job, respectively. It increments jobCount and creates a new Job struct with the provided details. It emits a NewJob event.
6.	getJob: This function allows fetching details of a specific job by its ID. It takes one parameter _id, which represents the ID of the job. It returns the details of the job identified by the given ID.
7.	applyForJob: This function allows an applicant to apply for a job. It takes one parameter _jobId, which represents the ID of the job the applicant wants to apply for. It checks if the job is available (not filled) and marks it as filled if the conditions are met.
8.	provideRating: This function allows providing a rating to an applicant. It takes two parameters: _applicantId and _rating, which represent the ID of the applicant and the rating to be provided, respectively. It checks if the rating is valid (between 0 and 5) and updates the applicant's rating accordingly.
9.	getApplicantRating: This function allows fetching the rating of a specific applicant by their ID. It takes one parameter _applicantId, which represents the ID of the applicant. It returns the rating of the applicant identified by the given ID.
These functions collectively provide the core functionality of the job portal Dapp, allowing users to add applicants, add jobs, apply for jobs, provide ratings to applicants, and fetch applicant details and ratings.

