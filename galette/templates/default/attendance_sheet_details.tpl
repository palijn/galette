{if $ajax}
    {assign var="extend" value='ajax.tpl'}
{else}
    {assign var="extend" value='page.tpl'}
{/if}
{extends file=$extend}
{block name="content"}
    <form action="{path_for name="attendance_sheet"}" id="sheet_details_form" method="POST">
        <fieldset class="cssform">
            <legend class="ui-state-active ui-corner-top">{_T string="Some details about your attendance sheet..."} - <span>{_T string="%s attendees" pattern="/%s/" replace=$selection|@count}</span></legend>
            <p>
                <label for="sheet_type" class="bline">{_T string="Sheet type"}</label>
                <input type="text" name="sheet_type" id="sheet_type" value="{_T string="Attendance sheet"}" required/>
            </p>
            <p>
                <label for="sheet_title" class="bline">{_T string="Title"}</label>
                <input type="text" name="sheet_title" id="sheet_title"/>
            </p>
            <p>
                <label for="sheet_sub_title" class="bline">{_T string="Subtitle"}</label>
                <input type="text" name="sheet_sub_title" id="sheet_sub_title"/>
            </p>
            <p>
                <label for="sheet_date" class="bline">{_T string="Date"}</label>
                <input type="text" name="sheet_date" id="sheet_date"/>
                <span class="exemple">{_T string="(yyyy-mm-dd format)"}</span>
            </p>
            <p>
                <label for="sheet_photos" class="bline">{_T string="With photos?"}</label>
                <input type="checkbox" name="sheet_photos" id="sheet_photos" value="1"/>
{foreach $selection as $member}
                <input type="hidden" name="selection[]" value="{$member}"/>
{/foreach}
            </p>
        </fieldset>
{if not $ajax}
        <div class="button-container">
            <input class="button btn_pdf" type="submit" value="{_T string="Generate"}"/>
        </div>
{/if}

    </form>
{/block}
