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
fillDescription=$($SWD/fill/description.sh "$fillStatus" | sed -z 's#\n#<br/>#g')

OFS=$IFS IFS="&" PARAMS=($QUERY_STRING) IFS=$OFS
for PARAM in $PARAMS; do
	OFS=$IFS IFS== PARAM=($PARAM) IFS=$OFS
	export QUERY_${PARAM[0]}=${PARAM[1]}
done

cat <<_EOT_
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<script>
			window.addEventListener('load', (e) => {
				window.isRefreshed = true;
				console.log("load", window.isRefreshed);
			});

			window.addEventListener('pageshow', (e) => {
				console.log("pageshow", window.isRefreshed);
				if(!window.isRefreshed) {
					//window.location.reload();
				}
			});

			window.addEventListener('pagehide', (e) => {
				window.isRefreshed = false;
				console.log("pagehide", window.isRefreshed);
			});

			window.addEventListener('blur', (e) => {
				window.isRefreshed = false;
				console.log("blur", window.isRefreshed);
			});

		</script>
		<title>Pool Control</title>
	</head>
	<body>
		<center>
		<h1>Pool Controller</h1>
_EOT_

action="$SWD/$QUERY_action.sh"
if [ -x "$action" ]; then
cat <<_EOT_
			<h2>Executing $action - please wait.</h2>
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
				<th>Status</th>
				<th>Actions</th>
				<th>Description</th>
			</tr>



			<tr>
				<th>Pump</th>
				<td>$pumpStatus</td>
				<td>
_EOT_

for action in $pumpAction; do
	echo "			<a href="?action=pump/$action">$action</a>"
done

cat <<_EOT_
				</td>
			</tr>



			<tr>
				<th>Drain</th>
				<td>$drainStatus</td>
				<td>
_EOT_

for action in $drainAction; do
	echo "			<a href="?action=drain/$action">$action</a>"
done

cat <<_EOT_
				</td>
			</tr>

			<tr>
				<th>Solar heater</th>
				<td>$solarStatus</td>
				<td>
_EOT_

for action in $solarAction; do
	echo "			<a href="?action=solar_heater/$action">$action</a>"
done

cat <<_EOT_
				</td>
			</tr>

			<tr>
				<th>Fill</th>
				<td>$fillStatus</td>
				<td>
_EOT_

for action in $fillAction; do
	echo "			<a href="?action=fill/$action">$action</a>"
done

cat <<_EOT_
				</td>
				<td>$fillDescription</td>
			</tr>



		</table>
		</center>
	</body>
</html>
_EOT_
