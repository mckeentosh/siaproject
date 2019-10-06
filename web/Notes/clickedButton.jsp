<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>
    <body>
        <p class="button">Button 0</p>
        <p class="button">Button 1</p>
        <p class="button">Button 2</p>
        <script>
            var buttons = document.getElementsByClassName('button');
            for (var i=0 ; i < buttons.length ; i++){
              (function(index){
                buttons[index].onclick = function(){
                  alert("I am button " + index);
                };
              })(i)
            }
        </script>
    </body>
</html>