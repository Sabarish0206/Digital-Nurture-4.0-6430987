import React from 'react';

const CourseDetails = ({ courses }) => {
  return (
    <div>
      <h2>Course Details</h2>
      <ul>
        {courses.map((course, index) => (
          <li key={course.id || index}>
            <strong>{course.name}</strong> - Duration: {course.duration}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CourseDetails;
