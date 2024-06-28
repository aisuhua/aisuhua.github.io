# nmcli

```sh
#  bond4
nmcli connection add type bond con-name bond0 ifname bond0 bond.options "mode=802.3ad"

# bond1
nmcli connection add con-name bond0 ifname bond0 type bond mode active-backup

# 7 种 bond 模式
# Requires static EtherChannel enabled, not Link Aggregation Control Protocol (LACP)-negotiated.
0 - balance-rr 
# No configuration required on the switch.
1 - active-backup 
# Requires static EtherChannel enabled, not LACP-negotiated.
2 - balance-xor
# Requires static EtherChannel enabled, not LACP-negotiated.
3 - broadcast
# Requires LACP-negotiated EtherChannel enabled.
4 - 802.3ad
# No configuration required on the switch.
5 - balance-tlb
# No configuration required on the switch.
6 - balance-alb
```

## links 

- [3.2. Upstream switch configuration depending on the bonding modes](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/configuring-network-bonding_configuring-and-managing-networking#understanding-the-default-behavior-of-controller-and-port-interfaces_configuring-network-bonding)
- [bond4 链路聚合](https://blog.csdn.net/node_One/article/details/115127771)
