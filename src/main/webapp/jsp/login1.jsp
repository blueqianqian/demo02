<%--
  Created by IntelliJ IDEA.
  User: hh
  Date: 2018/10/8
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <script src="js/react.development.js"></script>
    <script src="js/react-dom.development.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.26.0/babel.min.js"></script>

    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body >
<div id="container" ></div>
<script type="text/babel">

    //表单的标签
    function FormLable(props){
        var styleObj2 = {
            color: 'white'
        };
        return (
            <label  className="col-sm-2 control-label" style={styleObj2}>
                {props.name}
            </label>
        );
    }

    //表单的输入框
    function FormInput(props) {
        return (
            <div className="col-sm-10">
                <input type={props.type} className="form-control"
                       name={props.name} id={props.id} placeholder={props.placeholder} required="true"/>
            </div>
        );
    }

    //表单用户输入框组合div
    function FormInputDiv(props) {
        return (
            <div className="form-group">
                <FormLable name={props.labelname}/>
                <FormInput type={props.inputtype} name={props.inputname} id={props.inputid} placeholder={props.inputplaceholder}/>
            </div>
        );
    }

    //用户登录组件
    class Login extends  React.Component{
        constructor(props) {
            super(props);
            this.check = this.check.bind(this);
        }

        //表单提交前的验证，验证用户名密码是否正确
        check(event){
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            $.get("/isRight?username="+username+"&password="+password,function(response){
                if(response=="登录失败"){
                    alert("用户名或密码错误，登录失败。。。");
                }
                if(response=="登录成功"){
                    alert(response);
                }
             });
        }
        render(){
            var styleObj1 = {
                height: '600px',
                width: '1400px',
                background: 'url(images/background.jpg)',
                backgroundSize: 'cover'
            } ;

            return <div id="main" style={styleObj1}>
                <div className="top-buttons-agileinfo">
                    <a href="login" className="active">登录</a><a href="register">注册</a>
                </div>
                <div className="main-agileits">
                    <div className="form-w3-agile">
                        <h2 className="sub-agileits-w3layouts">登录</h2>
                        <form role="form" action="/doLogin"   method="get" onSubmit={this.check}>
                            <FormInputDiv labelname="用户名" inputtype="text" inputname="username" inputid="username" inputplaceholder="请输入用户名"/>
                            <FormInputDiv labelname="密码" inputtype="password" inputname="password" inputid="password" inputplaceholder="请输入密码"/>
                            <div className="submit-w3l">
                                <input type="submit" value="登录"/>
                            </div>
                            <p className="p-bottom-w3ls">
                                <a href="register.html">点击注册</a>如果你没有一个帐户。 。
                            </p>
                        </form>
                    </div>

                </div>
            </div>
        }
    }


    ReactDOM.render(
        <Login/>,
        document.getElementById('container')
    );

</script>
</body>

</html>
