
<style>

#triggers img {
    border:0;
    cursor:pointer;
    margin-left:11px;
}
</style>

<table id="items">
    <thead>
        <tr>
            <th></th><th>Enabled</th><th>Name</th><th>Source</th><th>Src service</th>
            <th>Destination</th><th>Dst service</th><th>Action</th><th>Log</th><th>Description</th>
        </tr>
    </thead>
    % for rid, rule in rules:
    <tr id="{{rid}}">
        <td class="hea">
            <img src="/static/new_above.png" title="New rule above">
            <img src="/static/new_below.png" title="New rule below">
            <img src="/static/move_up.png" title="Move rule up" class="moveup">
            <img src="/static/move_down.png" title="Move rule down" class="movedown">
            <img src="/static/disable.png" title="Disable rule">
            <img src="/static/delete.png" title="Delete rule" class="delete">
        </td>
        % for item in rule:
        <td>{{item}}</td>
        % end
    </tr>
    % end
</table>


<script>
$("table#items tr td img[title]").tooltip({
    tip: '.tooltip',
    effect: 'fade',
    fadeOutSpeed: 100,
    predelay: 800,
    position: "bottom right",
    offset: [15, 15]
});

$("table#items tr td img").fadeTo("fast", 0.6);

$("table#items tr td img").hover(function() {
  $(this).fadeTo("fast", 1);
}, function() {
  $(this).fadeTo("fast", 0.6);
});

$(function() {
    $('img.delete').click(function() {
        td = this.parentElement.parentElement;
        name = td.children[1].innerText;
        $('.tooltip').hide();
        $.post("ruleset", { action: 'delete', name: name, rid: td.id},
            function(data){
                $('div.css-panes div').load('/ruleset');
            });
    });
    $('img.moveup').click(function() {
        td = this.parentElement.parentElement;
        name = td.children[1].innerText;
        $('.tooltip').hide();
        $.post("ruleset", { action: 'moveup', name: name, rid: td.id},
            function(data){
                $('div.css-panes div').load('/ruleset');
            });
    });
    $('img.movedown').click(function() {
        td = this.parentElement.parentElement;
        name = td.children[1].innerText;
        $('.tooltip').hide();
        $.post("ruleset", { action: 'movedown', name: name, rid: td.id},
            function(data){
                $('div.css-panes div').load('/ruleset');
            });
    });
});

</script>

