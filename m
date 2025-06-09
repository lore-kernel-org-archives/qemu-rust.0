Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uOeg2-0000bQ-E7
	for mharc-qemu-rust@gnu.org; Mon, 09 Jun 2025 11:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOeg0-0000VA-Jp
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefy-0007ip-GR
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749483881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJdTmi7Wq/CYnDjJy94M4C2eH+AHFnXk5byaM7y7ITg=;
 b=DDPfx9gfURqprWUaqvwghgLQlHe34HPO6iUqlQRmf//wgVYTQiuM659AdFTkHEpoKHrE00
 bVnsofSa7/gyQAILlBOZnl1qbz1L0fRTrAMBU1NaRbvhx5vbgK8zMhB3c7uO9S2q0awnVn
 4zSNaBgf1EzrcVq7BdaxuZAAliVDO0k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-EjW73et-PQ-0hzfp5jocfw-1; Mon, 09 Jun 2025 11:44:39 -0400
X-MC-Unique: EjW73et-PQ-0hzfp5jocfw-1
X-Mimecast-MFC-AGG-ID: EjW73et-PQ-0hzfp5jocfw_1749483878
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a52cb5684dso2283936f8f.3
 for <qemu-rust@nongnu.org>; Mon, 09 Jun 2025 08:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749483877; x=1750088677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJdTmi7Wq/CYnDjJy94M4C2eH+AHFnXk5byaM7y7ITg=;
 b=SXgpS+d5rqmM+NwY2JRX6XxI6H6Up9seK4nenQzU28kjytygEkW1eIarckpZ3eixIP
 uG+lRH1030AvBoaZ354SxO3lMxU8ANe0hehUKlM6NH6wL8UkfTJmjdbeh1+qdQFTvqIr
 P/SCTW0ijOiexYPgZp5+C6UAC+5DKJJ7Zr/yo3SWw60Jf08n9aooRxq16dzMnkDVgb4S
 J/0lvjSa7oVkhjAQR/gBPRIs/O57uTd8hOkiA0sZSCsJKqmudIWyH/B6/SmdGu/VczIL
 sezddAQAOTiu2DC/bIHdzrOzXfRjybm0KPEn3yqRtBSqEjU3cZ4fD106VpADAsnbJ0p7
 CKBQ==
X-Gm-Message-State: AOJu0Yxm194oV+ch7zXIUPIJH5D7jnp8KGM0kokN9bPBzJCyJZKzEqOq
 aicXI8MWBCFPNBgaKhJmQO2WsTxF+n+rBppkkvW2xYACiOLdPetj99QJ9GshPeEtDeL2T3Pfpoa
 /KSnp77L2MyLxRJ/ffiBdMKg0QTZJrsLdI+8O5bJzDXCIwCKUhrIyyfdPkBOZtu4=
X-Gm-Gg: ASbGnct8TqKcqH2HC339NwQj+GBJFB60xJhUZG61TRawJj8go8w1RTciKspnXpXOESY
 2/7mlnhl+44h84p1rbz0MWKww4GTS5MZ9Xt/ULoz/ZG1G6ewu9tk6x5ga+kqnw8AdH8rTVcSxoJ
 4havg4ZIUfPQzy7Srk6VlHeOpDvT7J72xlnQmDJYg5TT2rp+ZGk9k2AriEbu7SSvpXqvQwLpD2t
 ZvxBf1wxDesS3exaZzGWBpqhIEiK3YlO3sZGC57+rni1+uovQvg/oXJMITvJScoOK0FZIKQowUO
 Yge1ObnZtKzyTHQWlq+Vp56U
X-Received: by 2002:a05:6000:1787:b0:3a4:e502:81b8 with SMTP id
 ffacd0b85a97d-3a531caf95fmr10762749f8f.43.1749483877096; 
 Mon, 09 Jun 2025 08:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx4j3Fs+EP83RDPqP4md1YaQYyLAVX6E/8VNJ1+RrXZKeUL4o4iIgIHtEBt1GCKhM28JeGPg==
X-Received: by 2002:a05:6000:1787:b0:3a4:e502:81b8 with SMTP id
 ffacd0b85a97d-3a531caf95fmr10762732f8f.43.1749483876586; 
 Mon, 09 Jun 2025 08:44:36 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244fd02sm9723515f8f.75.2025.06.09.08.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:44:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 5/5] rust: qom: change instance_init to take a ParentInit<>
Date: Mon,  9 Jun 2025 17:44:23 +0200
Message-ID: <20250609154423.706056-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609154423.706056-1-pbonzini@redhat.com>
References: <20250609154423.706056-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fYvU4QgO8QYtDwZXY7BeQKLf-Jbzc-v7ftSMLOdFq9M_1749483878
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 09 Jun 2025 15:44:44 -0000

This removes undefined behavior associated to writing to uninitialized
fields, and makes it possible to remove "unsafe" from the instance_init
implementation.

However, the init function itself is still unsafe, because it must promise
(as a sort as MaybeUninit::assume_init) that all fields have been
initialized.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 34 ++++++++++-----------
 rust/hw/timer/hpet/src/device.rs | 16 ++++------
 rust/qemu-api/src/memory.rs      | 12 ++++----
 rust/qemu-api/src/qdev.rs        | 51 ++++++++++++++++++++------------
 rust/qemu-api/src/qom.rs         |  9 ++++--
 5 files changed, 65 insertions(+), 57 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index be8387f6f2d..2d416cd9a3c 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -2,7 +2,7 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::{ffi::CStr, mem::size_of, ptr::addr_of_mut};
+use std::{ffi::CStr, mem::size_of};
 
 use qemu_api::{
     chardev::{CharBackend, Chardev, Event},
@@ -11,9 +11,10 @@
     memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
     prelude::*,
     qdev::{Clock, ClockEvent, DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
-    qom::{ObjectImpl, Owned, ParentField},
+    qom::{ObjectImpl, Owned, ParentField, ParentInit},
     static_assert,
     sysbus::{SysBusDevice, SysBusDeviceImpl},
+    uninit_field_mut,
     vmstate::VMStateDescription,
 };
 
@@ -163,7 +164,7 @@ impl PL011Impl for PL011State {
 impl ObjectImpl for PL011State {
     type ParentType = SysBusDevice;
 
-    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
+    const INSTANCE_INIT: Option<unsafe fn(ParentInit<Self>)> = Some(Self::init);
     const INSTANCE_POST_INIT: Option<fn(&Self)> = Some(Self::post_init);
     const CLASS_INIT: fn(&mut Self::Class) = Self::Class::class_init::<Self>;
 }
@@ -488,7 +489,7 @@ impl PL011State {
     /// `PL011State` type. It must not be called more than once on the same
     /// location/instance. All its fields are expected to hold uninitialized
     /// values with the sole exception of `parent_obj`.
-    unsafe fn init(&mut self) {
+    unsafe fn init(mut this: ParentInit<Self>) {
         static PL011_OPS: MemoryRegionOps<PL011State> = MemoryRegionOpsBuilder::<PL011State>::new()
             .read(&PL011State::read)
             .write(&PL011State::write)
@@ -496,28 +497,23 @@ unsafe fn init(&mut self) {
             .impl_sizes(4, 4)
             .build();
 
-        // SAFETY:
-        //
-        // self and self.iomem are guaranteed to be valid at this point since callers
-        // must make sure the `self` reference is valid.
+        // SAFETY: this and this.iomem are guaranteed to be valid at this point
         MemoryRegion::init_io(
-            unsafe { &mut *addr_of_mut!(self.iomem) },
-            addr_of_mut!(*self),
+            &mut uninit_field_mut!(*this, iomem),
             &PL011_OPS,
             "pl011",
             0x1000,
         );
 
-        self.regs = Default::default();
+        uninit_field_mut!(*this, regs).write(Default::default());
 
-        // SAFETY:
-        //
-        // self.clock is not initialized at this point; but since `Owned<_>` is
-        // not Drop, we can overwrite the undefined value without side effects;
-        // it's not sound but, because for all PL011State instances are created
-        // by QOM code which calls this function to initialize the fields, at
-        // leastno code is able to access an invalid self.clock value.
-        self.clock = self.init_clock_in("clk", &Self::clock_update, ClockEvent::ClockUpdate);
+        let clock = DeviceState::init_clock_in(
+            &mut this,
+            "clk",
+            &Self::clock_update,
+            ClockEvent::ClockUpdate,
+        );
+        uninit_field_mut!(*this, clock).write(clock);
     }
 
     const fn clock_update(&self, _event: ClockEvent) {
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 340ca1d355d..a281927781e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -21,8 +21,8 @@
         hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder, MEMTXATTRS_UNSPECIFIED,
     },
     prelude::*,
-    qdev::{DeviceImpl, DeviceMethods, DeviceState, Property, ResetType, ResettablePhasesImpl},
-    qom::{ObjectImpl, ObjectType, ParentField},
+    qdev::{DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
+    qom::{ObjectImpl, ObjectType, ParentField, ParentInit},
     qom_isa,
     sysbus::{SysBusDevice, SysBusDeviceImpl},
     timer::{Timer, CLOCK_VIRTUAL, NANOSECONDS_PER_SECOND},
@@ -697,7 +697,7 @@ fn set_counter_reg(&self, shift: u32, len: u32, val: u64) {
             .set(self.counter.get().deposit(shift, len, val));
     }
 
-    unsafe fn init(&mut self) {
+    unsafe fn init(mut this: ParentInit<Self>) {
         static HPET_RAM_OPS: MemoryRegionOps<HPETState> =
             MemoryRegionOpsBuilder::<HPETState>::new()
                 .read(&HPETState::read)
@@ -707,18 +707,14 @@ unsafe fn init(&mut self) {
                 .impl_sizes(4, 8)
                 .build();
 
-        // SAFETY:
-        // self and self.iomem are guaranteed to be valid at this point since callers
-        // must make sure the `self` reference is valid.
         MemoryRegion::init_io(
-            unsafe { &mut *addr_of_mut!(self.iomem) },
-            addr_of_mut!(*self),
+            &mut uninit_field_mut!(*this, iomem),
             &HPET_RAM_OPS,
             "hpet",
             HPET_REG_SPACE_LEN,
         );
 
-        Self::init_timers(unsafe { &mut *((self as *mut Self).cast::<MaybeUninit<Self>>()) });
+        Self::init_timers(&mut this);
     }
 
     fn post_init(&self) {
@@ -900,7 +896,7 @@ unsafe impl ObjectType for HPETState {
 impl ObjectImpl for HPETState {
     type ParentType = SysBusDevice;
 
-    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
+    const INSTANCE_INIT: Option<unsafe fn(ParentInit<Self>)> = Some(Self::init);
     const INSTANCE_POST_INIT: Option<fn(&Self)> = Some(Self::post_init);
     const CLASS_INIT: fn(&mut Self::Class) = Self::Class::class_init::<Self>;
 }
diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
index 9ef2694bd62..e40fad6cf19 100644
--- a/rust/qemu-api/src/memory.rs
+++ b/rust/qemu-api/src/memory.rs
@@ -16,6 +16,7 @@
     callbacks::FnCall,
     cell::Opaque,
     prelude::*,
+    uninit::MaybeUninitField,
     zeroable::Zeroable,
 };
 
@@ -147,7 +148,7 @@ impl MemoryRegion {
     #[inline(always)]
     unsafe fn do_init_io(
         slot: *mut bindings::MemoryRegion,
-        owner: *mut Object,
+        owner: *mut bindings::Object,
         ops: &'static bindings::MemoryRegionOps,
         name: &'static str,
         size: u64,
@@ -156,7 +157,7 @@ unsafe fn do_init_io(
             let cstr = CString::new(name).unwrap();
             memory_region_init_io(
                 slot,
-                owner.cast::<bindings::Object>(),
+                owner,
                 ops,
                 owner.cast::<c_void>(),
                 cstr.as_ptr(),
@@ -166,16 +167,15 @@ unsafe fn do_init_io(
     }
 
     pub fn init_io<T: IsA<Object>>(
-        &mut self,
-        owner: *mut T,
+        this: &mut MaybeUninitField<'_, T, Self>,
         ops: &'static MemoryRegionOps<T>,
         name: &'static str,
         size: u64,
     ) {
         unsafe {
             Self::do_init_io(
-                self.0.as_mut_ptr(),
-                owner.cast::<Object>(),
+                this.as_mut_ptr().cast(),
+                MaybeUninitField::parent_mut(this).cast(),
                 &ops.0,
                 name,
                 size,
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 0610959f467..a2a95a4938f 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -19,7 +19,7 @@
     error::{Error, Result},
     irq::InterruptSource,
     prelude::*,
-    qom::{ObjectClass, ObjectImpl, Owned},
+    qom::{ObjectClass, ObjectImpl, Owned, ParentInit},
     vmstate::VMStateDescription,
 };
 
@@ -247,15 +247,9 @@ unsafe impl ObjectType for DeviceState {
 }
 qom_isa!(DeviceState: Object);
 
-/// Trait for methods exposed by the [`DeviceState`] class.  The methods can be
-/// called on all objects that have the trait `IsA<DeviceState>`.
-///
-/// The trait should only be used through the blanket implementation,
-/// which guarantees safety via `IsA`.
-pub trait DeviceMethods: ObjectDeref
-where
-    Self::Target: IsA<DeviceState>,
-{
+/// Initialization methods take a [`ParentInit`] and can be called as
+/// associated functions.
+impl DeviceState {
     /// Add an input clock named `name`.  Invoke the callback with
     /// `self` as the first parameter for the events that are requested.
     ///
@@ -266,12 +260,15 @@ pub trait DeviceMethods: ObjectDeref
     /// which Rust code has a reference to a child object) it would be
     /// possible for this function to return a `&Clock` too.
     #[inline]
-    fn init_clock_in<F: for<'a> FnCall<(&'a Self::Target, ClockEvent)>>(
-        &self,
+    pub fn init_clock_in<T: DeviceImpl, F: for<'a> FnCall<(&'a T, ClockEvent)>>(
+        this: &mut ParentInit<T>,
         name: &str,
         _cb: &F,
         events: ClockEvent,
-    ) -> Owned<Clock> {
+    ) -> Owned<Clock>
+    where
+        T::ParentType: IsA<DeviceState>,
+    {
         fn do_init_clock_in(
             dev: &DeviceState,
             name: &str,
@@ -287,10 +284,10 @@ fn do_init_clock_in(
             unsafe {
                 let cstr = CString::new(name).unwrap();
                 let clk = bindings::qdev_init_clock_in(
-                    dev.as_mut_ptr(),
+                    dev.0.as_mut_ptr(),
                     cstr.as_ptr(),
                     cb,
-                    dev.as_void_ptr(),
+                    dev.0.as_void_ptr(),
                     events.0,
                 );
 
@@ -307,12 +304,12 @@ fn do_init_clock_in(
                 // SAFETY: the opaque is "this", which is indeed a pointer to T
                 F::call((unsafe { &*(opaque.cast::<T>()) }, event))
             }
-            Some(rust_clock_cb::<Self::Target, F>)
+            Some(rust_clock_cb::<T, F>)
         } else {
             None
         };
 
-        do_init_clock_in(self.upcast(), name, cb, events)
+        do_init_clock_in(unsafe { this.upcast_mut() }, name, cb, events)
     }
 
     /// Add an output clock named `name`.
@@ -324,16 +321,32 @@ fn do_init_clock_in(
     /// which Rust code has a reference to a child object) it would be
     /// possible for this function to return a `&Clock` too.
     #[inline]
-    fn init_clock_out(&self, name: &str) -> Owned<Clock> {
+    pub fn init_clock_out<T: DeviceImpl>(this: &mut ParentInit<T>, name: &str) -> Owned<Clock>
+    where
+        T::ParentType: IsA<DeviceState>,
+    {
         unsafe {
             let cstr = CString::new(name).unwrap();
-            let clk = bindings::qdev_init_clock_out(self.upcast().as_mut_ptr(), cstr.as_ptr());
+            // TODO: introduce a type guaranteeing that the DeviceState part has been
+            // initialized
+            let dev: &mut DeviceState = this.upcast_mut();
+            let clk = bindings::qdev_init_clock_out(dev.0.as_mut_ptr(), cstr.as_ptr());
 
             let clk: &Clock = Clock::from_raw(clk);
             Owned::from(clk)
         }
     }
+}
 
+/// Trait for methods exposed by the [`DeviceState`] class.  The methods can be
+/// called on all objects that have the trait `IsA<DeviceState>`.
+///
+/// The trait should only be used through the blanket implementation,
+/// which guarantees safety via `IsA`.
+pub trait DeviceMethods: ObjectDeref
+where
+    Self::Target: IsA<DeviceState>,
+{
     fn prop_set_chr(&self, propname: &str, chr: &Owned<Chardev>) {
         assert!(bql_locked());
         let c_propname = CString::new(propname).unwrap();
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 1481ef20f0c..80a50108e65 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -371,12 +371,15 @@ fn deref_mut(&mut self) -> &mut Self::Target {
 }
 
 unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut bindings::Object) {
-    let mut state = NonNull::new(obj).unwrap().cast::<T>();
+    let mut state = NonNull::new(obj).unwrap().cast::<MaybeUninit<T>>();
+
     // SAFETY: obj is an instance of T, since rust_instance_init<T>
     // is called from QOM core as the instance_init function
     // for class T
     unsafe {
-        T::INSTANCE_INIT.unwrap()(state.as_mut());
+        ParentInit::with(state.as_mut(), |parent_init| {
+            T::INSTANCE_INIT.unwrap()(parent_init);
+        });
     }
 }
 
@@ -643,7 +646,7 @@ pub trait ObjectImpl: ObjectType + IsA<Object> {
     ///
     /// FIXME: The argument is not really a valid reference. `&mut
     /// MaybeUninit<Self>` would be a better description.
-    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = None;
+    const INSTANCE_INIT: Option<unsafe fn(ParentInit<Self>)> = None;
 
     /// Function that is called to finish initialization of an object, once
     /// `INSTANCE_INIT` functions have been called.
-- 
2.49.0


