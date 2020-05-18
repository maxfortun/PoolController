#!/bin/bash

echo 'Content-type: text/html'
echo

SWD=$(dirname $(readlink -f $0))

pumpStatus=$($SWD/pump/status.sh)
pumpAction=$($SWD/pump/actions.sh "$pumpStatus")

drainStatus=$($SWD/drain/status.sh)
drainAction=$($SWD/drain/actions.sh "$drainStatus")

solarStatus=$($SWD/solar_heater/status.sh)
solarAction=$($SWD/solar_heater/actions.sh "$solarStatus")

fillStatus=$($SWD/fill/status.sh)
fillAction=$($SWD/fill/actions.sh "$fillStatus")

OFS=$IFS IFS="&" PARAMS=($QUERY_STRING) IFS=$OFS
for PARAM in $PARAMS; do
	OFS=$IFS IFS== PARAM=($PARAM) IFS=$OFS
	export QUERY_${PARAM[0]}=${PARAM[1]}
done

cat <<_EOT_
<html>
	<head>
		<title>Pool Control</title>
	</head>
	<body>
		<center>
		<h1>Pool Controller</h1>
_EOT_

action="$SWD/$QUERY_action.sh"
if [ -x "$action" ]; then
cat <<_EOT_
			<h2>Executing $QUERY_action - please wait.</h2>
			<script>
				location.href = location.href.replace(/\?.*$/g,"");
			</script>
_EOT_
	$action >/dev/null 2>/dev/null &
fi

cat <<_EOT_
		<table>
			<tr>
				<th></th>
				<td>Status</td>
				<td>Actions</td>
			</tr>



			<tr>
				<th>Pump</th>
				<td>$pumpStatus</td>
_EOT_

for action in $pumpAction; do
	echo "			<td><a href="?action=pump/$action">$action</a></td>"
done

cat <<_EOT_
			</tr>



			<tr>
				<th>Drain</th>
				<td>$drainStatus</td>
_EOT_

for action in $drainAction; do
	echo "			<td><a href="?action=drain/$action">$action</a></td>"
done

cat <<_EOT_
			</tr>

			<tr>
				<th>Solar heater</th>
				<td>$solarStatus</td>
_EOT_

for action in $solarAction; do
	echo "			<td><a href="?action=solar_heater/$action">$action</a></td>"
done

cat <<_EOT_
			</tr>

			<tr>
				<th>Fill</th>
				<td>$fillStatus</td>
_EOT_

for action in $fillAction; do
	echo "			<td><a href="?action=fill/$action">$action</a></td>"
done

cat <<_EOT_
			</tr>



		</table>
		</center>
	</body>
</html>
_EOT_
