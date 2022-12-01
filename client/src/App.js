import React, {useState, useEffect} from 'react';
import Home from './components/Home';
import Navbar from './Navbar';
import Login from './components/Login';
import Signup from './Signup';


import { BrowserRouter, Routes, Route, useNavigate} from "react-router-dom";


const App =() => {
  const [user, setUser]= useState({})
  const [loggedIn, setLoggedIn] = useState(false)
  const [currentUser, setCurrentUser] = useState({})
  const [ errors, setErrors ] = useState(false)
  const [wineries, setWineries] = useState([])
  // const navigate = useNavigate()

  useEffect(()=> {
    fetch('/me')
    .then(resp => {
        if(resp.ok){
            resp.json().then(data => {
               setUser(data)
               data.error? setLoggedIn(false) : setLoggedIn(true)
            })
        }else {
            resp.json().then(data => setErrors(data.error))
        }
    })
   
}, [])

  const handleCurrentUser = (user) => {
    if(user.username) {
      setCurrentUser(user);
      setLoggedIn(true);
   
    }
  }

  const logoutCurrentUser = () => {
    setCurrentUser({});
    setLoggedIn(false);
  }

  useEffect(() => {
  fetch("/wineries")
  .then(resp => resp.json())
  .then(wineries => setWineries(wineries))
}, [])

  return (
    <BrowserRouter>
     <Navbar user={user}  loggedIn={ loggedIn } logoutCurrentUser={ logoutCurrentUser }/>
      <Routes>
        <Route path="/" element={<Home user={user} loggedIn={loggedIn} currentUser={currentUser} />}  />
        <Route path="/login" element={<Login handleCurrentUser={handleCurrentUser} /> } />
        <Route path="/signup" element={<Signup handleCurrentUser={handleCurrentUser} /> } />
        {/* <Route path="/bottles" element={} /> */}
        {/* <Route path="/wineries"  /> */}
        {/* <Route path="/signup" element={<Signup /> } /> */}
      </Routes>
    </BrowserRouter>
  );
}

export default App;
