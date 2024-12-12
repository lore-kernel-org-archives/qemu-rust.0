Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtV-0006oW-4O
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtP-0006mX-G3
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtH-0006mH-VZ
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MpwabzURXwkWGeV9eBFMbfUWRyFiGXeK3DZtokPWu8Q=;
 b=Zryg03eg1/b8WZAiyl/bPvQg26/x4n2rw8zh3AasjYZ7hpcpr+ctM6er+HVuejm5GuSCXM
 NY5OXU7jwdtKNM+A6kEIgwIo7zefQrCw1izoRgZrVil7TUX4GKl/mv14eCk9uGGaHBD49e
 /1j3wC/n1/4T1T81QBtm7bjsyCvltUM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-WklSnvFhP9WsEu5R9v2jzw-1; Thu, 12 Dec 2024 12:22:13 -0500
X-MC-Unique: WklSnvFhP9WsEu5R9v2jzw-1
X-Mimecast-MFC-AGG-ID: WklSnvFhP9WsEu5R9v2jzw
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e4a759e6so509425f8f.1
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024132; x=1734628932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpwabzURXwkWGeV9eBFMbfUWRyFiGXeK3DZtokPWu8Q=;
 b=us6rOr1x0E6UXpz5ovmwRTbxO7D1SflMT7j915iXbP6U9MNO0c90+aCNeCW6HM7nu5
 yy2b5YMBlwQ2dH/HkqBYJFs/9X3ddVy7lj2kZtliQE2UNlqjZyl9dH/Sl6q5XEmUPL7p
 fQr+9gI8WDD9thJ3KrDSFNrKweUglwcTTikRZpI5/B1Ia7Yib8OC78bZylHUuKD7PfhP
 bvboqryKvuiKLgEpzwBcW140HpmCh3JePb1wpODYzLGB8fLxu9DrfYH0mjNl5Fz3elPA
 sGa3endTlM6Zo8R94oNho6ODM59pK0WdBEW8y9uiDkcSCK/gMWEIoK9CQ90boTQ1+Am2
 HFdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlPjOH5OjoR/3T0wUAbMJRdyUPQsOfxKUtnRetaD+Z1V685jdHtd561dYbBzkvoRGDCeozeArJ6CA=@nongnu.org
X-Gm-Message-State: AOJu0YyKnaBhJV8M2pASBq7FS4/ljRxIZxPx8lBh2bnk4RvwNC9InlLn
 aZYgnfwphAa3dQygr4bSTU175t8Y+7CYJnW82bAkVfE4qQMDVVHzZ0Qx3XjSpR9+r/F7OZVrN/A
 6ORsaOwvtx2yl8EZP9utINyU3oZb18JIUu5181ld0B7kdo1wWDzA=
X-Gm-Gg: ASbGncviXZIaPcMmmO58orZ8LxiJNGsvPpaeuMxJ+g/GPfevoIBqagrVKtF/v3wYkZg
 Pm/EkvjNlkHn1QU86dCPVRezJ7DWrx6bPOnKCBScxh8B896/RaqmU8gHf7/vslNxipM423mKc2k
 OW8KEdbCTYs7J3s1bGal7XU896jysf+ABUTS2jYGOFNNJw7JrRT7xMX7DHwdDUa28rM32slmST/
 TVMZWOJ1OwHbEtdy0XBTB1FVLnQXbuXL9FgPWpv6NsLeLUol8/ozd6ifftM
X-Received: by 2002:a05:6000:480c:b0:385:e1a8:e28e with SMTP id
 ffacd0b85a97d-38787688445mr4122457f8f.10.1734024132618; 
 Thu, 12 Dec 2024 09:22:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQdx4ErH/KJOgdQGGnnunsqKetXR8ZxPY5xNETUxdkG0mdeOX0Gum0+gKhI95gWCwg9kyWrg==
X-Received: by 2002:a05:6000:480c:b0:385:e1a8:e28e with SMTP id
 ffacd0b85a97d-38787688445mr4122409f8f.10.1734024131367; 
 Thu, 12 Dec 2024 09:22:11 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824bd45esm4620260f8f.43.2024.12.12.09.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 0/7] rust: pl011: bug fixes
Date: Thu, 12 Dec 2024 18:21:57 +0100
Message-ID: <20241212172209.533779-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WDjZzMhF5GyWPK2uupSYmQfefwQ_uWv3zHHGrC09MrE_1734024133
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Dec 2024 17:22:30 -0000

While preparing the comparison at
https://lists.nongnu.org/archive/html/qemu-rust/2024-12/msg00006.html,
I noticed some bugs in the code.  These are the corresponding fixes.

CCing Philippe because he expressed interest in bringing the Rust
version on par with the C version of the pl011 device.

Thanks,

Paolo

Paolo Bonzini (7):
  rust: pl011: fix declaration of LineControl bits
  rust: pl011: match break logic of C version
  rust: pl011: always use reset() method on registers
  rust: pl011: fix break errors and definition of Data struct
  rust: pl011: extend registers to 32 bits
  rust: pl011: fix migration stream
  rust: pl011: simplify handling of the FIFO enabled bit in LCR

 rust/hw/char/pl011/src/device.rs       | 119 +++++++++++-------
 rust/hw/char/pl011/src/device_class.rs |   8 +-
 rust/hw/char/pl011/src/lib.rs          | 161 +++++++++++++------------
 rust/qemu-api/src/vmstate.rs           |  22 ----
 4 files changed, 160 insertions(+), 150 deletions(-)

-- 
2.47.1


