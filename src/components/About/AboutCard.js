import React from "react";
import Card from "react-bootstrap/Card";
import { ImPointRight } from "react-icons/im";

function AboutCard() {
  return (
    <Card className="quote-card-view">
      <Card.Body>
        <blockquote className="blockquote mb-0">
          <p style={{ textAlign: "justify" }}>
            Hi Everyone, I am <span className="purple">Mahesh Kaldhone </span>
            from <span className="purple"> Pune, India.</span>
            <br /> 
            As a cloud-savvy DevOps engineer, I orchestrate seamless integration of cutting-edge tools,
            empowering teams to thrive in the realm of agile development and cloud-native solutions

            <br />
            Additionally, I am currently employed as a Jr. DevOps Engineer at
            SpryIQ technologies.
            <br />
            <br />
            Apart from coding, some other activities that I love to do!
          </p>
          <ul>
            <li className="about-activity">
              <ImPointRight /> Tech
            </li>
            <li className="about-activity">
              <ImPointRight /> Movies
            </li>
        
          </ul>

          <p style={{ color: "rgb(155 126 172)" }}>
            "“The most powerful tool we have as developers is automation.”!"{" "}
          </p>
          <footer className="blockquote-footer">Unknown DevOps Wizard</footer>
        </blockquote>
      </Card.Body>
    </Card>
  );
}

export default AboutCard;
