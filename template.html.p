<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <base href="◊(select-from-metas "rel-path" metas)"</base>
    <title>◊(select-from-metas "title" metas)</title>
    <meta name="description" content="The Pyret programming language">
    <meta name="author"      content="The Pyret Crew">
    <meta property="og:author" content="The Pyret Crew">
    <meta property="og:image" content="http://www.pyret.org/img/pyret-logo.png">
    <meta property="og:image:secure_url" content="https://www.pyret.org/img/pyret-logo.png">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="444">
    <meta property="og:image:height" content="445">
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@|"@"|pyretlang" />
    <meta name="twitter:title" content="◊(select-from-metas "title" metas)" />
    <meta name="twitter:image" content="https://www.pyret.org/img/pyret-logo.png" />
    <meta name="viewport"    content="width=device-width, initial-scale=1.0">
    <link rel="icon"      href="./site/img/pyret-icon.png">
    <link rel="canonical" href="@|full-uri|">
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/font-hack/2.019/css/hack.min.css">
    <link rel="stylesheet" type="text/css" href="./bootstrap-css/bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/pygments.css">
    <link rel="stylesheet" type="text/css" href="./css/codemirror.css">
    <link rel="stylesheet" type="text/css" href="./css/scribble.css">
    <link rel="stylesheet" type="text/css" href="./css/custom.css">
    <script src="./bootstrap-css/bootstrap-5.0.2-dist/js/bootstrap.min.js">
    <script type="module" src="./node_modules/pyret-embed/dist/pyret.js"></script>
  </head>
  <body>
    <header class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
      <div class="container">
        <a href="./index.html" class="navbar-brand">
          <img class="navbar-logo" src="./site/img/pyret-banner.png"></img>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse"
             role="navigation"
             id="navbarSupportedContent">
          <ul class="navbar-nav me-auto">
            <li class="nav-item"><a class="nav-link fancyhover-above" href="/docs/latest/">Documentation</a></li>
            <li class="nav-item"><a class="nav-link fancyhover-above" href="https://github.com/brownplt/pyret-lang">Code</a></li>
            <li class="nav-item"><a class="nav-link fancyhover-above" href="./pyret-code/">Why Pyret?</a></li>
          </ul>
        </div>
    </header>
    ◊(->html (body doc))
  </body>
</html>

