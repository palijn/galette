{html_doctype xhtml=true type=strict omitxml=false encoding=UTF-8}
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$galette_lang}" lang="{$galette_lang}">
	<head>
		{include file='common_header.tpl'}
	</head>
	<body>
		<div id="main_logo">
			<img src="{$galette_base_path}picture.php?logo=true" width="{$logo->getOptimalWidth()}" height="{$logo->getOptimalHeight()}" alt="[ Galette ]" />
		</div>

		<form action="lostpasswd.php" method="post" enctype="multipart/form-data" id="login_frm">
			<div class="login-box">
				<h1 id="titre">{_T string="Password recovery"}</h1>
{if $error_detected|@count != 0}
				<div id="errorbox">
					<h1>{_T string="- ERROR -"}</h1>
					<ul>
{foreach from=$error_detected item=error}
						<li>{$error}</li>
{/foreach}
					</ul>
				</div>
{/if}
{if $warning_detected|@count != 0}
				<div id="warningbox">
					<h1>{_T string="- WARNING -"}</h1>
					<ul>
{foreach from=$warning_detected item=warning}
						<li>{$warning}</li>
{/foreach}
					</ul>
				</div>
{/if}
				<div>
					<label for="login" class="">{_T string="Username or email:"}</label>
					<input type="text" name="login" id="login" maxlength="50" />
					<input type="submit" class="submit" name="lostpasswd" value="{_T string="Send me my password"}" />
					<input type="hidden" name="valid" value="1"/>
					<ul class="menu">
						<li id="subscribe"><a href="self_adherent.php">{_T string="Subscribe"}</a></li>
						<li id="backhome"><a href="index.php">{_T string="Back to login page"}</a></li>
					</ul>
				</div>
			</div>
		</form>
		<div id="copyright">
			<a href="http://galette.tuxfamily.org/">Galette {$GALETTE_VERSION}</a>
		</div>
	</body>
</html>
