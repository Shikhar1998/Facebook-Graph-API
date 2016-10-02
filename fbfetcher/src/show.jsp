
<%@page import="java.sql.*" %>
<% 
	
	String c = request.getParameter("c");
	String m = request.getParameter("m"); 
	String s = request.getParameter("s");
	String l = request.getParameter("l");
	String f = request.getParameter("f");
	String[] cap = c.split("_");
	String[] mes = m.split("_");
	String[] sha = s.split("-");
	String[] lik = l.split("-");
	String[] ido = f.split("-");
	int sm=ido.length;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","abc"); 
	Statement st = con.createStatement();
	st.execute("CREATE TABLE fbc(sno integer,id varchar2(50),caption varchar2(500),message varchar2(80),shares integer,likes integer,primary key (sno))");
	int li,sh,sno;
	for (int u=0;u<sm;u=u+1){
		li=Integer.parseInt(lik[u]);
		sh=Integer.parseInt(sha[u]);
		sno=u+1;
		String query = "INSERT INTO fbc VALUES (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1,sno);
		ps.setString(2,ido[u]);
		ps.setString(3,mes[u]);
		ps.setString(4,cap[u]);
		ps.setInt(5,li);
		ps.setInt(6,sh);
		ps.execute();
		ps.close();
	};
	st.execute("delete from fbc where sno='"+sm+"'");
	response.sendRedirect("table.jsp");
	st.close();
	con.close();
}
catch(Exception e){
	if (e.getMessage().contains("ORA-00001") || e.getMessage().contains("ORA-00955")){
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","abc"); 
		Statement st = con.createStatement();
		st.execute("drop table fbc");
		st.execute("CREATE TABLE fbc(sno integer,id varchar2(50),caption varchar2(500),message varchar2(80),shares integer,likes integer,primary key (sno))");
		int li,sh,sno;
		out.println(m);
		for (int u=0;u<sm;u=u+1){
			li=Integer.parseInt(lik[u]);
			sh=Integer.parseInt(sha[u]);
			sno=u+1;
			String query = "INSERT INTO fbc VALUES (?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,sno);
			ps.setString(2,ido[u]);
			ps.setString(3,mes[u]);
			ps.setString(4,cap[u]);
			ps.setInt(5,li);
			ps.setInt(6,sh);
			try{
			ps.execute();}
			catch(Exception e2){
				out.println(e2);
			}
			ps.close();
		};
	st.execute("delete from fbc where sno='"+sm+"'");
	response.sendRedirect("table.jsp");
	st.close();
	con.close();
	}
	else{
		out.println(e.getMessage()+"<br>");
		out.println("<h4>Possible Reasons of Error : </h4><h5>1.The username and password of your database is not equal to that configured in fb/src/show.jsp on line no. 17 and 43<br><br>2.The connection is not established correctly try troubleshooting Oracle Listner<br><br>3.Try restarting your browser and see in console for error<br>");
		out.println("<h4>Possible Reasons of Error : </h4><h5>1.The username and password of your database is not equal to that configured in fb/src/show.jsp on line no. 17 and 43<br><br>2.The connection is not established correctly try troubleshooting Oracle Listner<br><br>3.Try restarting your browser and see in console for error<br>");
	}
	}

%>