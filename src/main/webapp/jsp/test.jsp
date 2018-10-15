<%--
  Created by IntelliJ IDEA.
  User: hh
  Date: 2018/10/9
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <script src="js/react.development.js"></script>
    <script src="js/react-dom.development.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.26.0/babel.min.js"></script>
</head>
<body>
    <div id="root"></div>
    <script type="text/babel">

        class Clock extends  React.Component{
            constructor(props){
                super(props);
                this.state = {date: new Date()};
            }

            componentDidMount(){
                this.timer = setInterval(
                    ()=> this.tick(),1000
                );
            }

            componentWillUnmount(){
                clearInterval(this.timer);
            }


            tick(){
                this.setState({
                    date: new Date()
                });
            }


            render(){
                return (
                    <div>
                        <h1>Hello,world!</h1>
                        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
                    </div>
                );
            }

        }

        class Popper extends React.Component{
            constructor(){
                super();
                this.state = {name:'hello world'};
            }

            preventPop(name,e){
                e.preventDefault();
                alert(name);
            }

            render(){
                return (
                    <div>
                        <p>hello</p>
                        <a href="https://reactjs.org" onClick={this.preventPop.bind(this,this.state.name)}>Click</a>
                    </div>
                );
            }

        }


        function UserGreeting(props){
            return <h1>Welcome back!</h1>
        }

        function GuestGreeting(props){
            return <h1>Please sign up!</h1>
        }

        function Greeting(props){
            const isLoggedIn = props.isLoggedIn;
            if(isLoggedIn){
                return <UserGreeting/>;
            }
            return <GuestGreeting/>;
        }

        function LoginButton(props){
            return (
                <button onClick={props.onClick}>
                    Login
                </button>
            );
        }

        function LogoutButton(props){
            return (
                <button onClick={props.onClick}>
                    Logout
                </button>
            )
        }

        class LoginControl extends React.Component{
            constructor(props){
                super(props);
                this.handleLoginClick = this.handleLoginClick.bind(this);
                this.handleLogoutClick = this.handleLogoutClick.bind(this);
                this.state = {isLoggedIn: false}
            }

            handleLoginClick(){
                this.setState({isLoggedIn: true});
            }

            handleLogoutClick(){
                this.setState({isLoggedIn: false});
            }

            render(){
                const isLoggedIn = this.state.isLoggedIn;

                let button = null;
                if(isLoggedIn){
                    button = <LogoutButton onClick={this.handleLogoutClick}/>
                }else{
                    button = <LoginButton onClick={this.handleLoginClick}/>
                }

                return (
                    <div>
                        <Greeting isLoggedIn={isLoggedIn}/>
                        {button}
                    </div>
                );
            }
        }

        class NameForm extends React.Component {
            constructor(props) {
                super(props);
                this.state = {value: ''};

                this.handleChange = this.handleChange.bind(this);
                this.handleSubmit = this.handleSubmit.bind(this);
            }

            handleChange(event) {
                this.setState({value: event.target.value});
            }

            handleSubmit() {
                alert('A name was submitted: ' + this.state.value);
            }

            render() {
                return (
                    <form onSubmit={this.handleSubmit}>
                        <label>
                            Name:
                            <input type="text" value={this.state.value} onChange={this.handleChange} />
                        </label>
                        <input type="submit" value="Submit" />
                    </form>
                );
            }
        }

        ReactDOM.render(
            <NameForm />,
            document.getElementById('root')
        );

    </script>
</body>
</html>
