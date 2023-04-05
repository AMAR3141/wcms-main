import "./navbar.scss";
import SearchOutlinedIcon from "@mui/icons-material/SearchOutlined";
import NotificationsNoneOutlinedIcon from "@mui/icons-material/NotificationsNoneOutlined";
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
const Navbar = () => {

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
