# https://gist.github.com/teppeis/ea73d55ed288ff72cc5c2acf6b9d9ff9
function connect-airpods --description "Connect to AirPods"
    if test -z "$AIR_PODS_ADDRESS"; or test -z "$AIR_PODS_NAME"
        /usr/local/bin/bluetoothconnector
        echo ""
        read -P "Enter AirPods address: " TMP_AIR_PODS_ADDRESS
        read -P "Enter AirPods name: " TMP_AIR_PODS_NAME

        set -U AIR_PODS_ADDRESS $TMP_AIR_PODS_ADDRESS
        set -U AIR_PODS_NAME $TMP_AIR_PODS_NAME
    end

    for i in (seq 1 10)
        /usr/local/bin/bluetoothconnector -c $AIR_PODS_ADDRESS

        if test "Connected" = (/usr/local/bin/bluetoothconnector -s $AIR_PODS_ADDRESS)
            # sleep 0.5
            if /usr/local/bin/SwitchAudioSource -s "$AIR_PODS_NAME" > /dev/null ^&1
                if test "$i" != "1"
                    echo ""
                end
                echo "Connected!"
                sleep 0.5
                afplay /System/Library/Sounds/Hero.aiff 
                say -v samantha Connected
                break
            end
        else
            if test "$i" = "1"
                echo -n "Connecting..."
            else
                echo -n "."
            end

            if test "$i" = "10"
                echo ""
                echo "Could not connect to AirPods!"
            end
        end

        sleep 1
    end
end
