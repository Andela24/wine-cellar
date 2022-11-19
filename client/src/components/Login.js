import React, { useState } from 'react'
import { useNavigate } from "react-router-dom"
// import { login } from './Actions/auth'

const Login = ( { handleCurrentUser }) => {
    const [form, setForm] = useState({
        username: '',
        password: ''
      })
      const navigate=useNavigate()
      const [ errors, setErrors ] = useState([])
    

    const handleChange = (e)=> {
        setForm({
          ...form,
          [e.target.name]: e.target.value
        })
      }

    const handleSubmit = (e) => {
        e.preventDefault()
     
         fetch('/login', {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: JSON.stringify(form),
        })
        .then(resp => {
            if(resp.ok){
               resp.json().then(user => {
                  handleCurrentUser(user)
                  navigate('/')
               })
            }else {
               resp.json().then(json => setErrors(json.errors))
            }
         })
   
     }  
     

     
  return (
     <div>
      <h1>Login</h1>
      <form onSubmit={ handleSubmit }>
        <div>
          <label htmlFor="username">Username: </label>
          <input type="text" id="username" name="username" value={ form.username } onChange={ handleChange } />
        </div><br />
        <div>
          <label htmlFor="password">Password: </label>
          <input type="password" id="password" name="password" value={ form.password } onChange={ handleChange } />
        </div><br />
        <input type="submit" value="Login" />
      </form>
    </div>
  )
}

export default Login
