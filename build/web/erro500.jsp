<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro 500</title>
        <style>
            body{
                background: black;
            }
            
            h1{
                color: orange;
                font-size:32px;
            }
            
            .content{
                display:flex;
                justify-content:center;
                align-items:center;
                width:100%;
                flex-direction: column;
            }
            
            .button {
    background-color: orange; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}

.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}
        </style>
          
    </head>
    <body>
        
        <div class="content"> 
            <h1>Erro 500 encontrado, problema interno do servidor!</h1>
            <button class="button button1">Recarregue a página</button>
        </div>
    </body>
</html>
