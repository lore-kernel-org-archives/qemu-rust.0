Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfzr4-0002GX-DR
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 06:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfzqw-0002EF-It
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfzqt-0003e7-PJ
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738840522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oC4sSczyHUPcW1OOZ38NHr8TjI3/9SwgCw7OQNwY7a8=;
 b=JH98hAgnhYWBWwYfKNa67VfLEItilQh/X6XfnSZOSowsJ7v3SAVptHX7S66ojgpsaydtwM
 8t4YmuAIEQfJwI1KgbsEPH0eHaNJt4kjQly/HPDhFn9yKZVBjQQSWw0wuxpxMhia7FCrrD
 VePw4qmMMKsbt7O1+WnB2RqVNNlrSq8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-7ODpLpfNO3yv0NvHZAYqQQ-1; Thu, 06 Feb 2025 06:15:21 -0500
X-MC-Unique: 7ODpLpfNO3yv0NvHZAYqQQ-1
X-Mimecast-MFC-AGG-ID: 7ODpLpfNO3yv0NvHZAYqQQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab693930fc5so86578266b.1
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 03:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738840520; x=1739445320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC4sSczyHUPcW1OOZ38NHr8TjI3/9SwgCw7OQNwY7a8=;
 b=ssdfLIpCJtSq/2hRamavOJRlSmaCWIwZGuuoRIY03i6CdYmD8+XqrR5sO49rcNxbYT
 DgoQHwKWFf5ZY459RKJiSjTf9p5lD+pZTjDLUKndal4NPwKvekAbqCnmaW+JhQxMXsz9
 zTQfGbFHDo0HH3tGlcGLrZ5eH1fa2pC0lyiOP4XVXsp1bisoNnrzcAeg+MxGWhNApMwc
 U66xD/YuQsMtvssDfn9aBNfD3YTkKyEAdH0sgwwqwQ8OnqdU5+e84WEsOvhkarP+Mlkf
 EP3JjVAnmpTZxCOXL4c6gayYnkRoWosZ5Ax1KrlDDTwjgAIjZqTqhlpXIJUy9R/QQ3jh
 mryA==
X-Gm-Message-State: AOJu0YyHToNsQWPEAtLnRluPw23UFWe2eQXUUz0yfazj4zJbSbLs6W2O
 KJg7xnUWIFLGRjXNGYK4JUdE7sczl84Tvm7dfDczqbNYmc+TkpUQ5Et+67P1w7IyzwSzBg8rf7w
 rwmHUrtqz87rFMkLZTtfsCfvsoBbgM3EiD8UDYLFAuYJ1fvjpo86213VTwTkAzg==
X-Gm-Gg: ASbGncsow877CImMdwJcxCGbVj8nrxhDnF/IeKGg7VQG9/yjh6LwC28T2Qmn2XwDHJA
 EmLzXqZPGkJZ47vxmj9AjIj+Ff9modyuMPCemhhey3yHj/2rtItaurmaBcdvqSgM4e0piO35tGC
 JpIQzfW2eilWYZBjcgpo438W7G9rBBOiR/UJR5KYY8q2up/Ela1GYvzM+aeFLCtbgaiQmN2fXrV
 ut9UGTiOlB1Sl9B+sBGZ5YvZdB3ez8lFwmHpHNJa1a6pcPXb91RrHcuF2jLxZ1MK5vTObGNcrmW
 swmmAg==
X-Received: by 2002:a17:907:d88:b0:aa6:9176:61ed with SMTP id
 a640c23a62f3a-ab75e33cea1mr741527666b.48.1738840519819; 
 Thu, 06 Feb 2025 03:15:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpCAbNzRQoVTpC34D02TwtXd5Eew+XFQ4cuP84wBfHoGht/lMisJsSgvcUew5JL7UMbxKm3w==
X-Received: by 2002:a17:907:d88:b0:aa6:9176:61ed with SMTP id
 a640c23a62f3a-ab75e33cea1mr741524266b.48.1738840519298; 
 Thu, 06 Feb 2025 03:15:19 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f84393sm84269066b.60.2025.02.06.03.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 03:15:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] rust: pl011: convert pl011_create to safe Rust
Date: Thu,  6 Feb 2025 12:15:14 +0100
Message-ID: <20250206111514.2134895-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206111514.2134895-1-pbonzini@redhat.com>
References: <20250206111514.2134895-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u16ovzY6Lrra6_bhnzAqMdT9gLGmxXeIdSr0RL3kuBI_1738840520
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Thu, 06 Feb 2025 11:15:30 -0000

Not a major change but, as a small but significant step in creating
qdev bindings, show how pl011_create can be written without "unsafe"
calls (apart from converting pointers to references).

This also provides a starting point for creating Error** bindings.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 39 ++++++++++++++++----------------
 rust/qemu-api/src/sysbus.rs      | 34 +++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 22f3ca3b4e8..7e936b50eb0 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -10,14 +10,12 @@
 
 use qemu_api::{
     bindings::{
-        error_fatal, qdev_prop_set_chr, qemu_chr_fe_accept_input, qemu_chr_fe_ioctl,
-        qemu_chr_fe_set_handlers, qemu_chr_fe_write_all, qemu_irq, sysbus_connect_irq,
-        sysbus_mmio_map, sysbus_realize, CharBackend, Chardev, QEMUChrEvent,
-        CHR_IOCTL_SERIAL_SET_BREAK,
+        qemu_chr_fe_accept_input, qemu_chr_fe_ioctl, qemu_chr_fe_set_handlers,
+        qemu_chr_fe_write_all, CharBackend, QEMUChrEvent, CHR_IOCTL_SERIAL_SET_BREAK,
     },
     chardev::Chardev,
-    c_str, impl_vmstate_forward,
-    irq::InterruptSource,
+    impl_vmstate_forward,
+    irq::{IRQState, InterruptSource},
     memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
     prelude::*,
     qdev::{Clock, ClockEvent, DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
@@ -698,26 +696,27 @@ pub fn post_load(&self, _version_id: u32) -> Result<(), ()> {
 
 /// # Safety
 ///
-/// We expect the FFI user of this function to pass a valid pointer for `chr`.
+/// We expect the FFI user of this function to pass a valid pointer for `chr`
+/// and `irq`.
 #[no_mangle]
 pub unsafe extern "C" fn pl011_create(
     addr: u64,
-    irq: qemu_irq,
+    irq: *mut IRQState,
     chr: *mut Chardev,
 ) -> *mut DeviceState {
-    let pl011 = PL011State::new();
-    unsafe {
-        let dev = pl011.as_mut_ptr::<DeviceState>();
-        qdev_prop_set_chr(dev, c_str!("chardev").as_ptr(), chr);
+    // SAFETY: The callers promise that they have owned references.
+    // They do not gift them to pl011_create, so use `Owned::from`.
+    let irq = unsafe { Owned::<IRQState>::from(&*irq) };
+    let chr = unsafe { Owned::<Chardev>::from(&*chr) };
 
-        let sysbus = pl011.as_mut_ptr::<SysBusDevice>();
-        sysbus_realize(sysbus, addr_of_mut!(error_fatal));
-        sysbus_mmio_map(sysbus, 0, addr);
-        sysbus_connect_irq(sysbus, 0, irq);
-
-        // return the pointer, which is kept alive by the QOM tree; drop owned ref
-        pl011.as_mut_ptr()
-    }
+    let dev = PL011State::new();
+    dev.prop_set_chr("chardev", &chr);
+    dev.realize();
+    dev.mmio_map(0, addr);
+    dev.connect_irq(0, &irq);
+    // SAFETY: return the pointer, which has to be mutable and is kept alive
+    // by the QOM tree; drop owned ref
+    unsafe { dev.as_mut_ptr() }
 }
 
 #[repr(C)]
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index c27dbf79e43..1f071706ce8 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -2,18 +2,18 @@
 // Author(s): Paolo Bonzini <pbonzini@redhat.com>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::ffi::CStr;
+use std::{ffi::CStr, ptr::addr_of_mut};
 
 pub use bindings::{SysBusDevice, SysBusDeviceClass};
 
 use crate::{
     bindings,
     cell::bql_locked,
-    irq::InterruptSource,
+    irq::{IRQState, InterruptSource},
     memory::MemoryRegion,
     prelude::*,
     qdev::{DeviceClass, DeviceState},
-    qom::ClassInitImpl,
+    qom::{ClassInitImpl, Owned},
 };
 
 unsafe impl ObjectType for SysBusDevice {
@@ -60,6 +60,34 @@ fn init_irq(&self, irq: &InterruptSource) {
             bindings::sysbus_init_irq(self.as_mut_ptr(), irq.as_ptr());
         }
     }
+
+    // TODO: do we want a type like GuestAddress here?
+    fn mmio_map(&self, id: u32, addr: u64) {
+        assert!(bql_locked());
+        let id: i32 = id.try_into().unwrap();
+        unsafe {
+            bindings::sysbus_mmio_map(self.as_mut_ptr(), id, addr);
+        }
+    }
+
+    // Owned<> is used here because sysbus_connect_irq (via
+    // object_property_set_link) adds a reference to the IRQState,
+    // which can prolong its life
+    fn connect_irq(&self, id: u32, irq: &Owned<IRQState>) {
+        assert!(bql_locked());
+        let id: i32 = id.try_into().unwrap();
+        unsafe {
+            bindings::sysbus_connect_irq(self.as_mut_ptr(), id, irq.as_mut_ptr());
+        }
+    }
+
+    fn realize(&self) {
+        // TODO: return an Error
+        assert!(bql_locked());
+        unsafe {
+            bindings::sysbus_realize(self.as_mut_ptr(), addr_of_mut!(bindings::error_fatal));
+        }
+    }
 }
 
 impl<R: ObjectDeref> SysBusDeviceMethods for R where R::Target: IsA<SysBusDevice> {}
-- 
2.48.1


