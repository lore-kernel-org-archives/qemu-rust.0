Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCt-0001f7-I3
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCs-0001dE-81
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCo-0002E4-P3
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bcokY2+woAr9GlmKaOrfVb07DGACuR0xqvBoQA4nFo=;
 b=Pm1W3FQ4gr+SBEgoWfNw37PKYV6aenjDYPgSy34kAqF5UKBYaMTExDCMWEjc/n5F8MIOYm
 FwkqWUUXGz4uPrCXNDqwLYYgriB76nqE65juOfF8vKVTU4lKiLDssRcTR7wfmirmkpq+kb
 NeaUNT58nj1WqALviohl10dyEem8S6w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-9NqbVjVTNjma80Uovg6iJw-1; Fri, 17 Jan 2025 14:40:28 -0500
X-MC-Unique: 9NqbVjVTNjma80Uovg6iJw-1
X-Mimecast-MFC-AGG-ID: 9NqbVjVTNjma80Uovg6iJw
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa6a7bea04cso189677966b.3
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142826; x=1737747626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bcokY2+woAr9GlmKaOrfVb07DGACuR0xqvBoQA4nFo=;
 b=n0BkHbOk8I3jTvl/8p6XMPD77Nx9Q/byvyWwZAN7hqKwFi5Y5AAIIG8SEBOteNFiIE
 uRof8sqHecdvJFJ/0zILHUBXrLs9FzrHQwAtboxT58BpE2MziZVRi+XxNIxHGnTpL5zM
 fOt2Ogfi4/5x7OjeXyaP75VP0mm005Hhrw7a67Ac3rfy7MBlH4wYocM5iNX0wcZNBuGF
 bjaw8qPRa0wnepMFxIeFUIrwltg5ypkI66//Sic8os4LI/09NmuZMC3nmHeXpk9Vshlz
 +4u5a/lhoAUjqBBuscicZ1LlkM+yr/jz7QRKDYFLxG4v3rLQwyCEh+C6BurYc/AfRXqZ
 66WA==
X-Gm-Message-State: AOJu0Yw6s7rsK29KY/yqpgkUn1y4Q7wuNGX5sYC1zR7JymuWSmGO6E3V
 6OubLIQVQ/WDAELD/gS9Ff+eavTz7cfK6U5eP7aIbdM4eD85/aln/3bEanH0T96aiNasMLJfXFQ
 zFQ1KzdQzCMco47fkJmoOXDbhXDxjNN/hqTz3TbyVYu10hu12cbE8vUxHtjtUBQ==
X-Gm-Gg: ASbGnctcbcQhjNA/aZsITFQxq8YjIkl3rtKyjfPwVqw21Bm2LN8hpb2K5R17mGRprq2
 lVlzI0Z9H87A00Fl4Shx4JP8bWUWYc8/MLfSd/jL/h76ZVo63W4JnN4jCvTgSibppEDXCnWdGoO
 CNgtPN5sTZJRa1Zdtry8U/sbO3j5lemjdbYlSHOlqhMKViGvvFafH+tUot7dhd04Es9uuDsvJ8e
 7PG8t2cDUrw6oHYp6geDTMLgjF/cEnu91wYyvyoZYE5BoUIt6hT5Riz/hxD+Q==
X-Received: by 2002:a17:907:6d17:b0:aab:f8e8:53ce with SMTP id
 a640c23a62f3a-ab38b191b7amr406421166b.11.1737142825786; 
 Fri, 17 Jan 2025 11:40:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDN8ziIeDECHBOQB5Iy4qolTVUmxdj1Q7ykud1FPn+USOIuSaz+o2LlCHThwP3Mgba5PVONg==
X-Received: by 2002:a17:907:6d17:b0:aab:f8e8:53ce with SMTP id
 a640c23a62f3a-ab38b191b7amr406418166b.11.1737142825274; 
 Fri, 17 Jan 2025 11:40:25 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c5ad98sm218413666b.28.2025.01.17.11.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 08/10] rust: qdev: switch from legacy reset to Resettable
Date: Fri, 17 Jan 2025 20:40:01 +0100
Message-ID: <20250117194003.1173231-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Txwssm2dREOyvmEPdHLXssq3R4de1xJncr7BUOHpnfI_1737142827
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:38 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                      |   1 +
 rust/hw/char/pl011/src/device.rs |  10 ++-
 rust/qemu-api/src/qdev.rs        | 116 ++++++++++++++++++++++++-------
 rust/qemu-api/tests/tests.rs     |   5 +-
 4 files changed, 102 insertions(+), 30 deletions(-)

diff --git a/meson.build b/meson.build
index d06f59095c6..2d9fa87af83 100644
--- a/meson.build
+++ b/meson.build
@@ -4065,6 +4065,7 @@ if have_rust
     'MigrationPriority',
     'QEMUChrEvent',
     'QEMUClockType',
+    'ResetType',
     'device_endian',
     'module_init_type',
   ]
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index dfe199ad0ed..259efacb046 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -13,7 +13,7 @@
     c_str, impl_vmstate_forward,
     irq::InterruptSource,
     prelude::*,
-    qdev::{Clock, ClockEvent, DeviceImpl},
+    qdev::{Clock, ClockEvent, DeviceImpl, ResettablePhasesImpl, ResetType},
     qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
 };
 
@@ -164,7 +164,10 @@ fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&device_class::VMSTATE_PL011)
     }
     const REALIZE: Option<fn(&mut Self)> = Some(Self::realize);
-    const RESET: Option<fn(&Self)> = Some(Self::reset);
+}
+
+impl ResettablePhasesImpl for PL011State {
+    const HOLD: Option<fn(&Self, ResetType)> = Some(Self::reset_hold);
 }
 
 impl PL011Registers {
@@ -601,7 +604,7 @@ pub fn realize(&mut self) {
         }
     }
 
-    pub fn reset(&self) {
+    pub fn reset_hold(&self, _type: ResetType) {
         self.regs.borrow_mut().reset();
     }
 
@@ -723,3 +726,4 @@ impl ObjectImpl for PL011Luminary {
 }
 
 impl DeviceImpl for PL011Luminary {}
+impl ResettablePhasesImpl for PL011Luminary {}
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index ab883e2faef..8f0b279003a 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -9,19 +9,83 @@
     os::raw::c_void,
 };
 
-pub use bindings::{Clock, ClockEvent, DeviceClass, DeviceState, Property};
+pub use bindings::{Clock, ClockEvent, DeviceClass, DeviceState, Property, ResetType};
 
 use crate::{
-    bindings::{self, Error},
+    bindings::{self, Error, ResettableClass},
     callbacks::FnCall,
     cell::bql_locked,
     prelude::*,
-    qom::{ClassInitImpl, ObjectClass, Owned},
+    qom::{ClassInitImpl, ObjectClass, ObjectImpl, Owned},
     vmstate::VMStateDescription,
 };
 
+/// Trait providing the contents of [`ResettablePhases`].
+pub trait ResettablePhasesImpl {
+    /// If not None, this is called when the object enters reset. It
+    /// can reset local state of the object, but it must not do anything that
+    /// has a side-effect on other objects, such as raising or lowering a
+    /// [`qemu_irq`] line or reading or writing guest memory. It takes the
+    /// reset's type as argument.
+    const ENTER: Option<fn(&Self, ResetType)> = None;
+
+    /// If not None, this is called when the object for entry into reset, once
+    /// every object in the system which is being reset has had its
+    /// @phases.enter method called. At this point devices can do actions
+    /// that affect other objects.
+    ///
+    /// If in doubt, implement this method.
+    const HOLD: Option<fn(&Self, ResetType)> = None;
+
+    /// If not None, this phase is called when the object leaves the reset
+    /// state. Actions affecting other objects are permitted.
+    const EXIT: Option<fn(&Self, ResetType)> = None;
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_resettable_enter_fn<T: ResettablePhasesImpl>(
+    obj: *mut Object,
+    typ: ResetType,
+) {
+    assert!(!obj.is_null());
+    let state = obj.cast::<T>();
+    T::ENTER.unwrap()(unsafe { &mut *state }, typ);
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_resettable_hold_fn<T: ResettablePhasesImpl>(
+    obj: *mut Object,
+    typ: ResetType,
+) {
+    assert!(!obj.is_null());
+    let state = obj.cast::<T>();
+    T::HOLD.unwrap()(unsafe { &mut *state }, typ);
+}
+
+/// # Safety
+///
+/// We expect the FFI user of this function to pass a valid pointer that
+/// can be downcasted to type `T`. We also expect the device is
+/// readable/writeable from one thread at any time.
+unsafe extern "C" fn rust_resettable_exit_fn<T: ResettablePhasesImpl>(
+    obj: *mut Object,
+    typ: ResetType,
+) {
+    assert!(!obj.is_null());
+    let state = obj.cast::<T>();
+    T::EXIT.unwrap()(unsafe { &mut *state }, typ);
+}
+
 /// Trait providing the contents of [`DeviceClass`].
-pub trait DeviceImpl: ObjectImpl {
+pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl {
     /// _Realization_ is the second stage of device creation. It contains
     /// all operations that depend on device properties and can fail (note:
     /// this is not yet supported for Rust devices).
@@ -30,13 +94,6 @@ pub trait DeviceImpl: ObjectImpl {
     /// with the function pointed to by `REALIZE`.
     const REALIZE: Option<fn(&mut Self)> = None;
 
-    /// If not `None`, the parent class's `reset` method is overridden
-    /// with the function pointed to by `RESET`.
-    ///
-    /// Rust does not yet support the three-phase reset protocol; this is
-    /// usually okay for leaf classes.
-    const RESET: Option<fn(&Self)> = None;
-
     /// An array providing the properties that the user can set on the
     /// device.  Not a `const` because referencing statics in constants
     /// is unstable until Rust 1.83.0.
@@ -65,30 +122,36 @@ fn vmsd() -> Option<&'static VMStateDescription> {
     T::REALIZE.unwrap()(unsafe { &mut *state });
 }
 
-/// # Safety
-///
-/// We expect the FFI user of this function to pass a valid pointer that
-/// can be downcasted to type `T`. We also expect the device is
-/// readable/writeable from one thread at any time.
-unsafe extern "C" fn rust_reset_fn<T: DeviceImpl>(dev: *mut DeviceState) {
-    assert!(!dev.is_null());
-    let state = dev.cast::<T>();
-    T::RESET.unwrap()(unsafe { &mut *state });
+unsafe impl InterfaceType for ResettableClass {
+    const TYPE_NAME: &'static CStr =
+        unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_RESETTABLE_INTERFACE) };
+}
+
+impl<T> ClassInitImpl<ResettableClass> for T
+where
+    T: ResettablePhasesImpl,
+{
+    fn class_init(rc: &mut ResettableClass) {
+        if <T as ResettablePhasesImpl>::ENTER.is_some() {
+            rc.phases.enter = Some(rust_resettable_enter_fn::<T>);
+        }
+        if <T as ResettablePhasesImpl>::HOLD.is_some() {
+            rc.phases.hold = Some(rust_resettable_hold_fn::<T>);
+        }
+        if <T as ResettablePhasesImpl>::EXIT.is_some() {
+            rc.phases.exit = Some(rust_resettable_exit_fn::<T>);
+        }
+    }
 }
 
 impl<T> ClassInitImpl<DeviceClass> for T
 where
-    T: ClassInitImpl<ObjectClass> + DeviceImpl,
+    T: ClassInitImpl<ObjectClass> + ClassInitImpl<ResettableClass> + DeviceImpl,
 {
     fn class_init(dc: &mut DeviceClass) {
         if <T as DeviceImpl>::REALIZE.is_some() {
             dc.realize = Some(rust_realize_fn::<T>);
         }
-        if <T as DeviceImpl>::RESET.is_some() {
-            unsafe {
-                bindings::device_class_set_legacy_reset(dc, Some(rust_reset_fn::<T>));
-            }
-        }
         if let Some(vmsd) = <T as DeviceImpl>::vmsd() {
             dc.vmsd = vmsd;
         }
@@ -99,6 +162,7 @@ fn class_init(dc: &mut DeviceClass) {
             }
         }
 
+        ResettableClass::interface_init::<T, DeviceState>(dc);
         <T as ClassInitImpl<ObjectClass>>::class_init(&mut dc.parent_class);
     }
 }
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 1944e65c8f3..178041ffaae 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -13,7 +13,7 @@
     cell::{self, BqlCell},
     declare_properties, define_property,
     prelude::*,
-    qdev::{DeviceClass, DeviceImpl, DeviceState, Property},
+    qdev::{DeviceClass, DeviceImpl, DeviceState, Property, ResettablePhasesImpl},
     qom::{ClassInitImpl, ObjectImpl, ParentField},
     vmstate::VMStateDescription,
     zeroable::Zeroable,
@@ -61,6 +61,8 @@ impl ObjectImpl for DummyState {
     const ABSTRACT: bool = false;
 }
 
+impl ResettablePhasesImpl for DummyState {}
+
 impl DeviceImpl for DummyState {
     fn properties() -> &'static [Property] {
         &DUMMY_PROPERTIES
@@ -101,6 +103,7 @@ impl ObjectImpl for DummyChildState {
     const ABSTRACT: bool = false;
 }
 
+impl ResettablePhasesImpl for DummyChildState {}
 impl DeviceImpl for DummyChildState {}
 
 impl ClassInitImpl<DummyClass> for DummyChildState {
-- 
2.47.1


