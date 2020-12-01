import React, { Component } from 'react';
import {
    Navbar,
    Nav,
    UncontrolledDropdown,
    DropdownToggle,
    DropdownMenu,
    DropdownItem,
    Dropdown,
    NavbarText,
    Button,
    Row,
    Col,
} from 'reactstrap';
import { Link, Redirect } from 'react-router-dom';
import { CgShoppingCart } from 'react-icons/cg';
import {  RiPhoneLine } from 'react-icons/ri';
import './NavTop.css';
import { format } from 'date-fns';
import { ImCancelCircle } from 'react-icons/im';

export default class NavTop extends Component {
    constructor(props) {
        super(props);
        this.state={
            roomTypes: [],
            itemAddCart: [],
            slItemAddCart: 0,
            dropdownOpen: false,

            toggleCart: false,
            isGoToCartPage: false
        };
        this.toggleRooms = this.toggleRooms.bind(this); 
        this.loadRoomTypes = this.loadRoomTypes.bind(this);
        this.showToggleCart = this.showToggleCart.bind(this);
    }

    componentWillMount(){
        this.loadRoomTypes();
    }

    loadRoomTypes(){
        axios.get('https://nativehotel.herokuapp.com/api/room_types').then( response => {
            this.setState({
                roomTypes: response.data,
                slItemAddCart: localStorage.getItem('slItemsShoppingCart') ? parseInt(localStorage.getItem('slItemsShoppingCart'),10) : 0
            })
        });
    }

    componentWillReceiveProps(nextProps) {
        // console.log('next props:', nextProps.slItemAddCart);
        this.setState({
            slItemAddCart: nextProps.slItemAddCart
        })
    }

    showRoomTypes(){
        console.log(this.state.roomTypes);
        const lst = this.state.roomTypes.map((item, index)=>
            <DropdownItem key={index}>
                <Link to={ '/room/' + item.idLP } style={{textDecorationLine:'none', color: 'black'}}>
                    <NavbarText className="nav-link"><span>{item.tenLP}</span></NavbarText>
                </Link>
            </DropdownItem>
        );
        return lst;
    }

    toggleRooms(){
        this.setState({
            dropdownOpen: !this.state.dropdownOpen
        });
    }

    shoppingCart(){
        // xử lý lấy từ LS
        if(localStorage.getItem('itemsShoppingCart')==null){
            return;
        } else {
            this.setState({ toggleCart: !this.state.toggleCart });
            var items = JSON.parse(localStorage.getItem('itemsShoppingCart'));
            var sl = parseInt(localStorage.getItem('slItemsShoppingCart'),10);
            console.log('in LS: ', items, sl);
    
            this.setState({
                itemAddCart: items,
                slItemAddCart: sl
            }, () => console.log('Xử lý trong Nav', this.state.itemAddCart, this.state.slItemAddCart));
        }
    } 

    showToggleCart(){
        if(localStorage.getItem('itemsShoppingCart')){
            var diff = JSON.parse(localStorage.getItem('dateArriveCart')).days_diff;
            var startDate = format(new Date(JSON.parse(localStorage.getItem('dateArriveCart')).startDate), 'dd/MM/yyyy');
            var room = JSON.parse(localStorage.getItem('itemsShoppingCart'))[0];
            const deleteItemsLocalStorage = ()=>{
                localStorage.removeItem('itemsShoppingCart');
                localStorage.removeItem('slItemsShoppingCart');
                this.setState({
                    slItemAddCart: 0
                }, ()=>{console.log('sl sau khi rm: ', this.state.slItemAddCart)});
            }
            return (
                <DropdownMenu>
                    <DropdownItem className="text-center" disabled>{ diff } nights from { startDate }</DropdownItem>
                    <DropdownItem divider />
                    <DropdownItem text="true">
                        <Row style={{ lineHeight: '43px' }}>
                            <Col>{ room.tenLP }</Col>
                            <Col>{ room.giaLP }</Col>
                            <Col>
                                <Button 
                                    outline color="red" 
                                    className="btn-add icon-top"
                                    style={{padding: 0}} 
                                    onClick={ deleteItemsLocalStorage }
                                >
                                    <ImCancelCircle style={{fontSize: '3vh'}} color="black" className="icon-top" />
                                </Button>
                            </Col>
                        </Row>
                    </DropdownItem>
                    <DropdownItem divider />
                    <DropdownItem text="true">
                        <Row style={{paddingBottom:'5%'}}>
                            <Col style={{fontSize:'1.2vw'}}><b>Total (inc tax)</b></Col>
                            <Col style={{fontSize:'1.2vw'}}><b>{ parseInt(room.giaLP,10) } VND</b></Col>
                        </Row>
                    </DropdownItem>
                    <DropdownItem text="true">
                        <Row className="button-GoBasket">
                            <Button color="dark" style={{marginLeft: '7vw'}} 
                                onClick={
                                    ()=>{
                                        this.setState({ isGoToCartPage: !this.state.isGoToCartPage });
                                    }
                            }><b>Go BASKET</b></Button>
                        </Row>
                    </DropdownItem>
                </DropdownMenu>
            );
        }
        
    }

    render() {
        if(this.state.isGoToCartPage){
            return (
                <Redirect to="/your_basket" />
            );
        }
        return (
            <div className="nav-on-top">
                {/* className="justify-content-center" */}
                <Navbar style={{height: '7vh'}} className="justify-content-center nav-cus-font" color="light" light expand="md">
                    <Link className="navbar-brand navbar-brand-cus" to="/">
                        <b style={{fontSize:'4.0vh'}}>NATIVE</b>
                    </Link>
                    {/* <NavbarToggler onClick={this.toggle} /> */}
                    {/* <Collapse isOpen={isOpen} navbar> */}
                        <Nav className="mr-auto" navbar>
                            <NavbarText>
                                <Link to="/about"><NavbarText className="nav-link nav-item-cus"><b><span>About</span></b></NavbarText></Link>
                            </NavbarText>
                            <NavbarText>
                                <Link to="/room_rates"><NavbarText className="nav-link nav-item-cus"><b><span>Room Rates</span></b></NavbarText></Link>
                            </NavbarText>
                            <UncontrolledDropdown className="navbar-text nav-dropdown-rooms nav-item-cus" nav inNavbar>
                                <DropdownToggle className="nav-item-cus" nav caret>
                                    <b><span>Rooms</span></b>
                                </DropdownToggle>  
                                <DropdownMenu>
                                    {this.showRoomTypes()}
                                </DropdownMenu>
                            </UncontrolledDropdown>
                        </Nav>
                        <NavbarText className="icon-shopping-cart">
                            <Dropdown isOpen={this.state.toggleCart} toggle={ ()=>this.shoppingCart() }>
                                <DropdownToggle>
                                    <CgShoppingCart style={{fontSize:"23px", fontWeight: "bold"}} className="icon"/>
                                    <b style={{fontSize:"20px"}}>({ this.state.slItemAddCart })</b>
                                </DropdownToggle>
                                { this.showToggleCart() }
                            </Dropdown>
                        </NavbarText>
                        <NavbarText><RiPhoneLine style={{fontSize:"23px", fontWeight: "bold"}} className="icon"/><b style={{fontSize:"20px"}}>025548203</b></NavbarText>  
                    {/* </Collapse> */}
                </Navbar>
            </div>
        )
    }
}
