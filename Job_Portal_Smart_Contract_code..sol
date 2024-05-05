// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JobPortal
{
    struct Applicant 
    {
        uint id;
        string name;
        string laborHistory;
        string skills;
        string availability;
        uint rating;
    }
    
    struct Job
    {
        uint id;
        string title;
        string description;
        uint salary;
        address provider;
        bool filled;
    }
    
    mapping(uint => Applicant) applicants;
    mapping(uint => Job) jobs;
    
    uint public applicantCount;
    uint public jobCount;
    
    event NewApplicant(uint id, string name);
    event NewJob(uint id, string title);
    
    function addApplicant(string memory _name, string memory _laborHistory, string memory _skills, string memory _availability) public {
        applicantCount++;
        applicants[applicantCount] = Applicant(applicantCount, _name, _laborHistory, _skills, _availability, 0);
        emit NewApplicant(applicantCount, _name);
    }
    
    function getApplicant(uint _id) public view returns(uint, string memory, string memory, string memory, string memory, uint) {
        return (applicants[_id].id, applicants[_id].name, applicants[_id].laborHistory, applicants[_id].skills, applicants[_id].availability, applicants[_id].rating);
    }
    
    function addJob(string memory _title, string memory _description, uint _salary) public {
        jobCount++;
        jobs[jobCount] = Job(jobCount, _title, _description, _salary, msg.sender, false);
        emit NewJob(jobCount, _title);
    }
    
    function getJob(uint _id) public view returns(uint, string memory, string memory, uint, address, bool) {
        return (jobs[_id].id, jobs[_id].title, jobs[_id].description, jobs[_id].salary, jobs[_id].provider, jobs[_id].filled);
    }
    
    function applyForJob(uint _jobId) public {
        require(applicantCount > 0, "No applicants available");
        require(jobs[_jobId].filled == false, "Job already filled");
        jobs[_jobId].filled = true;
    }
    
    function provideRating(uint _applicantId, uint _rating) public {
        require(_rating >= 0 && _rating <= 5, "Rating must be between 0 and 5");
        applicants[_applicantId].rating = _rating;
    }
    
    function getApplicantRating(uint _applicantId) public view returns(uint) {
        return applicants[_applicantId].rating;
    }
}
