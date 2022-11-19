export const createAccount = async (details, handleCurrentUser) => {
  const resp = await fetch('/signup', {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(details),
    withCredentials: true
  })

  const data = await resp.json();
  console.log(data)
  handleCurrentUser(data);
}

export const login = async (details, handleCurrentUser) => {
  const resp = await fetch('/login', {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(details),
    withCredentials: true
  })

  const data = await resp.json();
  console.log(data)

  handleCurrentUser(data);
}

export const logout = async (e, logoutCurrentUser) => {
  e.preventDefault();

  
  const resp = await fetch('/logout', {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    }
  })

  const data = await resp.json();

  logoutCurrentUser();

}

export const getCurrentUser = async (handleCurrentUser) => {
  const resp = await fetch('/me', {
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    withCredentials: true
  })
  const data = await resp.json()

  handleCurrentUser(data);
}