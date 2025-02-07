Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgLQ4-0007V7-41
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 05:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPn-0007ND-SK
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPl-00048X-NS
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738923409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPLe8n7w4lU+JK6BULn/ii43xbBtY2BZigYuJPo3FFQ=;
 b=Vhi8oDyhnybSOyEpMaWOG9zvL5SH3T7wgaGY7bQ5+ZPeVVojUwDyebMmuxmxZK5ikO5m7H
 BqApAx5JZz0u6qzfndrYph9pNXCTAL+O+wQrcrV9znmBKtcy4qyWtxG551dds6Y5LxMM9w
 ivkueamXc8awd7voEeQ0VS7bcsLwGIE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-uZN1rV19N76cyg2eZl930Q-1; Fri, 07 Feb 2025 05:16:47 -0500
X-MC-Unique: uZN1rV19N76cyg2eZl930Q-1
X-Mimecast-MFC-AGG-ID: uZN1rV19N76cyg2eZl930Q
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5da15447991so1637848a12.3
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 02:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923406; x=1739528206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPLe8n7w4lU+JK6BULn/ii43xbBtY2BZigYuJPo3FFQ=;
 b=f4iKKiUWPDs8Jhysn/s0jXkKRdha4G86aDd24sIJ3poW7OM+/yJyV84UMJk9B2eb2L
 SVL9RqWrmAnwAhV2HYU2aMsKpOzdLlc2Bdr90o7R/BU5RIUrQPQxABu/HTkLDaG9MrVY
 FRl0gBJL6sBw0y1YRu3VBaaA6iXW93eGbo4V1EZ82AA8CbgImynM8xdBrUU9t9drg1Yb
 48whKBUqt1cisrhrldwj3gTy8ZrEdvNMnEjhXb1uocLX2qTHQ1xNmC+o28ZDn1vLAVzR
 V55CZjqfeiEtKAF5ADbMSjWLaaCtL6KEbT4ReIZVj5+1Pl1cvUjALAaro7qcW7uaxBaA
 IdqA==
X-Gm-Message-State: AOJu0Yxx6gUJy15GPcVSr5RVlA+rGXB8PIa25YPgwd3+DcLU95v0oD7x
 AC4ax/VNhltlv2wlyZCzk+RzlZghLk8s4pN9qHsk9jGen/T9Do0cxB7ZSr4wJpy7Lzeq+XEL7eE
 lsQ0H9HrEOt4NVGpo1UqkxkPA7LdP5a+osNGkaPywfMGYVcX2sfg=
X-Gm-Gg: ASbGncup45Ll8Gh2A3zXGH4gwNh1BZVNl36tti1dUYAsHdUuW0mB+HveBsl+1wnIj46
 GXinL4fFrm45fFWkRJ3vJOUiZL8o8Jq8tYLGchRO3fNiOws9kJCVUuxdq+9kkZqxRVe5nNa8bcZ
 ubPSakj6lF9dxtDJGUKUGKUkxMGcFvH7Utw+e4RSnRrJM5hLJo9wE74gwDQYpVRMVz+i7dHlbqj
 oOKhHINq8k07QfuS4S9mIjzy4sE616/7Knh37LEE2f2mzjrqbLRLpTCAS/u+bGvTdyysCNuIIfH
 5FwpgA==
X-Received: by 2002:a05:6402:4588:b0:5db:e91a:6baf with SMTP id
 4fb4d7f45d1cf-5de45015f49mr7206858a12.14.1738923406378; 
 Fri, 07 Feb 2025 02:16:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyLaRlLhMDi0sic2b81oIjyoDiKQ8HxFyoPHsUiHz/TTRI0oQR/+PmMjzhrWK8g7PQ3Zf3VQ==
X-Received: by 2002:a05:6402:4588:b0:5db:e91a:6baf with SMTP id
 4fb4d7f45d1cf-5de45015f49mr7206826a12.14.1738923405955; 
 Fri, 07 Feb 2025 02:16:45 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf6c9f904sm2276175a12.58.2025.02.07.02.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:16:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 04/12] rust: qdev: add clock creation
Date: Fri,  7 Feb 2025 11:16:15 +0100
Message-ID: <20250207101623.2443552-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207101623.2443552-1-pbonzini@redhat.com>
References: <20250207101623.2443552-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sj9yK6IMbsRwT7kgKB5V4DK8Y84_nypOBSdaeKNjrlc_1738923407
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
X-List-Received-Date: Fri, 07 Feb 2025 10:16:59 -0000

Add a Rust version of qdev_init_clock_in, which can be used in
instance_init.  There are a couple differences with the C
version:

- in Rust the object keeps its own reference to the clock (in addition to
  the one embedded in the NamedClockList), and the reference is dropped
  automatically by instance_finalize(); this is encoded in the signature
  of DeviceClassMethods::init_clock_in, which makes the lifetime of the
  clock independent of that of the object it holds.  This goes unnoticed
  in the C version and is due to the existence of aliases.

- also, anything that happens during instance_init uses the pinned_init
  framework to operate on a partially initialized object, and is done
  through class methods (i.e. through DeviceClassMethods rather than
  DeviceMethods) because the device does not exist yet.  Therefore, Rust
  code *must* create clocks from instance_init, which is stricter than C.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  43 +++++-------
 rust/qemu-api/src/prelude.rs     |   2 +
 rust/qemu-api/src/qdev.rs        | 109 ++++++++++++++++++++++++++++++-
 rust/qemu-api/src/vmstate.rs     |   4 +-
 4 files changed, 127 insertions(+), 31 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index f5db114b0c7..37936a328b8 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -10,17 +10,16 @@
 
 use qemu_api::{
     bindings::{
-        error_fatal, hwaddr, memory_region_init_io, qdev_init_clock_in, qdev_prop_set_chr,
-        qemu_chr_fe_accept_input, qemu_chr_fe_ioctl, qemu_chr_fe_set_handlers,
-        qemu_chr_fe_write_all, qemu_irq, sysbus_connect_irq, sysbus_mmio_map, sysbus_realize,
-        CharBackend, Chardev, Clock, ClockEvent, MemoryRegion, QEMUChrEvent,
-        CHR_IOCTL_SERIAL_SET_BREAK,
+        error_fatal, hwaddr, memory_region_init_io, qdev_prop_set_chr, qemu_chr_fe_accept_input,
+        qemu_chr_fe_ioctl, qemu_chr_fe_set_handlers, qemu_chr_fe_write_all, qemu_irq,
+        sysbus_connect_irq, sysbus_mmio_map, sysbus_realize, CharBackend, Chardev, MemoryRegion,
+        QEMUChrEvent, CHR_IOCTL_SERIAL_SET_BREAK,
     },
     c_str, impl_vmstate_forward,
     irq::InterruptSource,
     prelude::*,
-    qdev::{DeviceImpl, DeviceState, Property},
-    qom::{ClassInitImpl, ObjectImpl, ParentField},
+    qdev::{Clock, ClockEvent, DeviceImpl, DeviceState, Property},
+    qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
     sysbus::{SysBusDevice, SysBusDeviceClass},
     vmstate::VMStateDescription,
 };
@@ -131,7 +130,7 @@ pub struct PL011State {
     #[doc(alias = "irq")]
     pub interrupts: [InterruptSource; IRQMASK.len()],
     #[doc(alias = "clk")]
-    pub clock: NonNull<Clock>,
+    pub clock: Owned<Clock>,
     #[doc(alias = "migrate_clk")]
     pub migrate_clock: bool,
 }
@@ -485,8 +484,6 @@ impl PL011State {
     /// location/instance. All its fields are expected to hold unitialized
     /// values with the sole exception of `parent_obj`.
     unsafe fn init(&mut self) {
-        const CLK_NAME: &CStr = c_str!("clk");
-
         // SAFETY:
         //
         // self and self.iomem are guaranteed to be valid at this point since callers
@@ -506,22 +503,16 @@ unsafe fn init(&mut self) {
 
         // SAFETY:
         //
-        // self.clock is not initialized at this point; but since `NonNull<_>` is Copy,
-        // we can overwrite the undefined value without side effects. This is
-        // safe since all PL011State instances are created by QOM code which
-        // calls this function to initialize the fields; therefore no code is
-        // able to access an invalid self.clock value.
-        unsafe {
-            let dev: &mut DeviceState = self.upcast_mut();
-            self.clock = NonNull::new(qdev_init_clock_in(
-                dev,
-                CLK_NAME.as_ptr(),
-                None, /* pl011_clock_update */
-                addr_of_mut!(*self).cast::<c_void>(),
-                ClockEvent::ClockUpdate.0,
-            ))
-            .unwrap();
-        }
+        // self.clock is not initialized at this point; but since `Owned<_>` is
+        // not Drop, we can overwrite the undefined value without side effects;
+        // it's not sound but, because for all PL011State instances are created
+        // by QOM code which calls this function to initialize the fields, at
+        // leastno code is able to access an invalid self.clock value.
+        self.clock = self.init_clock_in("clk", &Self::clock_update, ClockEvent::ClockUpdate);
+    }
+
+    const fn clock_update(&self, _event: ClockEvent) {
+        /* pl011_trace_baudrate_change(s); */
     }
 
     fn post_init(&self) {
diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
index 3df6a5c21ec..87e3ce90f26 100644
--- a/rust/qemu-api/src/prelude.rs
+++ b/rust/qemu-api/src/prelude.rs
@@ -7,6 +7,8 @@
 pub use crate::cell::BqlCell;
 pub use crate::cell::BqlRefCell;
 
+pub use crate::qdev::DeviceMethods;
+
 pub use crate::qom::IsA;
 pub use crate::qom::Object;
 pub use crate::qom::ObjectCast;
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index f4c75c752f1..8f6744c5e26 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -4,14 +4,20 @@
 
 //! Bindings to create devices and access device functionality from Rust.
 
-use std::{ffi::CStr, ptr::NonNull};
+use std::{
+    ffi::{CStr, CString},
+    os::raw::c_void,
+    ptr::NonNull,
+};
 
-pub use bindings::{DeviceClass, DeviceState, Property};
+pub use bindings::{Clock, ClockEvent, DeviceClass, DeviceState, Property};
 
 use crate::{
     bindings::{self, Error},
+    callbacks::FnCall,
+    cell::bql_locked,
     prelude::*,
-    qom::{ClassInitImpl, ObjectClass},
+    qom::{ClassInitImpl, ObjectClass, Owned},
     vmstate::VMStateDescription,
 };
 
@@ -143,3 +149,100 @@ unsafe impl ObjectType for DeviceState {
         unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_DEVICE) };
 }
 qom_isa!(DeviceState: Object);
+
+/// Trait for methods exposed by the [`DeviceState`] class.  The methods can be
+/// called on all objects that have the trait `IsA<DeviceState>`.
+///
+/// The trait should only be used through the blanket implementation,
+/// which guarantees safety via `IsA`.
+pub trait DeviceMethods: ObjectDeref
+where
+    Self::Target: IsA<DeviceState>,
+{
+    /// Add an input clock named `name`.  Invoke the callback with
+    /// `self` as the first parameter for the events that are requested.
+    ///
+    /// The resulting clock is added as a child of `self`, but it also
+    /// stays alive until after `Drop::drop` is called because C code
+    /// keeps an extra reference to it until `device_finalize()` calls
+    /// `qdev_finalize_clocklist()`.  Therefore (unlike most cases in
+    /// which Rust code has a reference to a child object) it would be
+    /// possible for this function to return a `&Clock` too.
+    #[inline]
+    fn init_clock_in<F: for<'a> FnCall<(&'a Self::Target, ClockEvent)>>(
+        &self,
+        name: &str,
+        _cb: &F,
+        events: ClockEvent,
+    ) -> Owned<Clock> {
+        fn do_init_clock_in(
+            dev: *mut DeviceState,
+            name: &str,
+            cb: Option<unsafe extern "C" fn(*mut c_void, ClockEvent)>,
+            events: ClockEvent,
+        ) -> Owned<Clock> {
+            assert!(bql_locked());
+
+            // SAFETY: the clock is heap allocated, but qdev_init_clock_in()
+            // does not gift the reference to its caller; so use Owned::from to
+            // add one.  The callback is disabled automatically when the clock
+            // is unparented, which happens before the device is finalized.
+            unsafe {
+                let cstr = CString::new(name).unwrap();
+                let clk = bindings::qdev_init_clock_in(
+                    dev,
+                    cstr.as_ptr(),
+                    cb,
+                    dev.cast::<c_void>(),
+                    events.0,
+                );
+
+                Owned::from(&*clk)
+            }
+        }
+
+        let cb: Option<unsafe extern "C" fn(*mut c_void, ClockEvent)> = if F::is_some() {
+            unsafe extern "C" fn rust_clock_cb<T, F: for<'a> FnCall<(&'a T, ClockEvent)>>(
+                opaque: *mut c_void,
+                event: ClockEvent,
+            ) {
+                // SAFETY: the opaque is "this", which is indeed a pointer to T
+                F::call((unsafe { &*(opaque.cast::<T>()) }, event))
+            }
+            Some(rust_clock_cb::<Self::Target, F>)
+        } else {
+            None
+        };
+
+        // SAFETY: self can be cast to DeviceState because its type has an
+        // IsA<DeviceState> bound.
+        do_init_clock_in(unsafe { self.as_mut_ptr() }, name, cb, events)
+    }
+
+    /// Add an output clock named `name`.
+    ///
+    /// The resulting clock is added as a child of `self`, but it also
+    /// stays alive until after `Drop::drop` is called because C code
+    /// keeps an extra reference to it until `device_finalize()` calls
+    /// `qdev_finalize_clocklist()`.  Therefore (unlike most cases in
+    /// which Rust code has a reference to a child object) it would be
+    /// possible for this function to return a `&Clock` too.
+    #[inline]
+    fn init_clock_out(&self, name: &str) -> Owned<Clock> {
+        unsafe {
+            let cstr = CString::new(name).unwrap();
+            let clk = bindings::qdev_init_clock_out(self.as_mut_ptr(), cstr.as_ptr());
+
+            Owned::from(&*clk)
+        }
+    }
+}
+
+impl<R: ObjectDeref> DeviceMethods for R where R::Target: IsA<DeviceState> {}
+
+unsafe impl ObjectType for Clock {
+    type Class = ObjectClass;
+    const TYPE_NAME: &'static CStr =
+        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_CLOCK) };
+}
+qom_isa!(Clock: Object);
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 11d21b8791c..164effc6553 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -470,11 +470,11 @@ macro_rules! vmstate_clock {
                 $crate::assert_field_type!(
                     $struct_name,
                     $field_name,
-                    core::ptr::NonNull<$crate::bindings::Clock>
+                    $crate::qom::Owned<$crate::bindings::Clock>
                 );
                 $crate::offset_of!($struct_name, $field_name)
             },
-            size: ::core::mem::size_of::<*const $crate::bindings::Clock>(),
+            size: ::core::mem::size_of::<*const $crate::qdev::Clock>(),
             flags: VMStateFlags(VMStateFlags::VMS_STRUCT.0 | VMStateFlags::VMS_POINTER.0),
             vmsd: unsafe { ::core::ptr::addr_of!($crate::bindings::vmstate_clock) },
             ..$crate::zeroable::Zeroable::ZERO
-- 
2.48.1


