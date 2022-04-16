<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="testmusic.Login" %>


<div class="login-page">
  <div class="form">
    <form class="login-form">
        <asp:TextBox ID="username" runat="server" placeholder="Username" CssClass="textbox" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" Text="* Tên Đăng nhập không được để trống"  ForeColor="Red"></asp:RequiredFieldValidator>
        
        <asp:TextBox ID="password" runat="server" placeholder="PassWord" CssClass="textbox" TextMode="Password"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" Text="* Password không được để trống"  ForeColor="Red"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mật khẩu ít nhất từ 6 đến 10 ký tự" Display="Dynamic" ControlToValidate="password" ForeColor="Red" ValidationExpression=".{6,8}" />
        <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btnlogin" OnClick="btnlogin_Click" />
        <asp:Label ID="Label1" runat="server" ></asp:Label>
        <asp:Label ID="Label2" runat="server" ></asp:Label>
      <p class="message">Nếu chưa có tài khoản hãy ấn đăng ký <a href="Resign.aspx">Đăng ký tạo tài khoản</a></p>
    </form>
  </div>
</div>
