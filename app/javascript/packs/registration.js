import React from "react"
import WebpackerReact from 'webpacker-react';

import {Task} from 'components/task'
import reqwest from 'reqwest'


const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

// Make sure to bind modal to your appElement (http://reactcommunity.org/react-modal/accessibility/)


var styles_close = {

  background: 'red',
  color:'white',
  padding: '10px'


}
var styles_open = {

  background: 'green',
  color:'white',
  padding: '10px'


}

class Registration extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      modalIsOpen: false,
      name: "",
      fecha: "",
      responsable: "",
      id: 0,
      estado: "Abierta",
      style_task: styles_open
    };

    this.openModal = this.openModal.bind(this);
    this.afterOpenModal = this.afterOpenModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }

  openModal() {
    this.setState({modalIsOpen: true});
    var that = this;
    reqwest({
    url: '/get_task/' + this.props.id
  , method: 'get'
  , success: function (resp) {
      //qwery('#content').html(resp)
      console.log(resp);
      
      that.setState({

        name: resp.name,
        fecha: resp.f_compromiso,
        responsable: resp.responsable, 
        accion_name: resp.accion_name,
        id: resp.id,

      
      });

    }
  })


  }

    
    closeTask(){
      var that = this;
      reqwest({
        url: '/close_task',
        method: 'POST',
        data:{id: that.state.id
          },
        headers:{
          'X-CSRF-Token': window.FacilitoSocial.token
        }
      }).then(data =>{
        console.log(data);
        that.setState({


        estado: "Cerrada",
        style_task: styles_close
      
      });
      }).catch(err =>  console.log(err));
}


  afterOpenModal() {
    // references are now sync'd and can be accessed.
    this.subtitle.style.color = '#f00';
  }

  closeModal() {
    this.setState({modalIsOpen: false});
  }

  render() {
    return (
      <div>
       
        <button className="btn btn-primary" onClick={this.openModal}>VER</button>
   
      </div>
    );
  }
}



WebpackerReact.setup({Registration})

