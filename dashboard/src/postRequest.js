import axios from "axios";
import React from "react";
import {useQuery } from "react-query";
import { useMutation } from "react-query";

export const AddUser = ()=>{

    const query=(data)=>{
        return axios.post('http://127.0.0.1:8000/api/users/New/',data)
    }

    return useMutation(query)
}