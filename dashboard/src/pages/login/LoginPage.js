import React, { useState } from 'react';
import { Button, TextField } from '@material-ui/core';
import "./LoginPage.css"
import logo from "./logo2.png"

function LoginPage() {
  const [formData, setFormData] = useState({
    username: '',
    password: ''
  });
  const [error, setError] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    if (formData.username === 'alex' && formData.password === '99') {
      // Redirect user to dashboard
      console.log('User logged in successfully!');
    } else {
      setError('Invalid username or password');
    }
  }

  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData(prevState => ({ ...prevState, [name]: value }));
  }

  return (
    <div className="container">
        <img src={logo} alt="Logo" style={{ width: "300px", height: "auto" }}/>
      <h3>LOGIN </h3>
      <div className="form-wrapper">
      <form onSubmit={handleSubmit}>
        <TextField 
        label="Username" 
        type="text" 
        name="username" 
        variant ='outlined'
        margin="normal"
        autoComplete="off"
        fullWidth
        value={formData.username} 
        onChange={handleChange} />
        
        <TextField 
        label="Password" 
        type="password" 
        name="password"
        variant ='outlined' 
        margin="normal"
        autoComplete="off"
        fullWidth
        value={formData.password} 
        onChange={handleChange} />
        
        {error && <div style={{ color: 'red', marginBottom: "10px", fontsize: "1.2rem"}}>{error}</div>}
        <div style={{ marginTop: "1rem" }}><Button 
        type="submit" 
        variant="contained" 
        color="primary"
        >Login
        </Button>
        </div>
      </form>
      </div>
    </div>
  );
}

export default LoginPage;
