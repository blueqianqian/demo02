<%--
  Created by IntelliJ IDEA.
  User: hh
  Date: 2018/10/8
  Time: 17:45
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

    <!--<script type="text/javascript" src="js/register.js"></script>-->

    <script src="js/react.development.js"></script>
    <script src="js/react-dom.development.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.26.0/babel.min.js"></script>



    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>

<div id="root"></div>
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
                       name={props.name} id={props.id} placeholder={props.placeholder} required="true" onBlur={props.onBlur} onFocus={props.onFocus}/>
            </div>
        );
    }

    //表单用户输入框组合div
    function FormInputDiv(props) {
        return (
            <div className="form-group">
                <FormLable name={props.labelname}/>
                <FormInput type={props.type} name={props.name} id={props.id} placeholder={props.placeholder} onBlur={props.onBlur} onFocus={props.onFocus}/>
            </div>
        );
    }

    //用户注册组件
    class Register extends React.Component{
        constructor(props){
            super(props);
            this.check = this.check.bind(this);
            this.onblur1 = this.onblur1.bind(this);
            this.onfocus1 = this.onfocus1.bind(this);
        }

        check(){
            var username = document.getElementById("username").value;
            alert(username);
            $.get("/isNameExist?username="+username,function(response){
                if(response=="用户名已存在"){
                    alert("用户名已存在，注册失败。。。");
                }else{
                    alert("注册成功，请登录。。。");
                }
            });
        }

        //输入框失去焦点，验证用户名是否存在
        onblur1(){
            var username = document.getElementById("username").value;
            $.get("/isNameExist?username="+username,function(response){
                if(response=="用户名已存在"){
                    document.getElementById("span").innerHTML="<font color='red'>"+response+"</font>";
                }
            });
        }

        //聚焦
        onfocus1(){
            document.getElementById("span").innerHTML="";
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
                        <a href="login" >登录</a><a href="register" className="active">注册</a>
                     </div>
                    <div className="main-agileits">
                    <div className="form-w3-agile">
                        <h2 className="sub-agileits-w3layouts">注册</h2>
                        <form role="form" action="/doRegister"  method="get"  onSubmit={this.check}>
                            <FormInputDiv labelname="用户名" type="text" name="username" id="username" placeholder="请输入用户名" onBlur={this.onblur1} onFocus={this.onfocus1}/>
                            <span id="span"></span>
                            <FormInputDiv labelname="密码" type="password" name="password" id="password"  placeholder="请输入密码"/>
                            <div className="submit-w3l">
                                <input type="submit" value="注册" />
                            </div>
                            <p className="p-bottom-w3ls">
                            </p>
                        </form>
                    </div>
                </div>
        </div>

        }
    }

    ReactDOM.render(
        <Register/>,
        document.getElementById('root')
    );


</script>

</body>
</html>
