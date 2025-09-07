<!DOCTYPE html>
<html>
<head>
  <base href="$FLUTTER_BASE_HREF">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="A new Flutter project.">

  <!-- iOS meta tags & icons -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="app">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="favicon.png"/>

  <title>app</title>
  <link rel="manifest" href="manifest.json">

  <style>
    .loader-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background: #f2f2f2; /* surfaceColor from your theme */
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 9999;
    }

    .loader-icon {
      width: 80px;
      height: 80px;
      border-radius: 10%; /* Slight rounding for a clean look */
      margin-bottom: 20px;
    }

    .progress-container {
      width: 200px;
      height: 6px;
      background: rgba(76, 217, 100, 0.2); /* Lighter kGreenColor */
      border-radius: 3px;
      overflow: hidden;
    }

    .progress-bar {
      width: 50px;
      height: 100%;
      background: rgb(76, 217, 100); /* kGreenColor */
      animation: slide 1.5s ease-in-out infinite;
    }

    @keyframes slide {
      0% { transform: translateX(0); }
      50% { transform: translateX(150px); }
      100% { transform: translateX(0); }
    }

    .hidden {
      display: none;
    }
  </style>
</head>
<body>
  <div id="loader" class="loader-container">
    <img src="https://www.pngall.com/wp-content/uploads/12/App-Logo-PNG-Image.png" alt="App Icon" class="loader-icon">
    <div class="progress-container">
      <div class="progress-bar"></div>
    </div>
  </div>

  <script>
    window.addEventListener('load', function() {
      if (window.flutterCanvasKit || window.FlutterWebRenderer) {
        document.getElementById('loader').classList.add('hidden');
      } else {
        setTimeout(() => {
          document.getElementById('loader').classList.add('hidden');
        }, 4000);
      }
    });
  </script>
  <script src="flutter_bootstrap.js" async></script>
</body>
</html>