Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCwdt-0001Uv-Rh
	for mharc-qemu-rust@gnu.org; Thu, 08 May 2025 04:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCwdg-0001PR-Ae
 for qemu-rust@nongnu.org; Thu, 08 May 2025 04:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCwde-0008Dj-C8
 for qemu-rust@nongnu.org; Thu, 08 May 2025 04:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746692993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Arws0fupnvpT9ra6STFPdnILDLwQqiyeyVN0kS90Bxk=;
 b=MuKqkAWULQiYUyYhbGja+zznOavpNMz/DkLiVxndxqz5xDQsXs1M7D3v5HoYVHhV1eZCm+
 jyG3aYNVCALZ3VuYspuyslRM0e3rWCzWMgPLtxvT/bks7kqgQg6oITCCFAhM3aCGQeTt3q
 mTfZD1uMG8Q7OSy0LGY9UxQjSV+GuZI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-imBeFbpfPBy1TK-oE_-lKg-1; Thu, 08 May 2025 04:29:51 -0400
X-MC-Unique: imBeFbpfPBy1TK-oE_-lKg-1
X-Mimecast-MFC-AGG-ID: imBeFbpfPBy1TK-oE_-lKg_1746692990
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-440667e7f92so3993035e9.3
 for <qemu-rust@nongnu.org>; Thu, 08 May 2025 01:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746692989; x=1747297789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Arws0fupnvpT9ra6STFPdnILDLwQqiyeyVN0kS90Bxk=;
 b=dmtis6T21384S8pfkbUnpLsDJa5Vg7CsoupoPwd9dM0QM0Vvf/evhspG17y0KP1Gmj
 LWd8ZojZf3zjcQ4skuVzVxiRnmBwydaA11fu5q1+duBsC6QQYhSG/0/U09i7u9UDetzL
 VNIZB7pT76SrdMkEvmcIiD/cYSLps2LnR8C1z2en2FJrAk/NDCJzTZdmTb9QIcEXwSEo
 q+IzZ1R5WxRjrU9dm0aJn97XCT6TFj/QP68U19MiuIC3oHGM6j7lkinEjHC8NiOO2sNz
 H+CDnWxvFDEDPeUwgkw3nMWnfvcby+C5BpEB/RkmMiSm6e14zHoklTCHSfBQBRLJPUvu
 D3og==
X-Gm-Message-State: AOJu0Yzsms8mFzSrTPz5QOCTf20eqWHQ6ocv3XkyADvdUbfoo9QdAvoN
 1FcKvqZEZaULSo268c3FWC05NjCfPGLcmZdxBM3jGJ8COxICiLVbncScXkvuxZeEYtrtjnftlPW
 tyoW6uPbtXKxOjRpfrnpCrBXvTKfC9EESIa3NvDSVO+WTQboPY1VRvrEAtmk=
X-Gm-Gg: ASbGncsbNjBVf610XsX8VxZmnC3CoSu1BABQg2atsQXo8kak5AApyOvMYCX5def+zPi
 rwC/EKMCDMc0sR4r6e4IavEK+BP49jvqM2+2sci6QLbK3qPDVMyBz61JNYF8qjZ+TdeSd98WqyV
 2MGVXMTKzLA7UOIWN9JEX/NTKzNgVIauwt3sw9rjKulxHlppr7AdSi4kKkkOTl6+0a43g3RBJ9N
 3U30O0N7LE2WJEz6Rh64ChvRT0btEofxu+jyP/om0g1fGuKK4kqziQjis/lvGESSb/bwjmmpoa3
 nApkVFamfByPkJs=
X-Received: by 2002:a05:600c:468d:b0:441:ac58:eb31 with SMTP id
 5b1f17b1804b1-442d033f8f1mr18688715e9.20.1746692989329; 
 Thu, 08 May 2025 01:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJGUaeYQbDT45Q+YBpuJadet5VjGqpPHTEngRar6ztAE1LhfIRPmdqsY+40x13jwQRMvUAmw==
X-Received: by 2002:a05:600c:468d:b0:441:ac58:eb31 with SMTP id
 5b1f17b1804b1-442d033f8f1mr18688535e9.20.1746692988988; 
 Thu, 08 May 2025 01:29:48 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d1266624sm46176935e9.2.2025.05.08.01.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 01:29:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/2] rust: pl011: Really use RX FIFO depth
Date: Thu,  8 May 2025 10:29:43 +0200
Message-ID: <20250508082943.446512-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508082943.446512-1-pbonzini@redhat.com>
References: <20250508082943.446512-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qRh5zjOeUZHhMUMOvZ9SvRX6BsPf2IE6C32QV4ey8r4_1746692990
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
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
X-List-Received-Date: Thu, 08 May 2025 08:30:03 -0000

While we model a 16-elements RX FIFO since the PL011 model was
introduced in commit cdbdb648b7c ("ARM Versatile Platform Baseboard
emulation"), we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst              |  2 +-
 rust/hw/char/pl011/src/device.rs | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 4de86375021..171d908e0b0 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -119,7 +119,7 @@ QEMU includes four crates:
   for the ``hw/char/pl011.c`` and ``hw/timer/hpet.c`` files.
 
 .. [#issues] The ``pl011`` crate is synchronized with ``hw/char/pl011.c``
-   as of commit 02b1f7f61928.  The ``hpet`` crate is synchronized as of
+   as of commit 3e0f118f82.  The ``hpet`` crate is synchronized as of
    commit 1433e38cc8.  Both are lacking tracing functionality.
 
 This section explains how to work with them.
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 94b31659849..7f28bb25a9b 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -580,19 +580,19 @@ fn write(&self, offset: hwaddr, value: u64, _size: u32) {
     fn can_receive(&self) -> u32 {
         let regs = self.regs.borrow();
         // trace_pl011_can_receive(s->lcr, s->read_count, r);
-        u32::from(regs.read_count < regs.fifo_depth())
+        regs.fifo_depth() - regs.read_count
     }
 
     fn receive(&self, buf: &[u8]) {
-        if buf.is_empty() {
-            return;
-        }
         let mut regs = self.regs.borrow_mut();
-        let c: u32 = buf[0].into();
-        let update_irq = !regs.loopback_enabled() && regs.fifo_rx_put(c.into());
+        let mut update_irq = false;
+        for &c in buf {
+            let c: u32 = c.into();
+            update_irq |= !regs.loopback_enabled() && regs.fifo_rx_put(c.into());
+        }
+
         // Release the BqlRefCell before calling self.update()
         drop(regs);
-
         if update_irq {
             self.update();
         }
-- 
2.49.0


