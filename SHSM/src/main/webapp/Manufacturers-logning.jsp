<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin廠商</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">

    <script src="../../assets/js/ie-emulation-modes-warning.js" tppabs="http://bootstrap.css88.com/v3.3.1/assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">廠商登入</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 記得帳號密碼?
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
      </form>

    </div> <!-- /container -->
  </body>
</html>
