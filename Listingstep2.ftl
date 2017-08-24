<!DOCTYPE html>
<html>
<head>
<script>



</script>
</head>
<body>



<div class="screenlet-body">

	<form name="addToCategory" method="post" action="addProductToCategory">
	<div>
		<select name="productCategoryId">
			<option value="model">Model</option>
			<option value="photographer">Photographer</option>
		</select>
	</div>
	<div>
		Comments: 
		<input type="text" name="comments"/>
	</div>
	<div>
		<input type="submit" value="Add to Category"/>
	</div>
	<div>
		ProductId:
		<input type="text" name="productId" id="productId"/>
	</div>
	</form>
</div>



</body>

</html>
