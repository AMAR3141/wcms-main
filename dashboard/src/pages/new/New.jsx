import "./new.scss";
import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import DriveFolderUploadOutlinedIcon from "@mui/icons-material/DriveFolderUploadOutlined";
import { useState } from "react";

const New = ({ inputs, title }) => {
  const [file, setFile] = useState("");
  const [Username, setUsername] = useState("");
  const [Name, setName] = useState("");
  const [Surname, setSurname] = useState("");
  const [Email, setEmail] = useState("");
  const [Phone, setPhone] = useState("");
  const [Address, setAddress] = useState("");
  const [Password, setPassword] = useState("");
  
  const clearForm =()=>{
    setUsername('')
    setName('')
    setSurname('')
    setEmail('')
    setPhone('')
    setAddress('')
    setPassword('')
  }
  function handleSubmit(e) {
    e.preventDefault();
    
    console.log(Username,Name,Surname,Email,Phone,Address,Password,'okk')

    clearForm()
    console.log(('form Cleared'));
  }
  return (
    <div className="new">
      <Sidebar />
      <div className="newContainer">
        <Navbar />
        <div className="top">
          <h1>{title}</h1>
        </div>
        <div className="bottom">
          <div className="left">
            <img
              src={
                file
                  ? URL.createObjectURL(file)
                  : "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg"
              }
              alt=""
            />
          </div>
          <div className="right">
            <form type="POST" onSubmit={handleSubmit}>
              <div className="formInput">
                <label htmlFor="file">
                  Image: <DriveFolderUploadOutlinedIcon className="icon" />
                </label>
                <input
                  type="file"
                  id="file"
                  onChange={(e) => setFile(e.target.files[0])}
                  style={{ display: "none" }}
                />
              </div>
              <div className="formInput">
                  <label>Username</label>
                  <input type="text" id="username" onChange={(e)=>setUsername(e.target.value)} value={Username} placeholder="john_doe" />
                </div>
              <div className="formInput">
                  <label>Name</label>
                  <input type="text" id="name" onChange={(e)=>setName(e.target.value)} value={Name} placeholder="john" />
              </div>
              <div className="formInput">

                  <label>Last Name</label>
                  <input type="text" id="surname" onChange={(e)=>setSurname(e.target.value)}  value={Surname} placeholder="doe" />
              </div>

              <div className="formInput">
                  
                  <label>Email</label>
                  <input type="email" id="email" onChange={(e)=>setEmail(e.target.value)}  value={Email} placeholder="john_doe@gmail.com" />
              </div>

              <div className="formInput">
                  
                  <label>Password</label>
                  <input type="password" id="password" onChange={(e)=>setPassword(e.target.value)} value={Password}  placeholder="john_doe@gmail.com" />
              </div>

              <div className="formInput">
                  
                  <label>phone</label>
                  <input type="text" id="phone" onChange={(e)=>setPhone(e.target.value)} value={Phone}  placeholder="+1 234 567 89" />
              </div>
              <div className="formInput">
                  
                  <label>Address</label>
                  <input type="text" id="address"  onChange={(e)=>setAddress(e.target.value)}  value={Address} placeholder="Elton St. 216 NewYork" />
              </div>

              {/* {inputs.map((input) => (
                <div className="formInput" key={input.id}>
                  <label>{input.label}</label>
                  <input type={input.type} id={input.id} placeholder={input.placeholder} />
                </div>
              ))} */}
              <button>Send</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default New;
