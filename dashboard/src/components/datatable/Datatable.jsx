import "./datatable.scss";
import { DataGrid } from "@mui/x-data-grid";
import { userColumns, userRows } from "../../datatablesource";
import { Link } from "react-router-dom";
import { useState } from "react";
import { useQuery } from "react-query";
import axios from "axios"
import { TableContainer } from "@mui/material";


const Datatable = () => {
  const { data, isLoading,refetch, isError, error } = useQuery('GetAllUsers', () => {

    return axios.get('http://127.0.0.1:8000/api/users/').then((res) => res.data)
  })
  
  const handleDelete = (id) => {

    return axios.delete(`http://127.0.0.1:8000/api/users/?id=${id}`).then((res)=>{
      if (res.status='200'){
        alert('Deleted Succesfully')
        
        refetch()
      }else{
        alert('Problem Deleting data')

      }
    }
    

    )


  }


  const actionColumn = [
    {
      field: "action",
      headerName: "Action",
      width: 200,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <Link to="/users/test" style={{ textDecoration: "none" }}>
              <div className="viewButton">View</div>
            </Link>
            <div
              className="deleteButton"
            // onClick={() => handleDelete(params.row.id)}
            >
              Delete
            </div>
          </div>
        );
      },
    },
  ];
  return (
    <div className="datatable">
      <div className="datatableTitle">
        Add New User
        <Link to="/users/new" className="link">
          Add New
        </Link>
      </div>
      {/* Not Ready   */}
    
      <table>
        <thead>
        <tr>
          <td>S.r.No</td>
          <td>Username</td>
          <td>Email</td>
          <td>Status</td>
          <td>Action</td>
        </tr>
        </thead>
    { 
      data?.map((User,index)=>{
        return(
        <tbody>
        
            <td>{index+1}</td>
            <td>{User.username}</td>
            <td>{User.email}</td>
            <td>{User.is_active ? 'Active':'Non Active'}</td>
            <td><div className="cellAction">
            <Link to="/users/detail" style={{ textDecoration: "none" }}>
              <div className="viewButton">View</div>
            </Link>
            <div
              className="deleteButton"
            onClick={() => handleDelete(User.id)}
            >
              Delete
            </div>
          </div></td>

          
        </tbody>

        )

      })

        
    }
    </table>

        

          {/* </TableContainer> */}
          
          </div >

      
  );
};

export default Datatable;
