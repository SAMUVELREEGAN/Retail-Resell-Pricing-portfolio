 import  { useEffect, useRef, useState } from 'react';
import './Craft.css';
import axios from 'axios';
import { useMyContext } from '../context/MyContext';

const Craft = () => {
  const {CraftUrl} = useMyContext();
  const craftRef = useRef(null);
  const [startCount, setStartCount] = useState(false);

  const [years, setYears] = useState(0);
  const [clients, setClients] = useState(0);
  const [projects, setProjects] = useState(0);

  const [targetData, setTargetData] = useState({ year: 0, client: 0, projects: 0 });

  // Fetch data from API
  useEffect(() => {
    axios.get(CraftUrl)
      .then(response => {
        const data = response.data[0]; 
        setTargetData({
          year: data.year,
          client: data.client,
          projects: data.projects
        });
      })
      .catch(error => {
        console.error("Error fetching craft data:", error);
      });
  }, [CraftUrl]);

  // Animate counters based on target values
  useEffect(() => {
    if (startCount) {
      const duration = 2000;
      const interval = 20;

      let currentYears = 0;
      let currentClients = 0;
      let currentProjects = 0;

      const totalSteps = duration / interval;

      const stepYears = targetData.year / totalSteps;
      const stepClients = targetData.client / totalSteps;
      const stepProjects = targetData.projects / totalSteps;

      const counter = setInterval(() => {
        currentYears += stepYears;
        currentClients += stepClients;
        currentProjects += stepProjects;

        setYears(Math.ceil(currentYears));
        setClients(Math.ceil(currentClients));
        setProjects(Math.ceil(currentProjects));

        if (
          currentYears >= targetData.year &&
          currentClients >= targetData.client &&
          currentProjects >= targetData.projects
        ) {
          clearInterval(counter);
        }
      }, interval);
    }
  }, [startCount, targetData]);

  // Start animation when component is in view
  useEffect(() => {
    const observer = new IntersectionObserver(
      entries => {
        if (entries[0].isIntersecting) {
          setStartCount(true);
          observer.disconnect();
        }
      },
      { threshold: 0.4 }
    );

    if (craftRef.current) observer.observe(craftRef.current);

    return () => observer.disconnect();
  }, []);

  return (
    <div className='container my-5' ref={craftRef}>
      <div className='row'>
        <div className='col-lg-6 col-md-6 col-sm-12'>
          <div className='container'>
            <div className='row'>
              <div className='col-lg-10 col-md-8 col-sm-12 mt-3 crafted'>
                <h2>Crafted by talented and high quality material</h2>
              </div>
            </div>
          </div>
        </div>
        <div className='col-lg-6 col-md-6 col-sm-12'>
          <div className='container'>
            <div className='row'>
              <div className='col-lg-4 col-md-4 col-sm-12 mt-3 project text-center'>
                <h3>{years}+</h3>
                <p>Years Experience</p>
              </div>
              <div className='col-lg-4 col-md-4 col-sm-12 mt-3 project text-center'>
                <h3>{clients}+</h3>
                <p>Happy Client</p>
              </div>
              <div className='col-lg-4 col-md-4 col-sm-12 mt-3 project text-center'>
                <h3>{projects}+</h3>
                <p>Project Finished</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Craft;
