<%@ page language="C#" autoeventwireup="true" codebehind="Default.aspx.cs" inherits="ValidationControls.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration Form</title>
    <style type="text/css">
        .table {
            width: 100%;
        }
        .table .label {
            width: 320px;
        }
    </style>
    <script lang="javascript" type="text/javascript">
        function ValidatePassword(source, arguments) {
            var data = arguments.Value.split('');
            //start by setting false
            arguments.IsValid = false;
            //check length
            if (data.length < 6 || data.length > 12) return;
            //check for uppercase
            var uc = false;
            for (var c in data) {
                if (data[c] >= 'A' && data[c] <= 'Z') {
                    uc = true; break;
                }
            }
            if (!uc) return;
            //check for lowercase
            var lc = false;
            for (c in data) {
                if (data[c] >= 'a' && data[c] <= 'z') {
                    lc = true; break;
                }
            }
            if (!lc) return;
            //check for numeric
            var num = false;
            for (c in data) {
                if (data[c] >= '0' && data[c] <= '9') {
                    num = true; break;
                }
            }
            if (!num) return;
            //must be valid
            arguments.IsValid = true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>User registration form</h1>
            <div>
                <table class="table">
                    <tr>
                        <asp:validationsummary runat="server" ShowMessageBox="True"></asp:validationsummary>
                    </tr>
                    <tr>
                        <td class="label"><asp:label id="lblName" runat="server" text="User Name"></asp:label></td>
                        <td><asp:textbox id="txtbName" runat="server"></asp:textbox>
                            <asp:requiredfieldvalidator id="recvalName" runat="server" text="*" errormessage="User name is required" ControlToValidate="txtbName" ToolTip="User name is required" ForeColor="Red"></asp:requiredfieldvalidator>
                            <asp:regularexpressionvalidator runat="server" text="*" errormessage="please enter only alpha-numeric characters (and no spaces)" ToolTip="please enter only alpha-numeric characters (and no spaces)" ControlToValidate="txtbName" ValidationExpression="\w{6,14}" ForeColor="Red"></asp:regularexpressionvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label"><asp:label id="lblEmail" runat="server" text="Email"></asp:label></td>
                        <td><asp:textbox id="txtbEmail" runat="server"></asp:textbox>
                            <asp:requiredfieldvalidator id="recvalEmail" runat="server" text="*" errormessage="Email is required" ControlToValidate="txtbEmail" ToolTip="Email is required" ForeColor="Red"></asp:requiredfieldvalidator>
                            <asp:regularexpressionvalidator runat="server" text="*" errormessage="Internet email format" ToolTip="Internet email format" ControlToValidate="txtbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:regularexpressionvalidator></td>
                    </tr>
                    <tr>
                        <td class="label"><asp:label id="lblPassword" runat="server" text="Password"></asp:label></td>
                        <td><asp:textbox id="txtbPassword" runat="server" textMode="Password"></asp:textbox>
                            <asp:requiredfieldvalidator id="recvalPassword" runat="server" text="*" errormessage="Password is required" ControlToValidate="txtbPassword" ToolTip="Password is required" ForeColor="Red"></asp:requiredfieldvalidator>
                            <asp:customvalidator runat="server" text="" errormessage="Please enter 6-14 characters, at least 1 uppercase letter, 1 lowercase letter, and 1 number" ToolTip="Please enter 6-14 characters, at least 1 uppercase letter, 1 lowercase letter, and 1 number" ControlToValidate="txtbPassword" ForeColor="Red" ClientValidationFunction="ValidatePassword" OnServerValidate="CustomValidatorPassword_ServerValidate" EnableClientScript="false">*</asp:customvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label"><asp:label id="lblConfPassword" runat="server" text="Confirm Password"></asp:label></td>
                        <td><asp:textbox id="txtbConfPassword" runat="server" textMode="Password"></asp:textbox>
                            <asp:requiredfieldvalidator id="recvalConfPassword" runat="server" text="*" errormessage="Confirm password is required" ControlToValidate="txtbConfPassword" ToolTip="Confirm password is required" ForeColor="Red"></asp:requiredfieldvalidator>
                            <asp:comparevalidator runat="server" text="*" errormessage="Both password fields must match" toolTip="Both password fields must match" ControlToValidate="txtbConfPassword" ControlToCompare="txtbPassword" ForeColor="Red"></asp:comparevalidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:button id="btnRegister" runat="server" text="Register" OnClick="RegisterButton_Click"/>
                            <asp:Button ID="btnCancel" runat="server" text="Cancel" CausesValidation="False" OnClick="CancelButton_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
