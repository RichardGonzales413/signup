<html>
<head>
<script>
now = new Date();
randomNum = '';
randomNum += Math.round(Math.random()*9);
randomNum += Math.round(Math.random()*9);
randomNum += now.getTime();
</script>
</head>
<body>


<script>
document.getElementById("productId").value = randomNumber(15);
</script>

<div class="screenlet-body">

    <form name="createListing" method="post" action="createProduct">
	productId = <script>document.write(randomNum)</script>
	<input type="hidden" name="internalName" value="testproduct"/>
	<div>
		Input Product Id:
		<input type="text" name="productId" class="required"/>
	</div>
	<div>
		Name: 
		<input type="text" name="productName" class="required"/>
	</div>
	<div>
		Height: 
		<input type="text" name="productHeight"/>
	</div>
	<div>
		Weight: 
		<input type="text" name="productWeight"/>
	</div>
	<div>
		Description: 
		<input type="text" name="longDescription"/>
	</div>
	<div>
		<input type="submit" value="Create Product"/>
	</div>
    </form>

</div>


</body>

</html>
