import React, { useState } from 'react';
import { Button, TextField } from '@material-ui/core';
import "./LoginPage.css"
import logo from "./logo2.png"
import { useQuery } from 'react-query';
import axios from 'axios';
import { useNavigate } from "react-router-dom";
import Cookies from 'js-cookie';
import CryptoJS from 'crypto-js';


function LoginPage() {
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    username: '',
    password: ''
  });
  const [msg, setMsg] = useState('');

  // const { data, isLoading,refetch } = useQuery('Authenticate', () => {
  //   return axios.post('http://127.0.0.1:8000/api/users/Auth/', formData,{withCredentials:true})
  // })

  const handleSubmit = async (event) => {
    event.preventDefault();

    // const { data ,isError,isLoading,error} = await refetch();
    const data = await axios.post('http://127.0.0.1:8000/api/users/Auth/', formData, { withCredentials: true })


    if (data && data.data.jwt) {
      Cookies.set('jwt', data.data.jwt);

      const response = await axios.get('http://127.0.0.1:8000/api/users/getInfo/', { withCredentials: true }).then((res) => res.data)
      

      const secretKey = 'Iy24NuD9J3fkchdpWyTaP4GKOxB1igp0'
      const session_data = { key: data.data.jwt, id: response.id, first_name: response.first_name, last_name: response.last_name, username: response.username, email: response.email };

      // Encrypt the data
      const ciphertext = CryptoJS.AES.encrypt(JSON.stringify(session_data), secretKey).toString();


      sessionStorage.setItem('data', ciphertext);

      window.location.href = "/";


    }
    if (data.status === 401) {
      setMsg(data.data.detail)
    }

  }

  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData(prevState => ({ ...prevState, [name]: value }));
  }

  return (
    <div className="container">
      <img src={logo} alt="Logo" style={{ width: "300px", height: "auto" }} />
      <h3>LOGIN </h3>
      <div className="form-wrapper">
        <form onSubmit={handleSubmit}>
          <TextField
            label="Username"
            type="text"
            name="username"
            variant='outlined'
            margin="normal"
            autoComplete="off"
            fullWidth
            value={formData.username}
            onChange={handleChange} required />

          <TextField
            label="Password"
            type="password"
            name="password"
            variant='outlined'
            margin="normal"
            autoComplete="off"
            fullWidth
            value={formData.password}
            onChange={handleChange} required />

          {/* {
            isLoading && <div>
              Loading...
            </div>
          }  */}
          {msg && <div style={{ color: 'red', marginBottom: "10px", fontsize: "1.2rem" }}>{msg}</div>}
          <div style={{ marginTop: "1rem" }}>
            <Button
              type="submit"
              variant="contained"
              color="primary"
            >
              Login
            </Button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default LoginPage;
