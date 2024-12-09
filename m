Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1O-0003vv-JC
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1F-0003pL-2E
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd17-0007PL-6t
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMi4xnuVX8OtBt4NvX2Y5ZrPSheVzAeHna9cNK+HRcg=;
 b=DNYAnj1PExjBZhBnQkgB8y+au1Gy+PznL0r9MphhA4WETWNNPG9qUYiE1psSf4IYSxKEM4
 JWTjxx4pXysUG25k9kXFdcD4vjtDNfMTmuymasspNY819OTInwOawYzie+Do0Fla5YyIK+
 uorou0KiIJlQnmbBYZESBKEeAZ3YwCo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-tb1xxsQdMTCX-nEI2jserQ-1; Mon, 09 Dec 2024 07:37:33 -0500
X-MC-Unique: tb1xxsQdMTCX-nEI2jserQ-1
X-Mimecast-MFC-AGG-ID: tb1xxsQdMTCX-nEI2jserQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-386321c8f4bso1237635f8f.0
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747852; x=1734352652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMi4xnuVX8OtBt4NvX2Y5ZrPSheVzAeHna9cNK+HRcg=;
 b=Bntsvw87oXZ3vgarTV7Dv79/kbvMEbPYlYaEF23+/+pbd1xkzEXNVJTMCVJRklmHIo
 KUrrMOv9lB0WyxZzNz7Ez6GJRgdQTeBKNDR9degdyGEixwVgfnINR9OVYpd+OEkY1XxQ
 P7gloQAzwmzBvFVaKrbHW2dP2pSvfUQhNcVSzKIGcUEFJJNDSX9T0DvfJoB0B7dJ1IBf
 uuW6Dh1inxkSiFK4A7SpnGweIiMH3ZWMPf3nq5Uve3U71D49fEmzhYL/3TGAZWSEn0Lr
 jROYXh4CMYIphOcphsU0w+AhDe7eu+7f48ySCmzPFHtVtGUAX/rZ9ugAuoDKNdLUtsLO
 0xEw==
X-Gm-Message-State: AOJu0YwESCG9SqMhfQvVcVcLoiboZ8C1T/BjbDfUw0GjEHE+cSikWy2z
 jm2NiS19E3vkpi+5J+EgWaYUdbXzILFgNqch1TsUFL2TfVYlrKuPpJmGLLCjXPlOYy6LAxaziTa
 yyLplmjspBs+2ae+jOcEMBdskw2JjoOXpjKEQdIOVFvWvMoxj7XE=
X-Gm-Gg: ASbGncsUOyE3dBqBFAY++URB4EBGYqs+1Z31IPaVQF3Gy2HyL31c6DHxV0RkX3eWoWc
 +fkSQbmyXU2IXuHlUP3pd2fhvOgdlmd0lnMu/HwTVPhfPAkGLlzXfPrxND4ShRXJAzJzLNie3Tc
 mSmPPliFSGHsyQfjt7mff+zEL4oADdyyJB76IkH2gvCo1hkv6g032MY8g8iFqxTfx9CKYKL/XvL
 KbF8qeCR1EuxE9K59eXtRSf+QWRiYx2elycEnvFKu4dcgjLa+FCTg==
X-Received: by 2002:a05:6000:178e:b0:385:f44a:a3b with SMTP id
 ffacd0b85a97d-386453fbc58mr130444f8f.41.1733747852447; 
 Mon, 09 Dec 2024 04:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/iT4fmLKeJ7K00LiiDhtP6Su1hZ8lIxqXurPNj68EnoU02xmTI7gUQl3CvAfSj0cGlXBtjg==
X-Received: by 2002:a05:6000:178e:b0:385:f44a:a3b with SMTP id
 ffacd0b85a97d-386453fbc58mr130422f8f.41.1733747852001; 
 Mon, 09 Dec 2024 04:37:32 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38631f73237sm8542192f8f.62.2024.12.09.04.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 05/26] rust: add bindings for interrupt sources
Date: Mon,  9 Dec 2024 13:36:56 +0100
Message-ID: <20241209123717.99077-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5MAoq3YjHkhuv4nV4mtFj_sNP4BM2Za0KKE_TWCQ-fI_1733747853
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:49 -0000

The InterruptSource bindings let us call qemu_set_irq() and sysbus_init_irq()
as safe code.

Interrupt sources, qemu_irq in C code, are pointers to IRQState objects.
They are QOM link properties and can be written to outside the control
of the device (i.e. from a shared reference); therefore they must be
interior-mutable in Rust.  Since thread-safety is provided by the BQL,
what we want here is the newly-introduced BqlCell.  A pointer to the
contents of the BqlCell (an IRQState**, or equivalently qemu_irq*)
is then passed to the C sysbus_init_irq function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 22 ++++----
 rust/qemu-api/meson.build        |  2 +
 rust/qemu-api/src/irq.rs         | 91 ++++++++++++++++++++++++++++++++
 rust/qemu-api/src/lib.rs         |  2 +
 rust/qemu-api/src/sysbus.rs      | 27 ++++++++++
 5 files changed, 134 insertions(+), 10 deletions(-)
 create mode 100644 rust/qemu-api/src/irq.rs
 create mode 100644 rust/qemu-api/src/sysbus.rs

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 317a9b3c5ad..c5c8c463d37 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -13,6 +13,7 @@
     c_str,
     definitions::ObjectImpl,
     device_class::TYPE_SYS_BUS_DEVICE,
+    irq::InterruptSource,
 };
 
 use crate::{
@@ -94,7 +95,7 @@ pub struct PL011State {
     ///  * sysbus IRQ 5: `UARTEINTR` (error interrupt line)
     /// ```
     #[doc(alias = "irq")]
-    pub interrupts: [qemu_irq; 6usize],
+    pub interrupts: [InterruptSource; IRQMASK.len()],
     #[doc(alias = "clk")]
     pub clock: NonNull<Clock>,
     #[doc(alias = "migrate_clk")]
@@ -139,7 +140,8 @@ impl PL011State {
     unsafe fn init(&mut self) {
         const CLK_NAME: &CStr = c_str!("clk");
 
-        let dev = addr_of_mut!(*self).cast::<DeviceState>();
+        let sbd = unsafe { &mut *(addr_of_mut!(*self).cast::<SysBusDevice>()) };
+
         // SAFETY:
         //
         // self and self.iomem are guaranteed to be valid at this point since callers
@@ -153,12 +155,15 @@ unsafe fn init(&mut self) {
                 Self::TYPE_INFO.name,
                 0x1000,
             );
-            let sbd = addr_of_mut!(*self).cast::<SysBusDevice>();
             sysbus_init_mmio(sbd, addr_of_mut!(self.iomem));
-            for irq in self.interrupts.iter_mut() {
-                sysbus_init_irq(sbd, irq);
-            }
         }
+
+        for irq in self.interrupts.iter() {
+            sbd.init_irq(irq);
+        }
+
+        let dev = addr_of_mut!(*self).cast::<DeviceState>();
+
         // SAFETY:
         //
         // self.clock is not initialized at this point; but since `NonNull<_>` is Copy,
@@ -498,10 +503,7 @@ pub fn put_fifo(&mut self, value: c_uint) {
     pub fn update(&self) {
         let flags = self.int_level & self.int_enabled;
         for (irq, i) in self.interrupts.iter().zip(IRQMASK) {
-            // SAFETY: self.interrupts have been initialized in init().
-            unsafe {
-                qemu_set_irq(*irq, i32::from(flags & i != 0));
-            }
+            irq.set(flags & i != 0);
         }
     }
 
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index f8b4cd39a26..b927eb58c8e 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -20,8 +20,10 @@ _qemu_api_rs = static_library(
       'src/c_str.rs',
       'src/definitions.rs',
       'src/device_class.rs',
+      'src/irq.rs',
       'src/offset_of.rs',
       'src/prelude.rs',
+      'src/sysbus.rs',
       'src/vmstate.rs',
       'src/zeroable.rs',
     ],
diff --git a/rust/qemu-api/src/irq.rs b/rust/qemu-api/src/irq.rs
new file mode 100644
index 00000000000..6258141bdf0
--- /dev/null
+++ b/rust/qemu-api/src/irq.rs
@@ -0,0 +1,91 @@
+// Copyright 2024 Red Hat, Inc.
+// Author(s): Paolo Bonzini <pbonzini@redhat.com>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Bindings for interrupt sources
+
+use core::ptr;
+use std::{marker::PhantomData, os::raw::c_int};
+
+use crate::{
+    bindings::{qemu_set_irq, IRQState},
+    prelude::*,
+};
+
+/// Interrupt sources are used by devices to pass changes to a value (typically
+/// a boolean).  The interrupt sink is usually an interrupt controller or
+/// GPIO controller.
+///
+/// As far as devices are concerned, interrupt sources are always active-high:
+/// for example, `InterruptSource<bool>`'s [`raise`](InterruptSource::raise)
+/// method sends a `true` value to the sink.  If the guest has to see a
+/// different polarity, that change is performed by the board between the
+/// device and the interrupt controller.
+///
+/// Interrupts are implemented as a pointer to the interrupt "sink", which has
+/// type [`IRQState`].  A device exposes its source as a QOM link property using
+/// a function such as
+/// [`SysBusDevice::init_irq`](crate::sysbus::SysBusDevice::init_irq), and
+/// initially leaves the pointer to a NULL value, representing an unconnected
+/// interrupt. To connect it, whoever creates the device fills the pointer with
+/// the sink's `IRQState *`, for example using `sysbus_connect_irq`.  Because
+/// devices are generally shared objects, interrupt sources are an example of
+/// the interior mutability pattern.
+///
+/// Interrupt sources can only be triggered under the Big QEMU Lock; `BqlCell`
+/// allows access from whatever thread has it.
+#[derive(Debug)]
+#[repr(transparent)]
+pub struct InterruptSource<T = bool>
+where
+    c_int: From<T>,
+{
+    cell: BqlCell<*mut IRQState>,
+    _marker: PhantomData<T>,
+}
+
+impl InterruptSource<bool> {
+    /// Send a low (`false`) value to the interrupt sink.
+    pub fn lower(&self) {
+        self.set(false);
+    }
+
+    /// Send a high-low pulse to the interrupt sink.
+    pub fn pulse(&self) {
+        self.set(true);
+        self.set(false);
+    }
+
+    /// Send a high (`true`) value to the interrupt sink.
+    pub fn raise(&self) {
+        self.set(true);
+    }
+}
+
+impl<T> InterruptSource<T>
+where
+    c_int: From<T>,
+{
+    /// Send `level` to the interrupt sink.
+    pub fn set(&self, level: T) {
+        let ptr = self.cell.get();
+        // SAFETY: the pointer is retrieved under the BQL and remains valid
+        // until the BQL is released, which is after qemu_set_irq() is entered.
+        unsafe {
+            qemu_set_irq(ptr, level.into());
+        }
+    }
+
+    pub(crate) const fn as_ptr(&self) -> *mut *mut IRQState {
+        self.cell.as_ptr()
+    }
+}
+
+impl Default for InterruptSource {
+    fn default() -> Self {
+        InterruptSource {
+            cell: BqlCell::new(ptr::null_mut()),
+            _marker: PhantomData,
+        }
+    }
+}
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index e5956cd5eb6..0efbef47441 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -16,7 +16,9 @@
 pub mod cell;
 pub mod definitions;
 pub mod device_class;
+pub mod irq;
 pub mod offset_of;
+pub mod sysbus;
 pub mod vmstate;
 pub mod zeroable;
 
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
new file mode 100644
index 00000000000..4e192c75898
--- /dev/null
+++ b/rust/qemu-api/src/sysbus.rs
@@ -0,0 +1,27 @@
+// Copyright 2024 Red Hat, Inc.
+// Author(s): Paolo Bonzini <pbonzini@redhat.com>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+use std::ptr::addr_of;
+
+pub use bindings::{SysBusDevice, SysBusDeviceClass};
+
+use crate::{bindings, cell::bql_locked, irq::InterruptSource};
+
+impl SysBusDevice {
+    /// Return `self` cast to a mutable pointer, for use in calls to C code.
+    const fn as_mut_ptr(&self) -> *mut SysBusDevice {
+        addr_of!(*self) as *mut _
+    }
+
+    /// Expose an interrupt source outside the device as a qdev GPIO output.
+    /// Note that the ordering of calls to `init_irq` is important, since
+    /// whoever creates the sysbus device will refer to the interrupts with
+    /// a number that corresponds to the order of calls to `init_irq`.
+    pub fn init_irq(&self, irq: &InterruptSource) {
+        assert!(bql_locked());
+        unsafe {
+            bindings::sysbus_init_irq(self.as_mut_ptr(), irq.as_ptr());
+        }
+    }
+}
-- 
2.47.1


