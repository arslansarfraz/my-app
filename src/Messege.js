import React, { useState } from 'react';
import NewMessesge from './NewMessesge';

function Messege(props) {
    return (
        <div>
            <h1>Value of counter variable is = {props.counter}</h1>
            <NewMessesge counter={props.counter} />
        </div>
    );
}

export default Messege;
