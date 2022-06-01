<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keyword" content="구독, 결제, 관리, 레페">
    <meta name="description" content="구독 결제 관리 웹사이트 레페">
    <meta name="author" content="웹마스터">

    <title>레페</title>

    <!-- Custom fonts for this template-->
    <link href="./startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">
  </head>

  <body>
    <%@ include file="/WEB-INF/jsp/top.jsp" %>
    <!-- Begin Page Content -->
    <div class="container-fluid">

      <!-- Page Heading -->
      <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">대시보드</h1>
        <div class="text-gray-800">5월 총 결제 금액은 ...입니다.</div>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> 리포트 생성하기</a>
      </div>

      <!-- Content Row -->
      <div class="row">

        <!-- Netflix card -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                    넷플릭스</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800 mb-1">₩9,500</div>
                  <div class="small font-weight-bold">결제예정일</div>
                  <div class="small font-weight-bold">2022년 5월 28일</div>
                </div>
                <div class="col-auto">
                  <img src="./images/netflix.png" alt="넷플릭스 로고" width="100px">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Disneyplus card -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                    디즈니 플러스</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800 mb-1">₩9,900</div>
                  <div class="small font-weight-bold">결제예정일</div>
                  <div class="small font-weight-bold">2022년 5월 15일</div>
                </div>
                <div class="col-auto">
                  <img src="./images/disneyplus.jpg" alt="디즈니 플러스 로고" width="100px">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Watcha card -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                    왓챠</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800 mb-1">₩7,900</div>
                  <div class="small font-weight-bold">결제예정일</div>
                  <div class="small font-weight-bold">2022년 5월 18일</div>
                </div>
                <div class="col-auto">
                  <img src="./images/watcha.png" alt="왓챠 로고" width="100px">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Tiving card -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                    티빙</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800 mb-1">₩7,900</div>
                  <div class="small font-weight-bold">결제예정일</div>
                  <div class="small font-weight-bold">2022년 6월 7일</div>
                </div>
                <div class="col-auto">
                  <img src="./images/tiving.png" alt="티빙 로고" width="100px">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Coupangplay card -->
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                    쿠팡플레이</div>
                  <div class="h5 mb-0 font-weight-bold text-gray-800 mb-1">₩4,900</div>
                  <div class="small font-weight-bold">결제예정일</div>
                  <div class="small font-weight-bold">2022년 6월 1일</div>
                </div>
                <div class="col-auto">
                  <img src="./images/coupangplay.png" alt="쿠팡 로고" height="100px">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Content Row -->

      <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
          <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">월별 결제액</h6>
              <div class="dropdown no-arrow">
                <a class="dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><!--id="dropdownMenuLink"-->
                  <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                     aria-labelledby="dropdownMenuLink">
                  <div class="dropdown-header">Dropdown Header:</div>
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </div>
            </div>
            <!-- Card Body -->
            <div class="card-body">
              <div class="chart-area">
                <canvas id="myAreaChart"></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
          <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">종류별 결제액</h6>
              <div class="dropdown no-arrow">
                <a class="dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><!--id="dropdownMenuLink"-->
                  <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                     aria-labelledby="dropdownMenuLink">
                  <div class="dropdown-header">Dropdown Header:</div>
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </div>
            </div>
            <!-- Card Body -->
            <div class="card-body">
              <div class="chart-pie pt-4 pb-2">
                <canvas id="myPieChart"></canvas>
              </div>
              <div class="mt-4 text-center small">
                <span class="mr-2">
                  <i class="fas fa-circle text-primary"></i> OTT
                </span>
                <span class="mr-2">
                  <i class="fas fa-circle text-success"></i> 쇼핑
                </span>
                <span class="mr-2">
                  <i class="fas fa-circle text-info"></i> 기타
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Content Row -->
      <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

          <!-- Project Card Example -->
          <div class="card shadow mb-2">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">각 서비스별 결제액</h6>
            </div>
            <div class="card-body">
              <h4 class="small font-weight-bold">넷플릭스 <span
                      class="float-right">₩9500</span></h4>
              <div class="progress mb-4">
                <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">디즈니 플러스 <span
                      class="float-right">₩9900</span></h4>
              <div class="progress mb-4">
                <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">왓챠 <span
                      class="float-right">₩7900</span></h4>
              <div class="progress mb-4">
                <div class="progress-bar" role="progressbar" style="width: 60%"
                     aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">티빙 <span
                      class="float-right">₩7900</span></h4>
              <div class="progress mb-4">
                <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                     aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <h4 class="small font-weight-bold">쿠팡플레이 <span
                      class="float-right">₩4900</span></h4>
              <div class="progress">
                <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                     aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
            </div>
          </div>

        </div>

        <div class="col-lg-6 mb-2">

          <!-- Illustrations -->
          <div class="card shadow mb-2">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">정밀한 분석</h6>
            </div>
            <div class="card-body">
              <div class="text-center">
                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 24rem;"
                     src="./startbootstrap-sb-admin-2-gh-pages/img/undraw_posting_photo.svg" alt="...">
              </div>
              <p>더 정밀한 분석을 원하신다면
                <a target="_blank" rel="nofollow" href="#">구독 관리 웹사이트</a>에 유료 결제를 해주세요!
              </p>
              <a target="_blank" rel="nofollow" href="#">구독 관리 웹사이트 유료 결제 하러 가기 &rarr;</a>
            </div>
          </div>

        </div>

        <div class="col-lg-12">

          <!-- Approach -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">안내</h6>
            </div>
            <div class="card-body">
              <p>저희 구독 관리 웹사이트는 회원분들의...</p>
              <p class="mb-0">실제 서비스가 아닌 캡스톤디자인 프로젝트입니다.</p>
            </div>
          </div>

        </div>
      </div>
    </div>
    <!-- /.container-fluid -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; webmaster 2022</span>
        </div>
      </div>
    </footer>
    <!-- End of Footer -->

    <!-- Bootstrap core JavaScript-->
    <script src="./startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="./startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="./startbootstrap-sb-admin-2-gh-pages/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="./startbootstrap-sb-admin-2-gh-pages/js/demo/chart-area-demo.js"></script>
    <script src="./startbootstrap-sb-admin-2-gh-pages/js/demo/chart-pie-demo.js"></script>

  </body>
</html>
<%--브랜치 확인용--%>