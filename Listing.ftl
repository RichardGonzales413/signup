<div class="screenlet-body">
  <form id="createListingEvent" method="post" action="<@ofbizUrl>createListingEvent</@ofbizUrl>">
    <input type="hidden" name="addListingFromFtl" value="Y"/>
    <fieldset>
      <div>
        <span class="label">${uiLabelMap.ProductInternalName}</span>
        <input type="text" name="Internal Name" id="internalName" class='required' maxlength="20" />*
      </div>
      <div>
        <span class="label">${uiLabelMap.ProductComment}</span>
        <input type="text" name="Comments" id="comments" class='inputBox' size="60" maxlength="255" />
      </div>
    </fieldset>
    <input type="submit" value="Create Product" />
  </form>
</div>

