Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCp-0001bP-LI
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCd-0001Y1-O9
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCb-0002Cf-NT
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oahqCqM04zU6SgnyH8PstMyxlymjpkN8kciJN6RaKAY=;
 b=OKWeEVIk3aYh7z86xn3p8anm+7kNIOq9HCCif0u2HkRUYpk+NASiRzaiBfjlYFYj/QHs/d
 aiyLrY6w5nYrOJyT1Cp8ev/TUmzT4IN0CcybmR+AZyKsFFQ3HQJ/wOX3oRSBZXca3yJgE6
 6ferTQKL8uKSLUEouCGsISU6pgP4TPw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-vsZRNPv1N7aqMvRWSyUcRA-1; Fri, 17 Jan 2025 14:40:19 -0500
X-MC-Unique: vsZRNPv1N7aqMvRWSyUcRA-1
X-Mimecast-MFC-AGG-ID: vsZRNPv1N7aqMvRWSyUcRA
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa6732a1af5so281315666b.3
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142817; x=1737747617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oahqCqM04zU6SgnyH8PstMyxlymjpkN8kciJN6RaKAY=;
 b=YlqvJ7ACRjpyYFu9JsbszhhtjgdYMDciAGcyCmyIA+IRyJzhrXYlX/yKTzDaHit6Cj
 CqAE+Yuf8lSuw3KZYiOdOIXjmyoPTOVzxFrm5vDpwuazIy2nytenenaR+B6wkLDmuv7Y
 VQm3CxCT5ctJbT1UNiS4ItsgtmM8dHyEzisfA+Rw6Rwn6gCtMmEQYxkoCSdeykjlzg7N
 V/2Sw9r2jx1bMEKXpIAtAVrN8Rovde5B1OgvEW7ur7rcDP4LwlJmdSdtKCLLzz+PPp+S
 f1/hzs3JxhQ9dFg99dyHIg05HI5qSP1ZEoG70NMiERhJCm0VeE4n8l/U1F+e8285sv4d
 Rj1Q==
X-Gm-Message-State: AOJu0YydU6MJgZHKR3HTBTfmDSQ+0125dTbHUOYWsFRpasc2BnvdWIyb
 YIguMF5MorlVoqkMsvVUXCJvcBzZlsdjy/25uqCCnoxyM46NPqsv5YFRGYdK5uwO/n8ias7/XE9
 MQJYWwq2yzIxFMG2Dc8InNZo/CcOEP6WqoChu2kfvPQEQdTj9ZE48r1Vkwh1UIQ==
X-Gm-Gg: ASbGncvWB9Cb205SvGN706pVvY+3lcvmmKo9EC2LmmUEjabbK/GBY9XUo0lK/Gr2PrW
 2guw1C1qaceGwqvQaCPUjx6wFwj9mHqJd0zHxppfNpCyGBKnwZzW7ZeOf+g4esByYfWRQg5G4uD
 y6sf67WqFA1/CN+ENftIYowdZJOJltGHOYy90uGDPFpDQxzBf/HQVbqWGWoSGbwjFQc6na+9M0M
 EkR9+DLvlorNHPjdlka8kQGdPzQDILLS2uSnjvnnN/dc3i0VsTn/FPdCefLCg==
X-Received: by 2002:a17:907:971a:b0:aa6:66eb:9c06 with SMTP id
 a640c23a62f3a-ab38b1e207bmr357684366b.5.1737142817089; 
 Fri, 17 Jan 2025 11:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFosYdYhimjMiswhnSJuuOa2F6TozlgWSH1f1nUqSoanZQZX5mubtd8TH4IUPY4KsN3mmKDPg==
X-Received: by 2002:a17:907:971a:b0:aa6:66eb:9c06 with SMTP id
 a640c23a62f3a-ab38b1e207bmr357682166b.5.1737142816563; 
 Fri, 17 Jan 2025 11:40:16 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce1bacsm220451766b.53.2025.01.17.11.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 05/10] rust: qdev: add clock creation
Date: Fri, 17 Jan 2025 20:39:58 +0100
Message-ID: <20250117194003.1173231-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rct000HPNP14wna6lSjaauE7FVpDCEk-09wcf1HcsKA_1737142818
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.79,
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:34 -0000

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
 rust/hw/char/pl011/src/device.rs | 28 +++++-------
 rust/qemu-api/src/prelude.rs     |  2 +
 rust/qemu-api/src/qdev.rs        | 76 ++++++++++++++++++++++++++++++--
 rust/qemu-api/src/vmstate.rs     |  4 +-
 4 files changed, 87 insertions(+), 23 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index d8409f3d310..dfe199ad0ed 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -13,8 +13,8 @@
     c_str, impl_vmstate_forward,
     irq::InterruptSource,
     prelude::*,
-    qdev::DeviceImpl,
-    qom::{ClassInitImpl, ObjectImpl, ParentField},
+    qdev::{Clock, ClockEvent, DeviceImpl},
+    qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
 };
 
 use crate::{
@@ -123,7 +123,7 @@ pub struct PL011State {
     #[doc(alias = "irq")]
     pub interrupts: [InterruptSource; IRQMASK.len()],
     #[doc(alias = "clk")]
-    pub clock: NonNull<Clock>,
+    pub clock: Owned<Clock>,
     #[doc(alias = "migrate_clk")]
     pub migrate_clock: bool,
 }
@@ -487,8 +487,6 @@ impl PL011State {
     /// location/instance. All its fields are expected to hold unitialized
     /// values with the sole exception of `parent_obj`.
     unsafe fn init(&mut self) {
-        const CLK_NAME: &CStr = c_str!("clk");
-
         // SAFETY:
         //
         // self and self.iomem are guaranteed to be valid at this point since callers
@@ -508,22 +506,16 @@ unsafe fn init(&mut self) {
 
         // SAFETY:
         //
-        // self.clock is not initialized at this point; but since `NonNull<_>` is Copy,
-        // we can overwrite the undefined value without side effects. This is
+        // self.clock is not initialized at this point; but since `NonNull<_>` is
+        // not Drop, we can overwrite the undefined value without side effects. This is
         // safe since all PL011State instances are created by QOM code which
         // calls this function to initialize the fields; therefore no code is
         // able to access an invalid self.clock value.
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
index 4658409bebb..f573712550e 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -4,14 +4,19 @@
 
 //! Bindings to create devices and access device functionality from Rust.
 
-use std::ffi::CStr;
+use std::{
+    ffi::{CStr, CString},
+    os::raw::c_void,
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
 
@@ -145,3 +150,68 @@ unsafe impl ObjectType for DeviceState {
         unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_DEVICE) };
 }
 qom_isa!(DeviceState: Object);
+
+pub trait DeviceMethods: ObjectDeref
+where
+    Self::Target: IsA<DeviceState>,
+{
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
+            // SAFETY: the clock is heap allocated and does not have a reference, so
+            // Owned::from adds one.  the callback is disabled automatically
+            // when the clock is unparented, which happens before the device is
+            // finalized.
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
2.47.1


