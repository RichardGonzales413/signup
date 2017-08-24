<!DOCTYPE html>
<html>
<head>

</head>
<body>

<div class="screenlet-body">

    <form name="createListing" method="post" action="createProduct">
	<input type="hidden" name="internalName" value="testproduct"/>
	<div>
		Input Product Id:
		<input type="text" name="productId" id="idvalue" value=""/>
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

<script>
now = new Date();
randomNum = '';
randomNum += Math.round(Math.random()*9);
randomNum += Math.round(Math.random()*9);
randomNum += now.getTime();
document.getElementById("idvalue").value = randomNumber(15);
</script>
</body>

</html>
