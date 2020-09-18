import React, { useState } from 'react';
import Messege from './Messege';
import './App.css'

function App() {
  let [count, setCount] = useState(1);
  let [Bg, setBg] = useState(true);
  return (
    <div className={`weather ${Bg ? 'night' : ''}`}>
      <Messege counter={count} />
      <button onClick={() => setCount(++count)}>Click me</button>
      <button onClick={() => setBg(!Bg)}>Set Day</button>
    </div >
  );
}

export default App;
