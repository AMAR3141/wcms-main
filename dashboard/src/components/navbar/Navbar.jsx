import "./navbar.scss";
import SearchOutlinedIcon from "@mui/icons-material/SearchOutlined";
import NotificationsNoneOutlinedIcon from "@mui/icons-material/NotificationsNoneOutlined";
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
<<<<<<< HEAD
import { DarkModeContext } from "../../context/darkModeContext";
import { useContext } from "react";
import Cookies from "js-cookie";
import { useNavigate } from "react-router-dom";

function CheckLogin(){
  const navigate=useNavigate()
  const loggedIn=Cookies.get('jwt')

  if(!loggedIn){
    return navigate('/login')
  }
  
}

const Navbar = () => {
  CheckLogin()
  const { dispatch } = useContext(DarkModeContext);
  



=======
const Navbar = () => {
>>>>>>> 3efe420e1081a52f4950775a878f9d3ef2377d63

  return (
    <div className="navbar">
      <div className="wrapper">
        <div className="search">
          <input type="text" placeholder="Search..." />
          <SearchOutlinedIcon />
        </div>
        <div className="items">
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
