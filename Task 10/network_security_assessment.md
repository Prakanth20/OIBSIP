# Network Security Assessment Report
## Target: Metasploitable 2 Virtual Machine

---

## 1️⃣ Executive Summary

A network security assessment was conducted on a deliberately vulnerable virtual machine, **Metasploitable 2**, to identify security weaknesses and analyze potential risks. The assessment utilized:

- Nmap for port scanning and service detection
- Wireshark for network traffic analysis

The findings reveal multiple critical vulnerabilities, including backdoored services, unencrypted communication protocols, weak credentials, and outdated software components.

Overall Risk Level: 🔴 **Critical**

---

## 2️⃣ Scope of Assessment

- **Target System:** Metasploitable 2
- **IP Address:** 192.168.56.101 (example)
- **Tools Used:**
  - Nmap
  - Wireshark
- **Assessment Type:** Internal Lab-Based Network Security Evaluation
- **Date Conducted:** [Insert Date]

---

## 3️⃣ Methodology

### 3.1 Network Scanning

The following Nmap command was used:

```bash
nmap -sS -sV -O -A 192.168.56.101 -oN nmap_results.txt
````

This enabled:

* SYN scan
* Service version detection
* OS detection
* Aggressive enumeration

---

### 3.2 Traffic Analysis

Network traffic was captured using Wireshark while:

* Running Nmap scans
* Accessing web services
* Connecting via Telnet and FTP

Packet analysis identified plaintext credential transmission and service banner exposure.

---

# 4️⃣ Identified Vulnerabilities

---

# 🔴 Critical Risks

---

## 4.1 Telnet Service (Port 23)

**Severity:** Critical
**Risk Type:** Unencrypted Remote Access

### Description

Telnet transmits usernames and passwords in plaintext, making it highly insecure.

### Impact Analysis

* Credential interception
* Unauthorized remote access
* Privilege escalation
* Lateral movement within network

### Mitigation

* Disable Telnet service
* Replace with SSH
* Enforce encrypted communication protocols

---

## 4.2 VSFTPD 2.3.4 Backdoor (Port 21)

**Severity:** Critical
**CVE Reference:** CVE-2011-2523

### Description

VSFTPD version 2.3.4 contains a malicious backdoor that allows remote command execution when a crafted username is used.

### Impact Analysis

* Remote shell access
* Full system compromise
* Data exfiltration
* Network pivoting

### Mitigation

* Upgrade FTP server immediately
* Remove vulnerable version
* Restrict FTP access
* Use SFTP instead

---

## 4.3 SMB Vulnerabilities (Port 445)

**Severity:** Critical

### Description

The SMB service is outdated and vulnerable to multiple remote exploits.

### Impact Analysis

* Remote code execution
* File system access
* Ransomware infection risk
* Lateral network spread

### Mitigation

* Disable SMBv1
* Patch Samba services
* Restrict port 445 access via firewall

---

## 4.4 Outdated Apache Web Server (Port 80)

**Severity:** Critical

### Description

The Apache version running is outdated and vulnerable to known exploits.

### Impact Analysis

* Web application exploitation
* Information disclosure
* Remote code execution
* Website defacement

### Mitigation

* Upgrade Apache to latest stable version
* Implement Web Application Firewall (WAF)
* Apply security hardening configurations

---

## 4.5 Weak MySQL Credentials (Port 3306)

**Severity:** Critical

### Description

MySQL database service allows weak or default credentials.

### Impact Analysis

* Unauthorized database access
* Data theft
* Data manipulation
* Privilege escalation

### Mitigation

* Enforce strong password policies
* Restrict remote database access
* Disable root remote login

---

# 🟠 High Risks

---

## 4.6 FTP Anonymous Login Enabled

**Severity:** High

### Impact

* Unauthorized file access
* Information disclosure

### Mitigation

* Disable anonymous login
* Restrict FTP to authenticated users

---

## 4.7 Exposed Database Ports

**Severity:** High

### Impact

* Direct remote database exploitation
* Credential brute force

### Mitigation

* Block external database access
* Implement firewall rules
* Use network segmentation

---

## 4.8 No HTTPS Implemented

**Severity:** High

### Impact

* Data transmitted in plaintext
* Man-in-the-Middle (MITM) attacks
* Credential interception

### Mitigation

* Implement SSL/TLS certificates
* Redirect HTTP to HTTPS
* Enforce secure headers

---

# 🟡 Medium Risks

---

## 4.9 SSH Brute Force Possibility (Port 22)

**Severity:** Medium

### Impact

* Unauthorized access via password guessing
* Credential compromise

### Mitigation

* Use key-based authentication
* Disable password login
* Enable rate limiting
* Use Fail2Ban

---

## 4.10 SMTP Open Relay Possibility (Port 25)

**Severity:** Medium

### Impact

* Spam distribution
* Blacklisting of IP address
* Email abuse

### Mitigation

* Disable open relay
* Restrict mail relay policies
* Configure SMTP authentication

---

# 5️⃣ Risk Summary Table

| Vulnerability          | Port | Severity    |
| ---------------------- | ---- | ----------- |
| Telnet                 | 23   | 🔴 Critical |
| VSFTPD 2.3.4 Backdoor  | 21   | 🔴 Critical |
| SMB Vulnerabilities    | 445  | 🔴 Critical |
| Outdated Apache        | 80   | 🔴 Critical |
| Weak MySQL Credentials | 3306 | 🔴 Critical |
| FTP Anonymous Login    | 21   | 🟠 High     |
| Exposed Database Ports | 3306 | 🟠 High     |
| No HTTPS               | 80   | 🟠 High     |
| SSH Brute Force Risk   | 22   | 🟡 Medium   |
| SMTP Open Relay        | 25   | 🟡 Medium   |

---

# 6️⃣ Overall Impact Analysis

The vulnerabilities identified expose the system to:

* Remote Code Execution (RCE)
* Credential Theft
* Data Breaches
* Ransomware Infection
* Lateral Movement
* Complete System Compromise

If deployed in a production environment, this security posture would be considered extremely unsafe.

---

# 7️⃣ Mitigation Strategy (Comprehensive)

1. Disable all unnecessary services
2. Replace insecure protocols (Telnet → SSH, FTP → SFTP)
3. Apply all security patches
4. Enforce strong authentication policies
5. Implement firewall restrictions
6. Enable intrusion detection systems (IDS)
7. Apply network segmentation
8. Regularly conduct vulnerability scans
9. Monitor logs continuously
10. Enforce encryption across services

---

# 8️⃣ Conclusion

The assessment of Metasploitable 2 demonstrates how outdated software, exposed services, and weak configurations can severely compromise system security.

Multiple critical vulnerabilities were identified, including a known backdoor (CVE-2011-2523), insecure communication protocols, and weak credential management.

This lab clearly highlights the importance of:

* Patch management
* Service hardening
* Encryption enforcement
* Continuous monitoring

A properly secured production environment must eliminate these vulnerabilities to maintain confidentiality, integrity, and availability.

---
