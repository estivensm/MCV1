import React from "react"
import WebpackerReact from 'webpacker-react';
import Modal from 'react-modal';
import {Task} from 'components/task'
import reqwest from 'reqwest'


const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)',
    width                 : '50%'
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
var image_style = {

    width: '64px',
    borderRadius: '50%',
    marginTop: '5px',
    marginBottom: '5px'
}

class Registration extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      modalIsOpen: false,
      name: "",
      fecha: "",
      responsable: "",
      image: "",
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

        name: resp["task"].name,
        fecha: resp["task"].f_compromiso,
        responsable: resp["task"].responsable, 
        accion_name: resp["task"].description,
        image: resp["task"].image,
        id: resp["task"].id,

      
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
        <Modal
          isOpen={this.state.modalIsOpen}
          onAfterOpen={this.afterOpenModal}
          onRequestClose={this.closeModal}
          style={customStyles}
          contentLabel="Example Modal"
        >

          <h2 ref={subtitle => this.subtitle = subtitle}>Hello {this.props.name}</h2>
          <button onClick={this.closeModal}>close</button>
       
          s
    
                  <div className="container-fluid" >

                      <div className="col-md-2 no-padding-left">
                          <img style={image_style} src={this.state.image != null ? this.state.image : "https://dnuba.s3.amazonaws.com/uploads/bank_image/achivo/44/user.jpeg"} />
                                        
                      </div>

                       <div className="col-md-8 no-padding-left">

                        <p className="margin-top" ><b>Descripcion de la Tarea</b></p>
                        <p>{this.state.accion_name}</p> 

                        <p className="margin-top"><b>Fecha:</b></p>
                        <p className="no-margin-bottom">{this.state.fecha}</p>

                      </div>
                  </div>

        </Modal>
      </div>
    );
  }
}



WebpackerReact.setup({Registration})

   // <button onClick={this.closeTask.bind(this)}>Cerrar Tarea</button>
   //   <span style={this.state.style_task}>{this.state.estado}</span>