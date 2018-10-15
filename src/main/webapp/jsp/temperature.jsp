<%--
  Created by IntelliJ IDEA.
  User: hh
  Date: 2018/10/14
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/react.development.js"></script>
    <script src="js/react-dom.development.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.26.0/babel.min.js"></script>
</head>
<body>
<div id="root"></div>
<script type="text/babel">
    const scaleNames ={
        c: 'Celsius',
        f: 'Fahrenheit'
    };

    function BolilingVerdict(props) {
        if(props.celsius>=100){
            return <p>水会烧开</p>
        }
        return <p>水不会烧开</p>
    }

    class Calculator extends React.Component{
        constructor(props){
            super(props);
            this.handleChange = this.handleChange.bind(this);
            this.state = {temperature: ''};
        }

        handleChange(e){
            this.setState({temperature: e.target.value});
        }


        render(){
            const temperature = this.state.temperature;
            return (
                <fieldset>
                    <legend>输入一个摄氏温度:</legend>
                    <input
                           onChange={this.handleChange}/>

                    <BolilingVerdict celsius={parseFloat(temperature)}/>
                </fieldset>
            );
        }

    }

    //输入框组件
    class TemperatureTnput extends React.Component{
        constructor(props){
            super(props);
            this.handleChange = this.handleChange.bind(this);
        }

        handleChange(e) {
            this.props.onTemperatureChange(e.target.value);
        }

        render(){
            const temperature = this.props.temperature;
            const scale = this.props.scale;
            return (
                <filedset>
                    <legend>Enter temperature in {scaleNames[scale]}:</legend>
                    <input value={temperature} onChange={this.handleChange}/>
                </filedset>
            );
        }
    }

    //页面
    class Calculator1 extends React.Component{
        render(){
            return (
                <div>
                    <TemperatureTnput scale="c"/>
                    <TemperatureTnput scale="f"/>
                </div>
            );
        }
    }


    //温度转换函数
    function toCelsius(fahrenheit){
        return (fahrenheit - 32)*5/9;
    }
    function toFahrenheit(celsius){
        return (celsius*9/5)+32;
    }

    function tryConvert(temperature,convert){
        const input = parseFloat(temperature);
        if(Number.isNaN(input)){
            return '';
        }
        const output = convert(input);
        const rounded = Math.round(output*1000)/1000;
        return rounded.toString();
    }

    ReactDOM.render(
        <Calculator1 />,
        document.getElementById('root')
    );



</script>

</body>
</html>
