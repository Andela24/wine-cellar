import React from 'react'
import { NavLink } from 'react-router-dom'
import { useNavigate } from 'react-router-dom'


const Navbar = ({loggedIn, logoutCurrentUser }) => {
    const navigate=useNavigate()
    const handleLogout = () => {
        fetch('/logout')
        .then(()=>{
         logoutCurrentUser()   
         navigate("/")
        })
    }
    if( loggedIn ) {
        return (
          <ul>
            <li><NavLink to="/">Home</NavLink></li>
            <li><NavLink to="/logout" onClick={handleLogout }>Logout</NavLink></li>
            <li><NavLink to="/wineries" >All Wineries</NavLink></li>
            <li><NavLink to="/bottles" >My Collection</NavLink></li>
          
          </ul>
        )
      }
    
      return (
        <ul>
          <li><NavLink to="/">Home</NavLink></li>
          <li><NavLink to="/signup">Create Account</NavLink></li>
          <li><NavLink to="/login">Login</NavLink></li>
        </ul>
      )
    }

export default Navbar
