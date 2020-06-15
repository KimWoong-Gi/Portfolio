<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/search.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
    <div class="container">
    <div class="row">
      <!-- BEGIN SEARCH RESULT -->
      <div class="col-md-12">
        <div class="grid search">
          <div class="grid-body">
            <div class="row">
            
              <!-- BEGIN RESULT -->
              <div class="col-md-5">
                <h2><i class="fa fa-file-o"></i> 배우 검색</h2>
                <hr>
                <!-- BEGIN SEARCH INPUT -->
                <div class="input-group">
                  <input type="text" class="form-control" value="" placeholder="검색할 배우 이름을 입력하세요:">
                  <span class="input-group-btn">
                    <button class="btn btn-info" type="button"><i class="fa fa-search"></i></button>
                  </span>
                </div>
                <!-- END SEARCH INPUT -->
                <p> "송강호" 라는 이름으로 검색한 결과</p>
                
                <div class="padding"></div>
                                
                <!-- BEGIN TABLE RESULT -->
                <div class="table-responsive">
                  <table class="table table-hover">
                    <tbody>
                    <tr>
                      <td class="number text-center">1</td>
                      <td class="image"><img src="https://via.placeholder.com/60x60" alt=""></td>
                      <td class="product"><strong>송강호 1</strong><br>This is the product description.</td>
                      <td class="button"><button type="button" class="btn btn-parimary my-2 my-sm-0">선택</button></td>
                    </tr>
                  	</tbody>
                  </table>
                </div>
                <!-- END TABLE RESULT -->               
              </div>
              <!-- END RESULT -->
            
              <!-- BEGIN SELECTION LIST -->
              <div class="col-md-6 offset-md-1">
                <h2 class="grid-title"><i class="fa fa-filter"></i> 출연배우 목록</h2>
                <hr>
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>이름 <i class="fa fa-sort"></i></th>
                            <th>생년월일</th>
                            <th>국적 <i class="fa fa-sort"></i></th>
                            <th>액션 </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Thomas Hardy</td>
                            <td>89 Chiaroscuro Rd.</td>
                            <td>USA</td>
                            <td>
                                <a href="#" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                                <a href="#" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
              </div>
              <!-- END SELECTION LIST -->



            </div>
          </div>
        </div>
      </div>
      <!-- END SEARCH RESULT -->
    </div>
    </div>

    <script  src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/0e7d487ee9.js" crossorigin="anonymous"></script>
    <script>
        // Get the current year
        $('#year').text(new Date().getFullYear());    
    </script>
</body>
</html>