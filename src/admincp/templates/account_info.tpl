{include file="pageheader.tpl"}

<div class="main-div">
<form method="post" action="account_log.php" name="theForm" onsubmit="return validate()">
<table cellspacing="1" cellpadding="3" width="100%">
  <tr>
    <td class="label">{$lang.label_user_name}</td>
    <td>{$user.user_name}</td>
  </tr>
  <tr>
    <td class="label">{$lang.label_change_desc}</td>
    <td><textarea class="textCtrl"  name="change_desc" cols="60" rows="4"></textarea></td>
  </tr>
  <tr>
    <td class="label">{$lang.label_user_money}</td>
    <td><select class="textCtrl"  name="add_sub_user_money" id="add_sub_user_money">
      <option value="1" selected="selected">{$lang.add}</option>
      <option value="-1">{$lang.subtract}</option>
    </select>
    <input name="user_money" type="text" id="user_money" style="text-align:right" value="0" size="10" />
    {$lang.current_value}{$user.formated_user_money}</td>
  </tr>

  <tr>
    <td class="label">{$lang.label_pay_point}</td>
    <td><select class="textCtrl"  name="add_sub_pay_point" id="add_sub_pay_point">
      <option value="1" selected="selected">{$lang.add}</option>
      <option value="-1">{$lang.subtract}</option>
    </select>
      <input name="pay_point" type="text" id="pay_point" style="text-align:right" value="0" size="10" />
      {$lang.current_value}{$user.pay_point}</td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" class="button primary submitButton"  value="{$lang.button_submit}" />
      <input type="reset" class="button submitButton"   value="{$lang.button_reset}" />
      <input type="hidden" name="act" value="insert" />
      <input type="hidden" name="user_id" value="{$user.user_id}" />
  </tr>
</table>
</form>
</div>
{insert_scripts files="skyuc_validator.js"}
{literal}
<script language="JavaScript">
<!--
/**
 * 检查表单输入的数据
 */
function validate()
{
    validator = new Validator("theForm");
    validator.required("change_desc",  no_change_desc);
	validator.isNumber("user_money", user_money_not_number);
	validator.isInt("pay_point", pay_point_not_int);
    return validator.passed();
}

//-->
</script>
{/literal}
{include file="pagefooter.tpl"}