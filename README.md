# PoolController

# Valves
Jandy 4724 2-Port 1-1/2 to 2-Inch Positive Seal NeverLube Valve  
https://www.amazon.com/gp/product/B002SG7NRM  

Jandy 4715 3-Port 1-1/2 to 2-Inch Positive Seal NeverLube Valve  
https://www.amazon.com/gp/product/B002SG7NRC  

Intermatic PE24VA Valve Actuator  
https://www.amazon.com/gp/product/B002ZPJVV2  


# Display Driver
https://github.com/UCTRONICS/UCTRONICS_LCD35_HDMI_RPI.git

# Crontab
```
0 8 * * * /home/pi/apps/PoolController/bin/pump/on.sh
0 10 * * * /home/pi/apps/PoolController/bin/solar_heater/on.sh auto
0 18 * * * /home/pi/apps/PoolController/bin/solar_heater/off.sh auto
0 20 * * * /home/pi/apps/PoolController/bin/pump/off.sh
```
