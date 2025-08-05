import React, { useState } from 'react';

const ComplaintRegister = () => {
  const [employeeName, setEmployeeName] = useState('');
  const [complaint, setComplaint] = useState('');

  const generateReferenceNumber = () => {
    return 'REF' + Math.floor(Math.random() * 1000000);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const refNo = generateReferenceNumber();

    alert(`Complaint Registered!\nReference No: ${refNo}\nName: ${employeeName}\nComplaint: ${complaint}`);

    setEmployeeName('');
    setComplaint('');
  };

  return (
    <div>
      <h2>Raise a Complaint</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Employee Name:</label><br />
          <input
            type="text"
            value={employeeName}
            onChange={(e) => setEmployeeName(e.target.value)}
            required
          />
        </div>
        <br />
        <div>
          <label>Complaint:</label><br />
          <textarea
            rows="4"
            value={complaint}
            onChange={(e) => setComplaint(e.target.value)}
            required
          ></textarea>
        </div>
        <br />
        <button type="submit">Submit Complaint</button>
      </form>
    </div>
  );
};

export default ComplaintRegister;
