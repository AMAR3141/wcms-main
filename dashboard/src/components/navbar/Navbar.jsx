import "./navbar.scss";
import SearchOutlinedIcon from "@mui/icons-material/SearchOutlined";
import DarkModeOutlinedIcon from "@mui/icons-material/DarkModeOutlined";
import NotificationsNoneOutlinedIcon from "@mui/icons-material/NotificationsNoneOutlined";
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import { DarkModeContext } from "../../context/darkModeContext";
import { useContext, useEffect,useState } from "react";
import Cookies from "js-cookie";
import { json, useNavigate } from "react-router-dom";
import axios from "axios";
import CryptoJS from "crypto-js";

function checkLoggedIn(){
  const secretKey = 'Iy24NuD9J3fkchdpWyTaP4GKOxB1igp0';
  const storage_data=  sessionStorage.getItem('data');

  const data=CryptoJS.AES.decrypt(storage_data,secretKey);
  const decrypted_data=JSON.parse(data.toString(CryptoJS.enc.Utf8))

  console.log(decrypted_data)
    if(decrypted_data === undefined || decrypted_data===null){
        window.location.href = "/login";
    }else{
    }
}



const Navbar = () => {
  
  let navigate=useNavigate()
 useEffect(() => {
  
  checkLoggedIn()
    
 },[])

  
  const { dispatch } = useContext(DarkModeContext);


  return (
    <div className="navbar">
      <div className="wrapper">
        <div className="search">
          <input type="text" placeholder="Search..." />
          <SearchOutlinedIcon />
        </div>
        <div className="items">
          <div className="item">
            <DarkModeOutlinedIcon
              className="icon"
              onClick={() => dispatch({ type: "TOGGLE" })}
            />
          </div>
          <div className="item">
            <NotificationsNoneOutlinedIcon className="icon" />
            <div className="counter">99</div>
          </div>
          <div className="item">
            <AccountCircleIcon className="icon"/>
          </div>
          </div>
        </div>
      </div>
  );
};

export default Navbar;
