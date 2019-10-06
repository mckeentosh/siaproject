<script>
var name=<%=name%>;
</script>
this is working good.
I'm trying reverse of this method.
I.e . Here we get jsp value to script. What i want is script value to jsp.
Some what like this..
<script>
var name=document.getElementById("name");
</script>
<%
String username = <script>name</script>;
//here name is javascript value or result.
%>