import Sidebar from "../../components/sidebar/Sidebar";
import Navbar from "../../components/navbar/Navbar";
import "./home.scss";
import Widget from "../../components/widget/Widget";
import Table from "../../components/table/Table";
import axios from 'axios';
import { useQuery } from "react-query";

const Home = () => {
  // Geting Count Of Querys Through API
  const { data ,isLoading,isError,error}=useQuery('GetCount',()=>{
    return(axios.get('http://127.0.0.1:8000/api/get_Count_Register/').then((res)=>res.data))
  });
  

  return (
    <div className="home">
      <Sidebar />
      <div className="homeContainer">
        <Navbar />
          
      
        <div className="widgets">
          <Widget type="ClaimRegistered" count='0'/>
          <Widget type="ClaimAccepted" count={data?.approved_count} />
          <Widget type="ClaimRecieved" count="0"/>
          <Widget type="ClaimPending" count={data?.pending_count}/>
        </div>
    
        <div className="listContainer">
          <div className="listTitle">Claim Registered</div>
          <Table />
        </div>
      </div>
    </div>
  ); 

};

export default Home;
