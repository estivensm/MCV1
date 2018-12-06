import React from "react"
import WebpackerReact from 'webpacker-react';
import PropTypes from "prop-types"

class HelloWorld extends React.Component {
  render () {
    return (
       <div>
       <p>hello world</p>
       </div>	
    );
  }
}


export default HelloWorld


WebpackerReact.setup({HelloWorld})