import './App.css';
import { useState } from 'react';

function App() {
  const [name, setName] = useState("mario")

  const handleOnClick = () => {
    if (name === "mario")
      setName("luigi")
    else
      setName("mario")
    console.log(name)
  }

  return (
    <div className="App">
      <h2>My name is {name}</h2>
      <button onClick={handleOnClick}>Change name</button>
    </div>
  );
}

export default App;
