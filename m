Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYidf-0002oR-HT
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidV-0002dG-Ok
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidT-0003Sy-9B
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQr5RCbFdS/oHuH0+9xIml7K7ZNy+hcaQwV4qGT2rv8=;
 b=ZaTGlhclaxu4gTFSB/0gGiaVBSavN4j5BNUEBcvkFq4iP6UU9zibrZhXJovTr+Z1Hed7Yw
 fjnyQoWUXN+TRRhgAARL/yTEcinFPRWJdvrA//kOP2SZ5+MCx6ukDPWmbW7cOkWol3cedy
 I9zJHRdOvs1Y9sxH7Pc4BZVq4MxXBBQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-wLtDiG4aOkW2Te8VjoKXnA-1; Fri, 17 Jan 2025 04:27:23 -0500
X-MC-Unique: wLtDiG4aOkW2Te8VjoKXnA-1
X-Mimecast-MFC-AGG-ID: wLtDiG4aOkW2Te8VjoKXnA
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa622312962so153246666b.2
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106042; x=1737710842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQr5RCbFdS/oHuH0+9xIml7K7ZNy+hcaQwV4qGT2rv8=;
 b=Dz+1Njh4sYBc9EMULstVWLOx0avyS8jcH+e6qjBsk9jY3cu/5gTfTO6ZrjHHt4BZzg
 /7JyE+9ihGu3B9GFjLYFvYfFpyvHPaNhR1lVgGR9DVi+8DDrSB7Irq1YnoSdQeWzAq3c
 /2dmegFQLkHF0DFshpxNFfQ0syQl697CQH4pQz4EOqGU1NRdy1GBlFiojM3Xfwe0OTuT
 OJMfpM0JePpV2QXnT1TYAnvKKdLZO2Y0hfbGI/+OjnaOzH5H8imEejoN6GiamSNgeR50
 a0X/R8Ntd2oABmDXQPHTVTNJFIRUDjMYwnxURAQluWYR6LrNVrEm2RtJiAfrXzNX38HG
 n0mw==
X-Gm-Message-State: AOJu0YyOHgmzUOhvh6i8VrRKUgVi3OMrXlx5ke9Gs56Kdh+Q0vtAP6SX
 GlbMIfWgIJITFqqXcHBAMZczwmvdF2upQhuic/910S5K8oaulxBPAwZMW1XZUthEKc0ht53R2zm
 WwIwm4OBcyGP3sx1Rseg4QI6BcR6VhWUUmcbOQNInEEBlaXjMQnM=
X-Gm-Gg: ASbGncv2M6f7MsA4nqCKbBSeczXf/gamph6/qhNtLOesKb88O2jNVGUpDAIRmSKjaJ4
 YlzyPTuiTufr7CiMl+Wua98Bhd429psUK/Y9HtbXFr8rgQDKYpqOgOoTC20Vf8zqd1IurnYVlP/
 1DhJejLSRWQrlXkndwJDTqm0Ij9JMy2NH5jGwWrgQrOox6MYGAalABSTJXG/xG3UGEx9p2r3Qmu
 1a9JTeE0foEDXC9uxeAdmwA7pmLgAVNp9FA4V9MNa3yDX5jfek7/mirUV4o
X-Received: by 2002:a17:907:7f03:b0:ab2:d96d:6364 with SMTP id
 a640c23a62f3a-ab38b10ade0mr170622766b.18.1737106042068; 
 Fri, 17 Jan 2025 01:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSdKkAVtnSSAasBosqLjZLUARijfc4OnYQL6bPMd9C4NKnh3l5NI42h6VDZaIVxZs5bkT+5w==
X-Received: by 2002:a17:907:7f03:b0:ab2:d96d:6364 with SMTP id
 a640c23a62f3a-ab38b10ade0mr170620566b.18.1737106041655; 
 Fri, 17 Jan 2025 01:27:21 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384fcb5desm135754966b.165.2025.01.17.01.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:27:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 10/10] rust: qdev: make reset take a shared reference
Date: Fri, 17 Jan 2025 10:26:57 +0100
Message-ID: <20250117092657.1051233-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117092657.1051233-1-pbonzini@redhat.com>
References: <20250117092657.1051233-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TGqmyOiY3998ZxYnPdapW0Hf7ind_4Y29tT4i3aTvVA_1737106042
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:32 -0000

Because register reset is within a borrow_mut() call, reset
does not need anymore a mut reference to the PL011State.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 4 ++--
 rust/qemu-api/src/qdev.rs        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index af0f451deb2..019c1617807 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -164,7 +164,7 @@ fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&device_class::VMSTATE_PL011)
     }
     const REALIZE: Option<fn(&mut Self)> = Some(Self::realize);
-    const RESET: Option<fn(&mut Self)> = Some(Self::reset);
+    const RESET: Option<fn(&Self)> = Some(Self::reset);
 }
 
 impl PL011Registers {
@@ -604,7 +604,7 @@ pub fn realize(&mut self) {
         }
     }
 
-    pub fn reset(&mut self) {
+    pub fn reset(&self) {
         self.regs.borrow_mut().reset();
     }
 
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 686054e737a..4658409bebb 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -30,7 +30,7 @@ pub trait DeviceImpl {
     ///
     /// Rust does not yet support the three-phase reset protocol; this is
     /// usually okay for leaf classes.
-    const RESET: Option<fn(&mut Self)> = None;
+    const RESET: Option<fn(&Self)> = None;
 
     /// An array providing the properties that the user can set on the
     /// device.  Not a `const` because referencing statics in constants
-- 
2.47.1


