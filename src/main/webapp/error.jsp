x`<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script src="/js/jquery.min.js"></script>
<script>
    $(function(){
        location.href="/seckill/toSeckillList";
        $.ajax({
            url:'../seckill/updateOrderStatus',
            type:'post',
            dataType:'json',
            data:{},
            success:function(){
                location.href="../webapp/hjw/indexshou.jsp";
            }
        })
    })
</script>
</body>
</html>