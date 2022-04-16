<%@ Page Title="" Language="C#" MasterPageFile="~/pagemaster.Master" AutoEventWireup="true" CodeBehind="suauser.aspx.cs" Inherits="testmusic.suauser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/xoanhacuser.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="menutheloai">
       <div>
           <nav class="menulist">
               <ul>
                   <li> <a href="Nhacmoi.aspx"> Nhạc Mới</a></li>
                   <li> <a href="theloai.aspx">Thể Loại</a></li>
                   <li> <a href="#"> Top100</a></li>
                   <li> <a href="#"> Ca sĩ</a></li>
               </ul>
               <hr style="width:85%" />
               <% if (Session["dangnhap"].ToString() != "1")
                   {%>
               <ul>
                   <li><a href="Uploadnhac.aspx" > Đóng góp nhạc</a> </li>
                   <li><a href="danhsachnhacdonggop.aspx" > Danh sách nhạc đã đóng góp</a> </li>
                    <% if (Session["dangnhap"].ToString() == "admin")
                   {%>
                   <li> <a href="quanlynhac.aspx" >Quản Lý Người Dùng</a></li>
                   <% } %>
               </ul>
               <% } %>
           </nav>
       </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content2" runat="server">
     <h3 style="text-align:center">
        Sửa User  <asp:Label  CssClass="lb1" runat="server" id="lb1"></asp:Label>
    </h3>

    <div class="suauser">
        <div class="sua">
             <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
            
   
            <p> Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox> </p>
             <p> Email: <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox> </p>

             <p> Ngày sinh<asp:TextBox ID="txtNgaysinh" runat="server" TextMode="Date"></asp:TextBox>
             </p>
             <p> Giới tính:  <asp:DropDownList ID="txtGioitinh" runat="server">
                           <asp:ListItem>Nam</asp:ListItem>
                           <asp:ListItem>Nữ</asp:ListItem>
             </asp:DropDownList></p>
                      
                     <br />
             <asp:Label ID="Label" runat="server" ></asp:Label>
                  <asp:Button ID="btnSua" runat="server" Text="Sửa" CssClass="btnSua"  OnClick="btnSua_Click"/>  <br />
                                        <hr />
        </div>
    </div>
</asp:Content>
