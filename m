Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYida-0002kG-N1
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidU-0002cS-0B
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidS-0003Sf-6D
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=innpU5AETiIp3OnYooXzip5b0I/ePQPwX7sHlhJog2Y=;
 b=J5uuVyXopScdnl3mOvjq8s9PU+seByBCb++2tgrKlGJ2dR4iLNH2zJbR11/JviVxmu+o1n
 Yv8/4t1t9q51QmL9Rrkj/guw3slQurMFh9pkjIrIxfdkGzBJlZUYcnhmJnFWP5zpuk/Tg7
 +soxzHs9V7wcBQ2GClXJ4M/g9utpmAQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-_N2Y7b_bO76bCbOZx9IDlg-1; Fri, 17 Jan 2025 04:27:21 -0500
X-MC-Unique: _N2Y7b_bO76bCbOZx9IDlg-1
X-Mimecast-MFC-AGG-ID: _N2Y7b_bO76bCbOZx9IDlg
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa68b4b957fso243470866b.3
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106040; x=1737710840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=innpU5AETiIp3OnYooXzip5b0I/ePQPwX7sHlhJog2Y=;
 b=oyplSw+GkaFqajA7/kirLn15jHWtNa+vJ5ann0tw06ecYKX4KhfMWA6pjTRQf14p2L
 ajMjFQotHNGx6LVjF4fXZpnRA4P4NSS0CMVcpyx8k2FwwO8XErqB6DUhi6bGp9/neB0a
 7V7HkfBOuFf+cqq6FiVtJ6e0xhk7JHi2izqL64HMgxL+sbDBSu0Znnye+sB9k1EgDP2e
 DektyM7wAcGzDoHauCSVDOwRv/To4Jim36SNkV9FzL5Lg9Er8NtY8mZVerglV/C+p717
 bwBkE8+WwOQ7pVDj/CnfCGADRRmrsD0OfVel9qVNPz494Bo33zkGPl4P46IsqouMpIlq
 kflw==
X-Gm-Message-State: AOJu0Yz9Ekm/seRPwrX6lvHEZDMJdsw0raiKAdA1vw7d0t6Dov3Ggu5P
 SUH8sn65PoSnCKQcZaI9ZdkUIquyBD7GNaWKj1FVnRucCj3+mjxjCwWyqEvIk6qj2TjXUrPrfQA
 KHdpzauXQwO6vtCM6BegHomEclHowV7q9y2zB1GYchlpzv/3ySnbIkOSFQEvcmg==
X-Gm-Gg: ASbGncuL28tOyTaB68UiPGGje+dfQTK4/K1aI+CSh3nWyLt0bqS/cdmM70IZnNA55z5
 6kinYxYcoqiTMGEd49QYYqovp72Q+gLolh+9YgRgzVEnU1iWoYB/u0DOU+dn/Menx3lFyRmQmty
 bJwUhZAvkHM6Ow4nmoWpEuM0GyusU85JBoDBs7bvHkO3ZLxAz69yT7P51znasHInCX0/TvmAtWk
 0YKfrlMrBF+69nyIfCsmCTpxSPTejPrmlwyWsDdeUyE09DORKKegYgYrwkV
X-Received: by 2002:a17:907:969f:b0:ab2:c9b8:aaa7 with SMTP id
 a640c23a62f3a-ab38b36b7f6mr198023466b.44.1737106039713; 
 Fri, 17 Jan 2025 01:27:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLf0NVPirfPpmEV2RQNxzEbAJ6LIgyOIMuXLNELlVnAE9rs6fRKq/StbmIUrTDGfStPnff1w==
X-Received: by 2002:a17:907:969f:b0:ab2:c9b8:aaa7 with SMTP id
 a640c23a62f3a-ab38b36b7f6mr198021866b.44.1737106039335; 
 Fri, 17 Jan 2025 01:27:19 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c5c465sm140626866b.17.2025.01.17.01.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:27:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 09/10] rust: pl011: pull device-specific code out of
 MemoryRegionOps callbacks
Date: Fri, 17 Jan 2025 10:26:56 +0100
Message-ID: <20250117092657.1051233-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117092657.1051233-1-pbonzini@redhat.com>
References: <20250117092657.1051233-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uiqvsfi7xGf86qNtq5phUISL4zLeOCBjuQbEhGaht2I_1737106041
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:29 -0000

read() can now return a simple u64.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs     | 16 +++++++++-------
 rust/hw/char/pl011/src/memory_ops.rs | 23 ++++-------------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 6ecbfb9ac84..af0f451deb2 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -171,7 +171,7 @@ impl PL011Registers {
     pub(self) fn read(&mut self, offset: RegisterOffset) -> ControlFlow<u32, u32> {
         use RegisterOffset::*;
 
-        std::ops::ControlFlow::Break(match offset {
+        ControlFlow::Break(match offset {
             DR => {
                 self.flags.set_receive_fifo_full(false);
                 let c = self.read_fifo[self.read_pos];
@@ -530,22 +530,24 @@ fn post_init(&self) {
         }
     }
 
-    #[allow(clippy::needless_pass_by_ref_mut)]
-    pub fn read(&mut self, offset: hwaddr, _size: u32) -> ControlFlow<u64, u64> {
+    pub fn read(&mut self, offset: hwaddr, _size: u32) -> u64 {
         match RegisterOffset::try_from(offset) {
             Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
                 let device_id = self.get_class().device_id;
-                ControlFlow::Break(u64::from(device_id[(offset - 0xfe0) >> 2]))
+                u64::from(device_id[(offset - 0xfe0) >> 2])
             }
             Err(_) => {
                 // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
-                ControlFlow::Break(0)
+                0
             }
             Ok(field) => match self.regs.borrow_mut().read(field) {
-                ControlFlow::Break(value) => ControlFlow::Break(value.into()),
+                ControlFlow::Break(value) => value.into(),
                 ControlFlow::Continue(value) => {
                     self.update();
-                    ControlFlow::Continue(value.into())
+                    unsafe {
+                        qemu_chr_fe_accept_input(&mut self.char_backend);
+                    }
+                    value.into()
                 },
             }
         }
diff --git a/rust/hw/char/pl011/src/memory_ops.rs b/rust/hw/char/pl011/src/memory_ops.rs
index 8f66c8d492c..95b4df794e4 100644
--- a/rust/hw/char/pl011/src/memory_ops.rs
+++ b/rust/hw/char/pl011/src/memory_ops.rs
@@ -26,26 +26,11 @@
 unsafe extern "C" fn pl011_read(opaque: *mut c_void, addr: hwaddr, size: c_uint) -> u64 {
     assert!(!opaque.is_null());
     let mut state = unsafe { NonNull::new_unchecked(opaque.cast::<PL011State>()) };
-    let val = unsafe { state.as_mut() }.read(addr, size);
-    match val {
-        std::ops::ControlFlow::Break(val) => val,
-        std::ops::ControlFlow::Continue(val) => {
-            // SAFETY: self.char_backend is a valid CharBackend instance after it's been
-            // initialized in realize().
-            let cb_ptr = unsafe { core::ptr::addr_of_mut!(state.as_mut().char_backend) };
-            unsafe {
-                qemu_chr_fe_accept_input(cb_ptr);
-            }
-
-            val
-        }
-    }
+    unsafe { state.as_mut() }.read(addr, size)
 }
 
 unsafe extern "C" fn pl011_write(opaque: *mut c_void, addr: hwaddr, data: u64, _size: c_uint) {
-    unsafe {
-        assert!(!opaque.is_null());
-        let mut state = NonNull::new_unchecked(opaque.cast::<PL011State>());
-        state.as_mut().write(addr, data)
-    }
+    assert!(!opaque.is_null());
+    let mut state = unsafe { NonNull::new_unchecked(opaque.cast::<PL011State>()) };
+    unsafe { state.as_mut() }.write(addr, data);
 }
-- 
2.47.1


