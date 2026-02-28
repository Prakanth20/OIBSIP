# Basic Firewall Configuration with UFW

## Objective

To configure a basic firewall on Ubuntu using UFW to allow SSH access and block HTTP traffic.

## Tools Used

* UFW (Uncomplicated Firewall)
* Ubuntu Linux

## Configuration Steps

1. Installed UFW
2. Set default policy:

   * Deny incoming traffic
   * Allow outgoing traffic
3. Allowed SSH (Port 22)
4. Denied HTTP (Port 80)
5. Enabled firewall

## Commands Used

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw deny 80/tcp
sudo ufw enable
sudo ufw status verbose
```

## Firewall Rules Summary

| Port | Protocol | Action | Purpose           |
| ---- | -------- | ------ | ----------------- |
| 22   | TCP      | ALLOW  | Remote SSH access |
| 80   | TCP      | DENY   | Block web traffic |

## Security Significance

* Prevents unauthorized inbound access
* Ensures secure remote administration via SSH
* Reduces attack surface by blocking HTTP traffic

## Conclusion

UFW was successfully configured to enforce secure firewall rules. The system now only allows SSH access while blocking HTTP traffic.

---
