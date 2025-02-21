Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRu-00081X-F2
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRr-0007nH-7n
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRo-0001VY-Cq
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qAjDlzrSY64BqeVItW5GYtRjxGE8Q/k4KYQ6izQmD4=;
 b=bF9T7YEXSLLSrsNq+ldWxmEaimLi67C6gFjwCcVhFe6Cm3CvQgBX9BJ6561rZTKJDWVrAx
 ufG1Jc4jOXoxLuwVQ19rRY/Xi/krqGiANWINe55MF6LEYxdKBRq/QZMGmllq+I3jzPqRCN
 L1eUzmBDZSe56+dxpZzlwTUYvZC5m1I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-3DumiF9pNWanQdpVsBvvbw-1; Fri, 21 Feb 2025 12:04:17 -0500
X-MC-Unique: 3DumiF9pNWanQdpVsBvvbw-1
X-Mimecast-MFC-AGG-ID: 3DumiF9pNWanQdpVsBvvbw_1740157456
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5de5172cc5bso1824053a12.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157456; x=1740762256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qAjDlzrSY64BqeVItW5GYtRjxGE8Q/k4KYQ6izQmD4=;
 b=KUcIZ1wgmlV+ngZ4My8lUJh8jX2FBXGJZQFWOk5GFCjap/cHkpI7Ysc45CAFSTnXrr
 S4QXqU4hJX8RYQqTlApNsxxnIZPCNfpbzBxUa+UuT15oafks3y0neEzQ9oudbSSp3qtO
 9NyZycMKE64IGyJWX7mdGClxG3UaA6d9wSJ1Euo2herMfq5qADw1pAjRfoYj/U/vCKio
 uPjUcIFEJwT7im/4N2ZruyRHJbixOAhq+kui4bxt7uGFkA+IxvA4cuFZOC9ImHU+cQK9
 g+FAMjI55Cx94NpAdKluSUwxImqkVZ2pqlpbfPUAwxXo0twuSPrhQsts96drv9BgBa3D
 OHyA==
X-Gm-Message-State: AOJu0Yy0JAuswhhU4DtLLC674ZcNCfdaWZyfM74poucLGtqYf+4De/Wz
 vzU0TQAN+elLpLyIzyBRthzxb7S/BLdemTKH3DI0DrjeboK7KBBmG39vq7IEFuq9nKqB451+GW9
 4lY7JocTMQavjNIIX5q6rxU/TNZSeS1YXzoxc9FF9+vCxg+RIvdyHLGjr7jDJNA==
X-Gm-Gg: ASbGnctKUgzNafvF1Nikp78OnLnluB8cgotKQYOdzoWiKfIMyRlacLvq3TYApYJ26v3
 It3+4COVvu2C69/uRR5VlgvYzqy/wWykNpJ9kUe0C7oQ46y9PBINInzO16KsCx5HFGaxQCwZG1V
 aotuN5aaoVflG4zvK5iF2W98qKzdYjk56ONjksUk6qjn+wCrN1UG9sKujzJ5GB3XB5fvFoJ2spc
 u38cWUh39awZb6kaLPPkDrZTGoP6inP2MbdhrMxhQIIH3QAEDiypbKJVPIxk6SY0BRyLYm72KBS
 Bw1sGiz6oHmjmKss8ak=
X-Received: by 2002:a05:6402:388c:b0:5e0:7cc4:ec57 with SMTP id
 4fb4d7f45d1cf-5e0b7266ba5mr7393969a12.31.1740157454277; 
 Fri, 21 Feb 2025 09:04:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF33QoOqgmxmc8LVsNCqEn91wuWdiLttrFTLkpybIl0dvb1Oxi7pSLekqxSW/N32BQEskDCgw==
X-Received: by 2002:a05:6402:388c:b0:5e0:7cc4:ec57 with SMTP id
 4fb4d7f45d1cf-5e0b7266ba5mr7393701a12.31.1740157452298; 
 Fri, 21 Feb 2025 09:04:12 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e07464bcc7sm6856043a12.33.2025.02.21.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 11/15] rust: qdev: wrap Clock and DeviceState with Opaque<>
Date: Fri, 21 Feb 2025 18:03:38 +0100
Message-ID: <20250221170342.63591-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k6sNOhKMC1cOw2d31PT7wSFRgbFIV5TDYSwZT6vGAVM_1740157456
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:23 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/bindings.rs |  6 ----
 rust/qemu-api/src/qdev.rs     | 68 ++++++++++++++++++++++++-----------
 rust/qemu-api/src/vmstate.rs  |  2 +-
 3 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.rs
index be6dd68c09c..6e70a75a0e6 100644
--- a/rust/qemu-api/src/bindings.rs
+++ b/rust/qemu-api/src/bindings.rs
@@ -34,12 +34,6 @@ unsafe impl Sync for CharBackend {}
 unsafe impl Send for Chardev {}
 unsafe impl Sync for Chardev {}
 
-unsafe impl Send for Clock {}
-unsafe impl Sync for Clock {}
-
-unsafe impl Send for DeviceState {}
-unsafe impl Sync for DeviceState {}
-
 unsafe impl Send for MemoryRegion {}
 unsafe impl Sync for MemoryRegion {}
 
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1a4d1f38762..ed5dce08216 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -10,12 +10,12 @@
     ptr::NonNull,
 };
 
-pub use bindings::{Clock, ClockEvent, DeviceClass, DeviceState, Property, ResetType};
+pub use bindings::{ClockEvent, DeviceClass, Property, ResetType};
 
 use crate::{
     bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, Error, ResettableClass},
     callbacks::FnCall,
-    cell::bql_locked,
+    cell::{bql_locked, Opaque},
     chardev::Chardev,
     irq::InterruptSource,
     prelude::*,
@@ -23,6 +23,22 @@
     vmstate::VMStateDescription,
 };
 
+/// A safe wrapper around [`bindings::Clock`].
+#[repr(transparent)]
+#[derive(Debug, qemu_api_macros::Wrapper)]
+pub struct Clock(Opaque<bindings::Clock>);
+
+unsafe impl Send for Clock {}
+unsafe impl Sync for Clock {}
+
+/// A safe wrapper around [`bindings::DeviceState`].
+#[repr(transparent)]
+#[derive(Debug, qemu_api_macros::Wrapper)]
+pub struct DeviceState(Opaque<bindings::DeviceState>);
+
+unsafe impl Send for DeviceState {}
+unsafe impl Sync for DeviceState {}
+
 /// Trait providing the contents of the `ResettablePhases` struct,
 /// which is part of the QOM `Resettable` interface.
 pub trait ResettablePhasesImpl {
@@ -117,7 +133,10 @@ fn vmsd() -> Option<&'static VMStateDescription> {
 /// We expect the FFI user of this function to pass a valid pointer that
 /// can be downcasted to type `T`. We also expect the device is
 /// readable/writeable from one thread at any time.
-unsafe extern "C" fn rust_realize_fn<T: DeviceImpl>(dev: *mut DeviceState, _errp: *mut *mut Error) {
+unsafe extern "C" fn rust_realize_fn<T: DeviceImpl>(
+    dev: *mut bindings::DeviceState,
+    _errp: *mut *mut Error,
+) {
     let state = NonNull::new(dev).unwrap().cast::<T>();
     T::REALIZE.unwrap()(unsafe { state.as_ref() });
 }
@@ -251,7 +270,7 @@ fn init_clock_in<F: for<'a> FnCall<(&'a Self::Target, ClockEvent)>>(
         events: ClockEvent,
     ) -> Owned<Clock> {
         fn do_init_clock_in(
-            dev: *mut DeviceState,
+            dev: &DeviceState,
             name: &str,
             cb: Option<unsafe extern "C" fn(*mut c_void, ClockEvent)>,
             events: ClockEvent,
@@ -265,14 +284,15 @@ fn do_init_clock_in(
             unsafe {
                 let cstr = CString::new(name).unwrap();
                 let clk = bindings::qdev_init_clock_in(
-                    dev,
+                    dev.0.as_mut_ptr(),
                     cstr.as_ptr(),
                     cb,
-                    dev.cast::<c_void>(),
+                    dev.0.as_void_ptr(),
                     events.0,
                 );
 
-                Owned::from(&*clk)
+                let clk: &Clock = Clock::from_raw(clk);
+                Owned::from(clk)
             }
         }
 
@@ -289,7 +309,7 @@ fn do_init_clock_in(
             None
         };
 
-        do_init_clock_in(self.as_mut_ptr(), name, cb, events)
+        do_init_clock_in(self.upcast(), name, cb, events)
     }
 
     /// Add an output clock named `name`.
@@ -304,9 +324,10 @@ fn do_init_clock_in(
     fn init_clock_out(&self, name: &str) -> Owned<Clock> {
         unsafe {
             let cstr = CString::new(name).unwrap();
-            let clk = bindings::qdev_init_clock_out(self.as_mut_ptr(), cstr.as_ptr());
+            let clk = bindings::qdev_init_clock_out(self.upcast().as_mut_ptr(), cstr.as_ptr());
 
-            Owned::from(&*clk)
+            let clk: &Clock = Clock::from_raw(clk);
+            Owned::from(clk)
         }
     }
 
@@ -314,7 +335,11 @@ fn prop_set_chr(&self, propname: &str, chr: &Owned<Chardev>) {
         assert!(bql_locked());
         let c_propname = CString::new(propname).unwrap();
         unsafe {
-            bindings::qdev_prop_set_chr(self.as_mut_ptr(), c_propname.as_ptr(), chr.as_mut_ptr());
+            bindings::qdev_prop_set_chr(
+                self.upcast().as_mut_ptr(),
+                c_propname.as_ptr(),
+                chr.as_mut_ptr(),
+            );
         }
     }
 
@@ -323,8 +348,17 @@ fn init_gpio_in<F: for<'a> FnCall<(&'a Self::Target, u32, u32)>>(
         num_lines: u32,
         _cb: F,
     ) {
-        let _: () = F::ASSERT_IS_SOME;
+        fn do_init_gpio_in(
+            dev: &DeviceState,
+            num_lines: u32,
+            gpio_in_cb: unsafe extern "C" fn(*mut c_void, c_int, c_int),
+        ) {
+            unsafe {
+                qdev_init_gpio_in(dev.as_mut_ptr(), Some(gpio_in_cb), num_lines as c_int);
+            }
+        }
 
+        let _: () = F::ASSERT_IS_SOME;
         unsafe extern "C" fn rust_irq_handler<T, F: for<'a> FnCall<(&'a T, u32, u32)>>(
             opaque: *mut c_void,
             line: c_int,
@@ -337,19 +371,13 @@ fn init_gpio_in<F: for<'a> FnCall<(&'a Self::Target, u32, u32)>>(
         let gpio_in_cb: unsafe extern "C" fn(*mut c_void, c_int, c_int) =
             rust_irq_handler::<Self::Target, F>;
 
-        unsafe {
-            qdev_init_gpio_in(
-                self.as_mut_ptr::<DeviceState>(),
-                Some(gpio_in_cb),
-                num_lines as c_int,
-            );
-        }
+        do_init_gpio_in(self.upcast(), num_lines, gpio_in_cb);
     }
 
     fn init_gpio_out(&self, pins: &[InterruptSource]) {
         unsafe {
             qdev_init_gpio_out(
-                self.as_mut_ptr::<DeviceState>(),
+                self.upcast().as_mut_ptr(),
                 InterruptSource::slice_as_ptr(pins),
                 pins.len() as c_int,
             );
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 24a4dc81e7f..b115d1f8742 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -469,7 +469,7 @@ macro_rules! vmstate_clock {
                 $crate::assert_field_type!(
                     $struct_name,
                     $field_name,
-                    $crate::qom::Owned<$crate::bindings::Clock>
+                    $crate::qom::Owned<$crate::qdev::Clock>
                 );
                 $crate::offset_of!($struct_name, $field_name)
             },
-- 
2.48.1


