<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#if getUsername>
<script type="text/javascript">
  //<![CDATA[
  lastFocusedName = null;
  function setLastFocused(formElement) {
    lastFocusedName = formElement.name;
    document.write.lastFocusedName;
  }
  function clickUsername() {
    if (document.getElementById('UNUSEEMAIL').checked) {
      if (lastFocusedName == "UNUSEEMAIL") {
        jQuery('#PASSWORD').focus();
      } else if (lastFocusedName == "PASSWORD") {
        jQuery('#UNUSEEMAIL').focus();
      } else {
        jQuery('#PASSWORD').focus();
      }
    }
  }
  function changeEmail() {
    if (document.getElementById('UNUSEEMAIL').checked) {
      document.getElementById('USERNAME').value = jQuery('#CUSTOMER_EMAIL').val();
    }
  }
  function setEmailUsername() {
    if (document.getElementById('UNUSEEMAIL').checked) {
      document.getElementById('USERNAME').value = jQuery('#CUSTOMER_EMAIL').val();
      // don't disable, make the browser not submit the field: document.getElementById('USERNAME').disabled=true;
    } else {
      document.getElementById('USERNAME').value = '';
      // document.getElementById('USERNAME').disabled=false;
    }
  }
  function hideShowUsaStates() {
    var customerStateElement = document.getElementById('newuserform_stateProvinceGeoId');
    var customerCountryElement = document.getElementById('newuserform_countryGeoId');
    if (customerCountryElement.value == "USA" || customerCountryElement.value == "UMI") {
      customerStateElement.style.display = "block";
    } else {
      customerStateElement.style.display = "none";
    }
  }
  //]]>
</script>
</#if>

<#------------------------------------------------------------------------------
NOTE: all page headings should start with an h2 tag, not an H1 tag, as 
there should generally always only be one h1 tag on the page and that 
will generally always be reserved for the logo at the top of the page.
------------------------------------------------------------------------------->

<h2>${uiLabelMap.PartyRequestNewAccount}
  <span>
    ${uiLabelMap.PartyAlreadyHaveAccount}, <a
        href='<@ofbizUrl>checkLogin/main</@ofbizUrl>'>${uiLabelMap.CommonLoginHere}</a>
  </span>
</h2>

<#macro fieldErrors fieldName>
  <#if errorMessageList?has_content>
    <#assign fieldMessages =
        Static["org.apache.ofbiz.base.util.MessageString"].getMessagesForField(fieldName, true, errorMessageList)>
  <ul>
    <#list fieldMessages as errorMsg>
      <li class="errorMessage">${errorMsg}</li>
    </#list>
  </ul>
  </#if>
</#macro>
<#macro fieldErrorsMulti fieldName1 fieldName2 fieldName3 fieldName4>
  <#if errorMessageList?has_content>
    <#assign fieldMessages =
        Static["org.apache.ofbiz.base.util.MessageString"].getMessagesForField(fieldName1, fieldName2,
        fieldName3, fieldName4, true, errorMessageList)>
  <ul>
    <#list fieldMessages as errorMsg>
      <li class="errorMessage">${errorMsg}</li>
    </#list>
  </ul>
  </#if>
</#macro>

&nbsp;<a href="<@ofbizUrl>${donePage}</@ofbizUrl>" class="button">${uiLabelMap.CommonCancel}</a>
&nbsp;<a href="javascript:document.getElementById('newuserform').submit()" class="button">${uiLabelMap.CommonSave}</a>

<form method="post" action="<@ofbizUrl>createcustomer${previousParams}</@ofbizUrl>" id="newuserform" name="newuserform">


<#----------------------------------------------------------------------
If you need to include a brief explanation of the form, or certain
elements in the form (such as explaining asterisks denote REQUIRED),
then you should use a <p></p> tag with a class name of "desc"
----------------------------------------------------------------------->

  <p class="desc">${uiLabelMap.CommonFieldsMarkedAreRequired}</p>

<#----------------------------------------------------------------------
There are two types of fieldsets, regular (full width) fielsets, and
column (half width) fieldsets. If you want to group two sets of inputs
side by side in two columns, give each fieldset a class name of "col"
----------------------------------------------------------------------->

  <fieldset class="col">
    <input type="hidden" name="emailProductStoreId" value="${productStoreId}"/>
  <#----------------------------------------------------------------------
  Each input row should be enclosed in a <div></div>.
  This will ensure than each input field clears the one
  above it. Alternately, if you want several inputs to float next to
  each other, you can enclose them in a table as illustrated below for
  the phone numbers, or you can enclose each label/input pair in a span

  Example:
  <div>
    <span>
      <input type="text" name="expMonth" value=""/>
      <label for="expMonth">Exp. Month</label>
    </span>
    <span>
      <input type="text" name="expYear" value=""/>
      <label for="expYear">Exp. Year</label>
    </span>
  </div>
  ----------------------------------------------------------------------->

    <div>
      <label for="USER_FIRST_NAME">${uiLabelMap.PartyFirstName}*</label>
    <@fieldErrors fieldName="USER_FIRST_NAME"/>
      <input type="text" name="USER_FIRST_NAME" id="USER_FIRST_NAME" value="${requestParameters.USER_FIRST_NAME!}"/>
    </div>

    <div>
      <label for="USER_LAST_NAME">${uiLabelMap.PartyLastName}*</label>
    <@fieldErrors fieldName="USER_LAST_NAME"/>
      <input type="text" name="USER_LAST_NAME" id="USER_LAST_NAME" value="${requestParameters.USER_LAST_NAME!}"/>
    </div>

  </fieldset>

  <fieldset>
    <table
        summary="Tabular form for entering multiple telecom numbers for different purposes.
        Each row allows user to enter telecom number for a purpose">
      <thead>
        <tr>
          <th></th>
          <th scope="col">${uiLabelMap.PartyAreaCode}</th>
          <th scope="col">${uiLabelMap.PartyContactNumber}</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">${uiLabelMap.PartyMobilePhone}</th>
          <td>
            <input type="text" name="CUSTOMER_MOBILE_AREA" size="5" value="${requestParameters.CUSTOMER_MOBILE_AREA!}"/>
          </td>
          <td>
            <input type="text" name="CUSTOMER_MOBILE_CONTACT" value="${requestParameters.CUSTOMER_MOBILE_CONTACT!}"/>
          </td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </fieldset>

  <fieldset class="col">
    <legend>${uiLabelMap.PartyEmailAddress}</legend>
    <div>
      <label for="CUSTOMER_EMAIL">${uiLabelMap.PartyEmailAddress}*</label>
      <@fieldErrors fieldName="CUSTOMER_EMAIL"/>
      <input type="text" name="CUSTOMER_EMAIL" id="CUSTOMER_EMAIL" value="${requestParameters.CUSTOMER_EMAIL!}"
          onchange="changeEmail()" onkeyup="changeEmail()"/>
    </div>
  </fieldset>

  <!--fieldset class="col">
    <legend><#if getUsername>${uiLabelMap.CommonUsername}</#if></legend>
    <#if getUsername>
      <@fieldErrors fieldName="USERNAME"/>
      <#if !requestParameters.preferredUsername?has_content>
        <div class="form-row inline">
          <label for="UNUSEEMAIL">
            <input type="checkbox" class="checkbox" name="UNUSEEMAIL" id="UNUSEEMAIL" value="on"
                onclick="setEmailUsername();" onfocus="setLastFocused(this);"/> ${uiLabelMap.EcommerceUseEmailAddress}
          </label>
        </div>
      </#if>

      <div>
        <label for="USERNAME">${uiLabelMap.CommonUsername}*</label>
        <#if requestParameters.preferredUsername?has_content>
          <input type="text" name="showUserName" id="showUserName" value="${requestParameters.USERNAME!}"
              disabled="disabled"/>
          <input type="hidden" name="USERNAME" id="USERNAME" value="${requestParameters.USERNAME!}"/>
        <#else>
          <input type="text" name="USERNAME" id="USERNAME" value="${requestParameters.USERNAME!}"
              onfocus="clickUsername();" onchange="changeEmail();"/>
        </#if>
      </div>
    </#if>
  </fieldset-->

  <fieldset class="col">
    <legend>${uiLabelMap.CommonPassword}</legend>
    <#if createAllowPassword>
      <div>
        <label for="PASSWORD">${uiLabelMap.CommonPassword}*</label>
        <@fieldErrors fieldName="PASSWORD"/>
        <input type="password" name="PASSWORD" id="PASSWORD" onfocus="setLastFocused(this);"/>
      </div>

      <div>
        <label for="CONFIRM_PASSWORD">${uiLabelMap.PartyRepeatPassword}*</label>
        <@fieldErrors fieldName="CONFIRM_PASSWORD"/>
        <input type="password" class='inputBox' name="CONFIRM_PASSWORD" id="CONFIRM_PASSWORD" value="" maxlength="50"/>
      </div>

      <!--div>
        <label for="PASSWORD_HINT">${uiLabelMap.PartyPasswordHint}</label>
        <@fieldErrors fieldName="PASSWORD_HINT"/>
        <input type="text" class='inputBox' name="PASSWORD_HINT" id="PASSWORD_HINT"
            value="${requestParameters.PASSWORD_HINT!}" maxlength="100"/>
      </div-->
    <#else>
      <div>
        <label>${uiLabelMap.PartyReceivePasswordByEmail}.</div>
      </div>
    </#if>
  </fieldset>
</form>

<#------------------------------------------------------------------------------
To create a consistent look and feel for all buttons, input[type=submit], 
and a tags acting as submit buttons, all button actions should have a 
class name of "button". No other class names should be used to style 
button actions.
------------------------------------------------------------------------------->
<div class="buttons">&nbsp;
  <a href="<@ofbizUrl>${donePage}</@ofbizUrl>" class="button">${uiLabelMap.CommonCancel}</a>&nbsp;
  <a href="javascript:document.getElementById('newuserform').submit()" class="button">${uiLabelMap.CommonSave}</a>
</div>

<script type="text/javascript">
  //<![CDATA[
  hideShowUsaStates();
  //]]>
</script>
