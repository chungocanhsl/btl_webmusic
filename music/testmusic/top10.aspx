<%@ Page Title="" Language="C#" MasterPageFile="~/pagemaster.Master" AutoEventWireup="true" CodeBehind="top10.aspx.cs" Inherits="testmusic.top10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menutheloai">
       <div>
           <nav class="menulist">
               <ul>
                   <li> <a href="Nhacmoi.aspx"> Nhạc Mới</a></li>
                   <li> <a href="theloai.aspx">Thể Loại</a></li>
                   <li> <a href="#"> Top100</a></li>
                   <li> <a href="#"> Ca sĩ</a>
                       <ul class="listmenu">
                           <li> <a href="nhungbaihatcua.aspx?namecasi=2"> Đen Vâu </a></li>
                           <li><a href="nhungbaihatcua.aspx?namecasi=1"> Bích Phương </a></li>
                             <li> <a href="nhungbaihatcua.aspx?namecasi=3">Vũ. </a></li>
                           <li><a href="nhungbaihatcua.aspx?namecasi=4"> Hoàng Dũng</a></li>
                             <li> <a href="nhungbaihatcua.aspx?namecasi=5"> Min </a></li>
                           <li><a href="nhungbaihatcua.aspx?namecasi=6">  Đức Phúc</a></li>
                       </ul></li>
               </ul>
               <hr style="width:85%" />
               <% if (Session["dangnhap"].ToString() != "1")
                   {%>
               <ul>
                   <li><a href="Uploadnhac.aspx" > Đóng góp nhạc</a> </li>
                   <li><a href="danhsachnhacdonggop.aspx" > Danh sách nhạc đã đóng góp</a> </li>
                       <% if (Session["dangnhap"].ToString() == "admin")
                   {%>
                   <li> <a href="quanlynhac.aspx" >Quản Lý Nhạc Của Người Đăng</a></li>
                      <li> <a href="QuanLybaiha.aspx" >Quản Lý Bài Hát Hiển Thị</a></li>
                   <% } %>
               </ul>
               <% } %>
           </nav>
       </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
